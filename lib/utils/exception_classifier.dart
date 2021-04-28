String classifyException(String exceptionString) {
  if (exceptionString.contains('ClientException')) {
    return "Couldn't connect, please check internet connection";
  } else if (exceptionString.contains('GraphQL Errors:')) {
    return "Server Error, Sorry for inconvenience";
  } else {
    return exceptionString;
  }
}
