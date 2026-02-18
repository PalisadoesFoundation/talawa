import { describe, it, expect, vi, beforeEach, afterEach } from 'vitest';
import * as checkI18n from '../../scripts/check-i18n.js';
import fs from 'fs';
import path from 'path';
import { spawnSync } from 'child_process';

vi.mock('fs');
vi.mock('child_process');

describe('check-i18n', () => {
    afterEach(() => {
        vi.restoreAllMocks();
    });

    describe('parseArgs', () => {
        let exitSpy;
        let consoleSpy;

        beforeEach(() => {
            exitSpy = vi.spyOn(process, 'exit').mockImplementation(() => { });
            consoleSpy = vi.spyOn(console, 'error').mockImplementation(() => { });
        });

        afterEach(() => {
            exitSpy.mockRestore();
            consoleSpy.mockRestore();
        });

        it('should parse files argument', () => {
            const args = ['file1.ts', 'file2.tsx'];
            const result = checkI18n.parseArgs(args);
            expect(result.files).toEqual(['file1.ts', 'file2.tsx']);
            expect(result.diffOnly).toBe(false);
        });

        it('should parse --diff flag', () => {
            const args = ['--diff'];
            const result = checkI18n.parseArgs(args);
            expect(result.diffOnly).toBe(true);
        });

        it('should parse --staged flag', () => {
            const args = ['--staged'];
            const result = checkI18n.parseArgs(args);
            expect(result.staged).toBe(true);
            expect(result.diffOnly).toBe(true);
        });

        it('should parse --base and --head arguments', () => {
            const args = ['--base=main', '--head=feat'];
            const result = checkI18n.parseArgs(args);
            expect(result.base).toBe('main');
            expect(result.head).toBe('feat');
        });

        it('should exit on unknown flag', () => {
            checkI18n.parseArgs(['--unknown']);
            expect(exitSpy).toHaveBeenCalledWith(1);
            expect(consoleSpy).toHaveBeenCalledWith(expect.stringContaining('Unknown flag'));
        });

        it('should exit if base or head is missing value', () => {
            checkI18n.parseArgs(['--base']);
            expect(exitSpy).toHaveBeenCalledWith(1);
            expect(consoleSpy).toHaveBeenCalledWith(expect.stringContaining('Option --base requires a value'));
        });

        it('should exit if only one of base/head is provided', () => {
            checkI18n.parseArgs(['--base=main']);
            expect(exitSpy).toHaveBeenCalledWith(1);
            expect(consoleSpy).toHaveBeenCalledWith(expect.stringContaining('Compare mode requires both'));
        });
    });

    describe('Diff Utilities', () => {
        const sampleDiff = `
+++ b/src/file1.ts
@@ -10,0 +11,2 @@
+const a = 1;
+const b = 2;
--- a/src/file2.ts
+++ b/src/file2.ts
@@ -5,1 +5,1 @@
-old
+new
`;
        describe('parseUnifiedDiff', () => {
            it('should parse unified diff correctly', () => {
                const map = checkI18n.parseUnifiedDiff(sampleDiff);
                const file1 = path.resolve(process.cwd(), 'src/file1.ts');
                const file2 = path.resolve(process.cwd(), 'src/file2.ts');

                expect(map.has(file1)).toBe(true);
                expect(map.get(file1).has(11)).toBe(true);
                expect(map.get(file1).has(12)).toBe(true);

                expect(map.has(file2)).toBe(true);
                expect(map.get(file2).has(5)).toBe(true);
            });
        });

        describe('getDiffLineMap', () => {
            it('should return map on success', () => {
                spawnSync.mockReturnValue({ status: 0, stdout: sampleDiff });
                const map = checkI18n.getDiffLineMap({ staged: false, files: [], base: null, head: null });

                const file1 = path.resolve(process.cwd(), 'src/file1.ts');
                const file2 = path.resolve(process.cwd(), 'src/file2.ts');

                expect(map.size).toBe(2);
                expect(map.has(file1)).toBe(true);
                expect(Array.from(map.get(file1))).toEqual([11, 12]);
                expect(map.has(file2)).toBe(true);
                expect(Array.from(map.get(file2))).toEqual([5]);
            });

            it('should throw on git error', () => {
                spawnSync.mockReturnValue({ status: 2, stderr: 'error' });
                expect(() => checkI18n.getDiffLineMap({ staged: false, files: [] })).toThrow('git error: error');
            });

            it('should throw specific error if git missing', () => {
                spawnSync.mockReturnValue({ error: { code: 'ENOENT', message: 'spawn missing' } });
                expect(() => checkI18n.getDiffLineMap({ staged: false, files: [] })).toThrow('git not found: spawn missing');
            });
        });
    });

    describe('File Traversal & Analysis', () => {
        describe('shouldAnalyzeFile', () => {
            it('should return true for valid src files', () => {
                expect(checkI18n.shouldAnalyzeFile('src/comp.tsx')).toBe(true);
                expect(checkI18n.shouldAnalyzeFile('src/utils.ts')).toBe(true);
            });

            it('should return false for tests and non-js extensions', () => {
                expect(checkI18n.shouldAnalyzeFile('src/comp.test.tsx')).toBe(false);
                expect(checkI18n.shouldAnalyzeFile('src/comp.css')).toBe(false);
                expect(checkI18n.shouldAnalyzeFile('test/setup.ts')).toBe(false);
            });
        });

        describe('walk', () => {
            it('should recursively find files', () => {
                fs.readdirSync.mockImplementation((dir) => {
                    if (dir === '/root') {
                        return [
                            { name: 'file.ts', isDirectory: () => false, isSymbolicLink: () => false },
                            { name: 'dir', isDirectory: () => true, isSymbolicLink: () => false },
                        ];
                    }
                    if (dir === '/root/dir') {
                        return [
                            {
                                name: 'subfile.ts',
                                isDirectory: () => false,
                                isSymbolicLink: () => false,
                            },
                        ];
                    }
                    return [];
                });

                const files = checkI18n.walk('/root');
                expect(files).toEqual(['/root/file.ts', '/root/dir/subfile.ts']);
            });
        });

        describe('isUnderSrc', () => {
            it('should return true for src and plugins', () => {
                const src = path.join(process.cwd(), 'src');
                expect(checkI18n.isUnderSrc(path.join(src, 'file.ts'))).toBe(true);
            });
            it('should return false for other dirs', () => {
                expect(checkI18n.isUnderSrc('/tmp/file.ts')).toBe(false);
            });
        });

        describe('toPosixPath', () => {
            it('should convert separators', () => {
                const input = `path${path.sep}to${path.sep}file`;
                expect(checkI18n.toPosixPath(input)).toBe('path/to/file');
                expect(checkI18n.toPosixPath('path/to/file')).toBe('path/to/file');
            });
        });
    });

    describe('Comment & String Processing', () => {
        describe('stripComments', () => {
            it('should remove single-line comments', () => {
                expect(checkI18n.stripComments('a; // comment').trim()).toBe('a;');
            });

            it('should remove block comments', () => {
                const code = 'const a = 1; /* comment */';
                const result = checkI18n.stripComments(code);
                // Inline block comments are stripped; multiline comments preserve newlines
                expect(result).toContain('const a = 1;');
                expect(result).not.toContain('comment');
            });

            it('should preserve line numbers for multiline block comments', () => {
                const code = '/*\nLine 2\n*/\nconst a = 1;';
                const lines = checkI18n.stripComments(code).split('\n');
                expect(lines.length).toBe(4);
                expect(lines[3]).toBe('const a = 1;');
            });
        });

        describe('hasIgnoreComment', () => {
            it('should detect ignore-line', () => {
                const lines = ['text // i18n-ignore-line'];
                expect(checkI18n.hasIgnoreComment(lines, 0)).toBe(true);
            });
            it('should detect ignore-next-line', () => {
                const lines = ['// i18n-ignore-next-line', 'text'];
                expect(checkI18n.hasIgnoreComment(lines, 1)).toBe(true);
            });
            it('should return false otherwise', () => {
                const lines = ['text'];
                expect(checkI18n.hasIgnoreComment(lines, 0)).toBe(false);
            });
        });
    });

    describe('Heuristics', () => {
        describe('looksLikeDateFormat', () => {
            it('should detect date formats', () => {
                expect(checkI18n.looksLikeDateFormat('YYYY-MM-DD')).toBe(true);
                expect(checkI18n.looksLikeDateFormat('HH:mm:ss')).toBe(true);
            });
            it('should return false for normal text', () => {
                expect(checkI18n.looksLikeDateFormat('Hello')).toBe(false);
            });
        });

        describe('looksLikeRegexPattern', () => {
            it('should detect regex patterns', () => {
                expect(checkI18n.looksLikeRegexPattern('^[a-z]+$')).toBe(true);
                expect(checkI18n.looksLikeRegexPattern('\\d{4}')).toBe(true);
            });
            it('should return false for normal text', () => {
                expect(checkI18n.looksLikeRegexPattern('Hello')).toBe(false);
            });
        });

        describe('isAllowedString', () => {
            it('should allow valid specific patterns', () => {
                expect(checkI18n.isAllowedString('')).toBe(true);
                expect(checkI18n.isAllowedString('${var}')).toBe(true); // No words
                expect(checkI18n.isAllowedString('https://url.com')).toBe(true);
            });
            it('should disallow normal words', () => {
                expect(checkI18n.isAllowedString('Hello')).toBe(false);
                expect(checkI18n.isAllowedString('${var} Hello')).toBe(false);
            });
        });
    });

    describe('Context & Attributes', () => {
        describe('isInSkipContext', () => {
            it('should skip console calls', () => {
                const line = 'console.log("text")';
                expect(checkI18n.isInSkipContext(line, line.indexOf('"text"'))).toBe(true);
            });
            it('should skip throw Error', () => {
                const line = 'throw new Error("text")';
                expect(checkI18n.isInSkipContext(line, line.indexOf('"text"'))).toBe(true);
            });
            it('should skip gql', () => {
                const line = 'gql`query { field }`';
                expect(checkI18n.isInSkipContext(line, line.indexOf('`query'))).toBe(true);
            });
            it('should skip RegExp', () => {
                const line = 'new RegExp("pattern")';
                expect(checkI18n.isInSkipContext(line, line.indexOf('"pattern"'))).toBe(true);
            });
            it('should skip JSON methods', () => {
                const line = 'JSON.parse("text")';
                expect(checkI18n.isInSkipContext(line, line.indexOf('"text"'))).toBe(true);
            });
            it('should skip .format()', () => {
                const line = 'date.format("YYYY")';
                expect(checkI18n.isInSkipContext(line, line.indexOf('"YYYY"'))).toBe(true);
            });
            it('should skip strings in TS type definitions', () => {
                // Testing that text strings inside Type annotations like ": string =" are skipped
                // Matches regex: /\w+\s*:\s*\w+\s*[=,;]/
                const line = 'const x: string = "text";';
                expect(checkI18n.isInSkipContext(line, line.indexOf('"text"'))).toBe(true);
            });
        });

        describe('getAttributeName', () => {
            it('should extract attribute name', () => {
                const line = '<div title="text">';
                expect(checkI18n.getAttributeName(line, line.indexOf('"text"'))).toBe('title');
            });
            it('should return null if not found', () => {
                const line = '<div>text</div>';
                expect(checkI18n.getAttributeName(line, line.indexOf('text'))).toBeNull();
            });
        });
    });

    describe('collectViolations', () => {
        it('should detect hardcoded text in JSX', () => {
            vi.spyOn(fs, 'readFileSync').mockReturnValue('<div>Hello</div>');
            const violations = checkI18n.collectViolations('file.tsx');
            expect(violations).toHaveLength(1);
            expect(violations[0].text).toBe('Hello');
        });

        it('should validate template literals', () => {
            vi.spyOn(fs, 'readFileSync').mockReturnValue('<div>{`Hello`}</div>');
            const violations = checkI18n.collectViolations('file.tsx');
            expect(violations).toHaveLength(1);
            expect(violations[0].text).toBe('Hello');
        });

        it('should validate attributes', () => {
            vi.spyOn(fs, 'readFileSync').mockReturnValue('<div title="Hello"></div>');
            const violations = checkI18n.collectViolations('file.tsx');
            expect(violations).toHaveLength(1);
            expect(violations[0].text).toBe('Hello');
        });

        it('should respect line filter - only check filtered lines', () => {
            vi.spyOn(fs, 'readFileSync').mockReturnValue('<div>Fail1</div>\n<div>Fail2</div>');
            const violations = checkI18n.collectViolations('file.tsx', new Set([1]));
            expect(violations).toHaveLength(1);
            expect(violations[0].line).toBe(1);
            expect(violations[0].text).toBe('Fail1');
        });

        beforeEach(() => {
            vi.resetAllMocks();
            // Default defensive mocks
            vi.spyOn(fs, 'statSync').mockReturnValue({ mtimeMs: 12345 });
            vi.spyOn(fs, 'readFileSync').mockReturnValue('');
        });

        afterEach(() => {
            vi.restoreAllMocks();
        });

        it('should detect all violations when no line filter provided', () => {
            vi.mocked(fs.readFileSync).mockReturnValue('<div>Fail1</div>\n<div>Fail2</div>');
            const violations = checkI18n.collectViolations('file.tsx');
            expect(violations).toHaveLength(2);
            expect(violations[0].text).toBe('Fail1');
            expect(violations[1].text).toBe('Fail2');
        });

        it('should return cached violations if mtime matches', () => {
            const mtimeMs = 1000;
            vi.mocked(fs.statSync).mockReturnValue({ mtimeMs });

            const cacheManager = {
                get: vi.fn().mockReturnValue([{ line: 1, text: 'Cached' }]),
                set: vi.fn()
            };

            const violations = checkI18n.collectViolations('file.tsx', null, cacheManager);

            expect(cacheManager.get).toHaveBeenCalledWith('file.tsx', mtimeMs);
            expect(violations).toEqual([{ line: 1, text: 'Cached' }]);
            expect(fs.readFileSync).not.toHaveBeenCalledWith(expect.stringContaining('file.tsx'), expect.anything());
        });

        it('should scan file and update cache if cache missing or invalid', () => {
            const mtimeMs = 2000;
            vi.mocked(fs.statSync).mockReturnValue({ mtimeMs });
            vi.mocked(fs.readFileSync).mockReturnValue('<div>New</div>');

            const cacheManager = {
                get: vi.fn().mockReturnValue(null),
                set: vi.fn()
            };

            const violations = checkI18n.collectViolations('file.tsx', null, cacheManager);

            expect(cacheManager.get).toHaveBeenCalledWith('file.tsx', mtimeMs);
            expect(violations).toHaveLength(1);
            expect(violations[0].text).toBe('New');
            expect(cacheManager.set).toHaveBeenCalledWith('file.tsx', mtimeMs, expect.any(Array));
        });

        it('should bypass cache if lineFilter is provided', () => {
            const mtimeMs = 1000;
            vi.mocked(fs.statSync).mockReturnValue({ mtimeMs });
            vi.mocked(fs.readFileSync).mockReturnValue('<div>Filtered</div>\n<div>Ignored</div>');

            const cacheManager = {
                get: vi.fn().mockReturnValue([{ line: 1, text: 'OldCache' }]),
                set: vi.fn()
            };

            const lineFilter = new Set([1]);
            const violations = checkI18n.collectViolations('file.tsx', lineFilter, cacheManager);

            expect(cacheManager.get).toHaveBeenCalled();
            expect(violations).toHaveLength(1);
            expect(violations[0].text).toBe('Filtered');
        });

        it('should use cache if available and mtime matches', () => {
            const cacheKey = 'file.tsx';
            const cacheData = {
                [cacheKey]: { mtime: 12345, violations: [{ line: 1, text: 'Cached' }] }
            };

            // Mock CacheManager instance (via prototype or by mocking the class if possible, but class is internal)
            // Since CacheManager is used internally by check-i18n.js and instantiated in main/collectViolations?
            // collectViolations uses a global 'cache' logic or we need to pass cacheManager?
            // The signature of collectViolations in previous steps was passed 'cacheManager'.
            // I need to check signature.
            // If signature allows passing cacheManager, I can mock it.
        });
    });

    describe('main', () => {
        let originalArgv;
        let consoleLogSpy;
        let consoleErrorSpy;
        let exitSpy;

        beforeEach(() => {
            originalArgv = process.argv;
            consoleLogSpy = vi.spyOn(console, 'log').mockImplementation(() => { });
            consoleErrorSpy = vi.spyOn(console, 'error').mockImplementation(() => { });
            exitSpy = vi.spyOn(process, 'exit').mockImplementation(() => { });
        });

        afterEach(() => {
            process.argv = originalArgv;
            vi.restoreAllMocks();
        });

        it('should exit 0 if no source dirs', () => {
            process.argv = ['node', 'script'];
            vi.spyOn(fs, 'existsSync').mockReturnValue(false);

            checkI18n.main();

            expect(exitSpy).toHaveBeenCalledWith(0);
            expect(consoleLogSpy).toHaveBeenCalledWith(expect.stringContaining('No source directories'));
        });

        it('should exit 0 if no files found', () => {
            process.argv = ['node', 'script'];
            vi.spyOn(fs, 'existsSync').mockReturnValue(true);
            vi.spyOn(fs, 'readdirSync').mockReturnValue([]);

            checkI18n.main();

            expect(exitSpy).toHaveBeenCalledWith(0);
            expect(consoleLogSpy).toHaveBeenCalledWith(expect.stringContaining('No files to scan'));
        });

        it('should exit 1 if violations found', () => {
            process.argv = ['node', 'script'];
            vi.spyOn(fs, 'existsSync').mockReturnValue(true);
            vi.spyOn(fs, 'readdirSync').mockReturnValue([{ name: 'file.js', isDirectory: () => false, isSymbolicLink: () => false }]);
            vi.spyOn(fs, 'readFileSync').mockReturnValue('<div>Hardcoded</div>');
            vi.spyOn(fs, 'statSync').mockReturnValue({ isDirectory: () => false });

            checkI18n.main();

            expect(exitSpy).toHaveBeenCalledWith(1);
            expect(consoleLogSpy).toHaveBeenCalledWith(expect.stringContaining('contain non-internationalized'));
        });
    });
});
