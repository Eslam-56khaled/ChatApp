class Messagemodel {
  final String text;
  final String id;

  Messagemodel({
    required this.text,
    required this.id,
  });
  factory Messagemodel.fromjson(json) {
    return Messagemodel(
      text: json['message'],
      id: json['id'],
    );
  }
}
