class QuotesInfoPage {
  String? text;
  String? author;
  QuotesInfoPage({
    required this.text,
    required this.author,
  });

  QuotesInfoPage.fromJson(Map<String, dynamic> json) {
    json['text'];
    json['author'];
  }
}
