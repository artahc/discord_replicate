enum EntityEvent {
  CREATED_OR_UPDATED,
  DELETED,
}

class ObservableEntityEvent<K, V> {
  /// Operation event, either created/updated or deleted.
  final EntityEvent event;

  /// Entity key.
  final K key;

  /// The entity after operation.
  final V? value;

  ObservableEntityEvent(this.event, this.key, this.value);

  @override
  String toString() {
    return "ObservableEntity<$K, $V> { event: $event, key: $key, value: $value }";
  }
}
