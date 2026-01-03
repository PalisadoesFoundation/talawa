# Overview for `Encryptor`

## Description

Handles all of the encryption tasks in the codebase.

## Members

- **shouldEncrypt**: `bool`
  A global switch to flag the encryption.

 Since adding encryption invalidates all of the previous
 data, disabling it by default will help in keeping
 other contributors working without any issue.
 TODO: Remove this and make encryption default.

