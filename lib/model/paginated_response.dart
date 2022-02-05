class PaginationResponse<T> {
  final List<T> items;
  final bool hasMore;

  const PaginationResponse({required this.items, required this.hasMore});
}
