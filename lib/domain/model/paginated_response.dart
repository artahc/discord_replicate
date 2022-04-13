class PaginationResponse<T> {
  final Iterable<T> items;
  final bool hasMore;
  final dynamic cursor;

  const PaginationResponse({required this.items, required this.hasMore, this.cursor});
}
