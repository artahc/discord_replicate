enum EntityEvent {
  SAVED,
  DELETED,
}

class ObservableEntityEvent<T> {
  /// Operation event, either created/updated or deleted.
  final EntityEvent event;

  /// Entity key.
  final String key;

  /// The entity after operation.
  final T? value;

  ObservableEntityEvent(this.event, this.key, this.value);

  @override
  String toString() {
    return "ObservableEntity<$T> { event: $event, key: $key, value: $value }";
  }
}
