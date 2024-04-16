/// 'eventsDemoData' is a list of events that are used to display the events in the app.
///
/// Each event has the following properties:
/// - title: The title of the event.
/// - description: The description of the event.
/// - location: The location of the event.
/// - recurring: Whether the event is recurring or not.
/// - allDay: Whether the event is an all-day event or not.
/// - startDate: The start date of the event.
/// - endDate: The end date of the event.
/// - startTime: The start time of the event.
/// - endTime: The end time of the event.
/// - recurrence: The recurrence of the event.
/// - isPublic: Whether the event is public or not.
/// - isSubscribed: Whether the user is subscribed to the event or not.
/// - isRegisterable: Whether the event is registerable or not.
/// - creator: The creator of the event.
/// - attendees: The attendees of the event.
/// - admins: The admins of the event.
/// - organization: The organization of the event.

const eventsDemoData = [
  {
    "title": "Calculus",
    "description":
        "This course introduces calculus using analytic geometry functions. Topics include limits and continuity, derivatives, optimization, related rates, graphing and other applications of derivatives, definite and indefinite integrals, and numerical integration.",
    "location": "Lostilos",
    "recurring": "false",
    "allDay": "true",
    "startDate": "1 Aug",
    "endDate": "15 Aug",
    "startTime": "11am",
    "endTime": "3pm",
    "recurrence": "MONTHLY",
    "isPublic": "true",
    "isSubscribed": "false",
    "isRegisterable": "true",
    "creator": {
      "firstName": "Utkarsh",
      "lastName": "Shendge",
      "_id": "asdasdasd",
    },
    "attendees": [
      {"id": "attendee1", "firstName": "firstName1", "lastName": "lastName1"},
      {"id": "attendee2", "firstName": "firstName2", "lastName": "lastName2"},
      {"id": "attendee3", "firstName": "firstName3", "lastName": "lastName3"},
      {"id": "attendee4", "firstName": "firstName4", "lastName": "lastName4"},
      {"id": "attendee5", "firstName": "firstName5", "lastName": "lastName5"},
      {"id": "attendee6", "firstName": "firstName6", "lastName": "lastName6"},
      {"id": "attendee7", "firstName": "firstName7", "lastName": "lastName7"},
      {"id": "attendee8", "firstName": "firstName8", "lastName": "lastName8"},
      {"id": "attendee9", "firstName": "firstName9", "lastName": "lastName9"},
      {
        "id": "attendee10",
        "firstName": "firstName10",
        "lastName": "lastName10",
      },
    ],
    "admins": [
      {"firstName": "Utkarsh", "lastName": "Shendge", "_id": "asdasdasd"},
    ],
    "organization": {
      "_id": '1',
      "name": 'Mathematicians',
      "image": ' ',
      "creator": {
        "firstName": "Utkarsh",
        "lastName": "Shendge",
        "_id": "asdasdasd",
      },
    },
  },
  {
    "title": "UI/UX",
    "description":
        "UX design refers to the term “user experience design”, while UI stands for “user interface design”. Both elements are crucial to a product and work closely together.",
    "location": "Tokyo, Japan",
    "recurring": "false",
    "allDay": "true",
    "startDate": "5 May",
    "endDate": "13 May",
    "startTime": "2am",
    "endTime": "3pm",
    "recurrence": "MONTHLY",
    "isPublic": "true",
    "isSubscribed": "true",
    "isRegisterable": "true",
    "creator": {
      "firstName": "Rutvik",
      "lastName": "Chandla",
      "_id": "asdasdasd",
    },
    "attendees": [
      {"id": "attendee1", "firstName": "firstName1", "lastName": "lastName1"},
      {"id": "attendee2", "firstName": "firstName2", "lastName": "lastName2"},
      {"id": "attendee3", "firstName": "firstName3", "lastName": "lastName3"},
      {"id": "attendee4", "firstName": "firstName4", "lastName": "lastName4"},
      {"id": "attendee5", "firstName": "firstName5", "lastName": "lastName5"},
      {"id": "attendee6", "firstName": "firstName6", "lastName": "lastName6"},
      {"id": "attendee7", "firstName": "firstName7", "lastName": "lastName7"},
      {"id": "attendee8", "firstName": "firstName8", "lastName": "lastName8"},
      {"id": "attendee9", "firstName": "firstName9", "lastName": "lastName9"},
      {
        "id": "attendee10",
        "firstName": "firstName10",
        "lastName": "lastName10",
      },
    ],
    "admins": [
      {"firstName": "Utkarsh", "lastName": "Shendge", "_id": "asdasdasd"},
    ],
    "organization": {
      "_id": '1',
      "name": 'Courses',
      "image": ' ',
      "creator": {
        "firstName": "Rutvik",
        "lastName": "Chandla",
        "_id": "asdasdasd",
      },
    },
  },
  {
    "title": "System Design",
    "description":
        "Systems design is the process of defining the architecture, product design, modules, interfaces, and data for a system to satisfy specified requirements. Systems design could be seen as the application of systems theory to product development.",
    "location": "Shimla, India",
    "recurring": "false",
    "allDay": "true",
    "startDate": "15 Dec",
    "endDate": "18 Aug",
    "startTime": "8am",
    "endTime": "3pm",
    "recurrence": "MONTHLY",
    "isPublic": "false",
    "isSubscribed": "false",
    "isRegisterable": "true",
    "creator": {
      "firstName": "Ritik",
      "lastName": "Srivastav",
      "_id": "asdasdasd",
    },
    "attendees": [
      {"id": "attendee1", "firstName": "firstName1", "lastName": "lastName1"},
      {"id": "attendee2", "firstName": "firstName2", "lastName": "lastName2"},
      {"id": "attendee3", "firstName": "firstName3", "lastName": "lastName3"},
      {"id": "attendee4", "firstName": "firstName4", "lastName": "lastName4"},
      {"id": "attendee5", "firstName": "firstName5", "lastName": "lastName5"},
      {"id": "attendee6", "firstName": "firstName6", "lastName": "lastName6"},
      {"id": "attendee7", "firstName": "firstName7", "lastName": "lastName7"},
      {"id": "attendee8", "firstName": "firstName8", "lastName": "lastName8"},
      {"id": "attendee9", "firstName": "firstName9", "lastName": "lastName9"},
      {
        "id": "attendee10",
        "firstName": "firstName10",
        "lastName": "lastName10",
      },
    ],
    "admins": [
      {"firstName": "Utkarsh", "lastName": "Shendge", "_id": "asdasdasd"},
    ],
    "organization": {
      "_id": '1',
      "image": ' ',
      "name": 'Computer Science',
      "creator": {
        "firstName": "Ritik",
        "lastName": "Srivastav",
        "_id": "asdasdasd",
      },
    },
  },
  {
    "title": "Gaming",
    "description":
        "Cyberpunk 2077 is a 2020 action role-playing v_ideo game developed and published by CD Projekt. The story takes place in Night City, an open world set in the Cyberpunk universe.",
    "location": "Nagpur, India",
    "recurring": "false",
    "allDay": "true",
    "startDate": "1 Aug",
    "endDate": "15 Aug",
    "startTime": "11am",
    "endTime": "3pm",
    "recurrence": "MONTHLY",
    "isPublic": "true",
    "isSubscribed": "true",
    "isRegisterable": "true",
    "creator": {
      "firstName": "Utkarsh",
      "lastName": "Shendge",
      "_id": "asdasdasd",
    },
    "attendees": [
      {"id": "attendee1", "firstName": "firstName1", "lastName": "lastName1"},
      {"id": "attendee2", "firstName": "firstName2", "lastName": "lastName2"},
      {"id": "attendee3", "firstName": "firstName3", "lastName": "lastName3"},
      {"id": "attendee4", "firstName": "firstName4", "lastName": "lastName4"},
      {"id": "attendee5", "firstName": "firstName5", "lastName": "lastName5"},
      {"id": "attendee6", "firstName": "firstName6", "lastName": "lastName6"},
      {"id": "attendee7", "firstName": "firstName7", "lastName": "lastName7"},
      {"id": "attendee8", "firstName": "firstName8", "lastName": "lastName8"},
      {"id": "attendee9", "firstName": "firstName9", "lastName": "lastName9"},
      {
        "id": "attendee10",
        "firstName": "firstName10",
        "lastName": "lastName10",
      },
    ],
    "admins": [
      {"firstName": "Utkarsh", "lastName": "Shendge", "_id": "asdasdasd"},
    ],
    "organization": {
      "_id": '1',
      "image": ' ',
      "name": 'Cyclone',
      "creator": {
        "firstName": "Utkarsh",
        "lastName": "Shendge",
        "_id": "asdasdasd",
      },
    },
  }
];
