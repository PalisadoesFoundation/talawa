# Method: `list`

## Description

Lists the sub-directories and files of this [Directory].

 Optionally recurses into sub-directories.

 If [followLinks] is `false`, then any symbolic links found
 are reported as [Link] objects, rather than as directories or files,
 and are not recursed into.

 If [followLinks] is `true`, then working links are reported as
 directories or files, depending on what they point to,
 and links to directories are recursed into if [recursive] is `true`.

 Broken links are reported as [Link] objects.

 If a symbolic link makes a loop in the file system, then a recursive
 listing will not follow a link twice in the
 same recursive descent, but will report it as a [Link]
 the second time it is seen.

 The result is a [Stream] of [FileSystemEntity] objects for the
 directories, files, and links. The [Stream] will be in an arbitrary
 order and does not include the special entries `'.'` and `'..'`.

## Return Type
`Stream&lt;FileSystemEntity&gt;`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
