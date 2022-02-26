class PaginationResponse<T> {
  final List<T> items;
  final bool hasMore;
  final dynamic previousCursor;

  const PaginationResponse({required this.items, required this.hasMore, this.previousCursor});
}
