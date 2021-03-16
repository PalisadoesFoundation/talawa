# Admin Features

![](RackMultipart20210316-4-14pufun_html_237499165a11f2b9.gif)

[Overall Guidance](#_hqgxp4vhui04)

[Feature 01: Send Messages to all members in an Organization](#_agnpktdt1sng)

[Overview](#_oykielwb06ys)

[Problem](#_w984sna6ff01)

[Goals](#_pquetcmhwmwg)

[Out of Scope](#_va6roaj8u12w)

[People and Roles](#_pnh5wubj3217)

[Context](#_vstx7cqnw537)

[Use Cases](#_3eht9g8h2uri)

[Proposal/Solution](#_mbridisnpp09)

[User Experience](#_ijyfmzkek5lw)

[Important Details To Capture](#_xjuwjki34f0t)

[Future Work](#_dxy7ati54bb4)

[Tasks and Timeline](#_wbydpnqvxyz1)

[Feature 02: Creating organizational events](#_k1u0em3catez)

[Overview](#_gonyqfly4tko)

[Problem](#_585o6ctyhc16)

[Goals](#_ogyeqt34m6gn)

[Out of Scope](#_if1nidgsuxm5)

[People and Roles](#_97wogo7goyfc)

[Context](#_efqmwo66l7av)

[Use Cases](#_yblk2cpouzvo)

[Proposal/Solution](#_n116rw78tv8u)

[User Experience](#_cl1pkc8nvqxi)

[Important Details To Capture](#_gsytfet2m7rk)

[Future Work](#_hnqeggoi821k)

[Tasks and Timeline](#_120rsfyb6wle)

[Feature 02: Creating organizational events](#_azvs8tu5yucz)

[Overview](#_k4uz4wh4dr9z)

![](RackMultipart20210316-4-14pufun_html_237499165a11f2b9.gif)

## Overall Guidance

We will assume that at least one person in the organization has access to a traditional computer device with a non-mobile size screen to help them do administrative tasks via the portal.

Administrators will also need to be able to do some portal tasks from their phones such as:

1. Sending organization wide messages
2. Creating organizational events
3. Adding Co-ordinators

## Feature 01: Send Messages to all members in an Organization

_Authored by_ _ **Shannika Jackson** __. Last updated on_ _ **March 14,2021** _

This feature aims to _ **enhance the admin role** _ by _ **allowing admin users to send messages to an entire organization** _.

## Overview

### Problem

1. **Messaging can now be sent only directly from one user to another :**
  1. The admins in an organization can only send direct messages
  2. The need exists to communicate instantly with all members of an organisation

### Goals

1. **Administrators for an organization must be able to send messages to all members in the organization:** This is to facilitate organizational notices and updates.

### Out of Scope

The following are aspects of this feature which have been considered but are outside of the scope for the current project:

1. **Group messaging for roles within an event :** This feature is detailed under the Admin Portal requirement features.
2. **Message history for organization wide messages :** This is the ability to see from the admin portal the history of organization-wide messages sent for a period.
3. **Scheduled sending of organization wide messages :** This is the ability to send organization wide messages automatically based on a scheduled date. This will be useful as reminders for upcoming events and other notices

### People and Roles

The following are the primary roles foreseen in the development of this feature

1. **Feature Lead** : will review proposed solutions, acceptance and close feature

## Context

NA

### Use Cases

NA

## Proposal/Solution

### User Experience

1. An organization&#39;s administrator should be presented with a create message button from the organisation&#39;s admin portal.
2. When clicked, (s)he is presented with the option to message the organization.
3. The message to the organization then appears in the admin portals chat screen.
4. In the admin portal&#39;s chat screen a button should be presented to resend organization wide message

### Important Details To Capture

NA

### Future Work

Items mentioned in the Out of Scope section will form the basis for future work to be done on this feature

## Tasks and Timeline

TBD

## Feature 02: Creating organizational events

_Authored by_ _ **Shannika Jackson** __. Last updated on_ _ **March 14,2021** _

This feature aims to _ **enhance the admin portal** _ by _ **allowing admin users to create events under an organization** _.

## Overview

### Problem

1. **All persons can create an event:**
  1. proposed Only administrators should be able to create events under the organization.

### Goals

1. **An organization&#39;s administrator must be able to create an event:** This will form the basis of interactions between users.

### Out of Scope

The following are aspects of this feature which have been considered but are outside of the scope for the current project:

1. **Show personal events different than organization events :** this should offer some delineation that this event is being organized/ hosted by the organization
2. **Display all events in organisation on a calendar :** The admin would presumably be able to manage any event created under the organization - monitoring newsfeed, delete/ cancel view attendance/ statistics for that event
3. **Invite specific members to the event:** This may eventually include sending external invitations to download the app.

1. **Task calendar:** This may be useful for members involved in different events. Their tasks displayed on a calendar according to the due date for the task and its related events
  1. Display colours to indicate nearing due date for tasks
2. **Review and Delete members&#39; personal events:** the admin may have need to delete members&#39; personal events under the organization. This will remove the event and all its tasks and send a notification to the co-ordinator that the event was deleted

### People and Roles

The following are the primary roles foreseen in the development of this feature

1. **Feature Lead** : will review proposed solutions, acceptance and close feature

## Context

NA

### Use Cases

NA

## Proposal/Solution

### User Experience

1. From the admin portal in the web client and the mobile app, a button is presented to create an event.
2. The admin specifies if it is a private or public event
3. Basic details such as the date, time and venue for the event is specified
4. An event co-ordinator is selected and assigned from the member list for the organization
  1. A task list can be specified by the admin or the event co-ordinator.
5. A checklist of required tasks for the event is optional with due date relative to the event
  1. Assignment of these tasks to members of the organization
  2. Notification is sent to the member that a task is assigned to them
  3. Tasks assigned to the member is updated in their personal task list
  4. As the member completes the task and checks it as complete
    1. Notification is sent to co-ordinator of completed task
6. Push notification sent to all members on attendee list once event date and time arrives

### Important Details To Capture

NA

### Future Work

Items mentioned in the Out of scope section will form the basis for future work to be done on this feature

## Tasks and Timeline

TBD

## Feature 03: Creating organizational events

_Authored by_ _ **Shannika Jackson** __. Last updated on_ _ **March 14,2021** _

## Overview

See feature XX in Account Features Document