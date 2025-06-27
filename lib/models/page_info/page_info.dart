/// This is class is used to represent pagination information for a list of items.
///
/// variables:
/// startCursor: start cursor for pagination
/// endCursor: end cursor for pagination
/// hasNextPage: boolean indicating if there are more items after the current page
/// hasPreviousPage: boolean indicating if there are items before the current page
class PageInfo {
  PageInfo({
    this.startCursor,
    this.endCursor,
    this.hasNextPage,
    this.hasPreviousPage,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) {
    return PageInfo(
      startCursor: json['startCursor'] as String?,
      endCursor: json['endCursor'] as String?,
      hasNextPage: json['hasNextPage'] as bool?,
      hasPreviousPage: json['hasPreviousPage'] as bool?,
    );
  }

  ///  Start cursor for pagination.
  String? startCursor;

  ///  End cursor for pagination.
  String? endCursor;

  ///  Indicates if there are more items after the current page.
  bool? hasNextPage;

  ///  Indicates if there are items before the current page.
  bool? hasPreviousPage;
}
