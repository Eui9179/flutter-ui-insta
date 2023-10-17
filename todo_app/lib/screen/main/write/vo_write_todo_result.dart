class WriteTodoResult {
  final DateTime dateTime;
  final String text;

  WriteTodoResult(this.dateTime, this.text);

  @override
  String toString() {
    return "{dateTime: $dateTime, text: $text}";
  }
}