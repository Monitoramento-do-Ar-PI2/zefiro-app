class Recomendations {
  String text;
  DateTime dateTime;

  Recomendations({this.dateTime, this.text});

  Recomendations.fromMap(Map<String, dynamic> map) {
    text = map['text'] as String;
    dateTime = map['date'] as DateTime;
  }
}
