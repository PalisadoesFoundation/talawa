# Overview for `NextCommand`

## Description

Command to proceed from one [pb.ReleasePhase] to the next.

 After `conductor start`, the rest of the release steps are initiated by the
 user via `conductor next`. Thus this command's behavior is conditional upon
 which phase of the release the user is currently in. This is implemented
 with a switch case statement.

## Dependencies

- Command

## Members

- **checkouts**: `Checkouts`
## Constructors

### Unnamed Constructor


