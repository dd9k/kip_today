class ChoiceValue<T> {
  const ChoiceValue({this.value, this.title, this.label});

  final T value;
  final String title;
  final String label;

  @override
  String toString() => '$runtimeType("$title")';
}