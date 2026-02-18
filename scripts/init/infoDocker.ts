// scripts/askDocker.ts
import { confirm, isCancel, cancel, spinner } from '@clack/prompts';
import { writeFileSync } from 'node:fs';
import { join } from 'node:path';

export async function promptForDocker(): Promise<boolean> {
  const answer = await confirm({
    message:
      '🛠️  Does this plugin include a heavy component that should run in Docker?',
    initialValue: false,
  });

  if (isCancel(answer)) {
    cancel('Operation cancelled.');
    process.exit(0);
  }

  return answer as boolean;
}
