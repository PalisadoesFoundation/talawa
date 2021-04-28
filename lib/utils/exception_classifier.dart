String classifyException(String exceptionString) {
  if (exceptionString.contains('ClientException')) {
    return "Couldn't connect, please check internet connection";
  } else {
    return "Server Error, Sorry for inconvenience";
  }
}
