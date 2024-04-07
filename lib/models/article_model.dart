class ArticleModel {
  final String title;
  final String publishedAt;
  final String url;
  final String? urlToImage;

  ArticleModel({
    required this.title,
    required this.publishedAt,
    required this.url,
    required this.urlToImage,
  });

  factory ArticleModel.fromJson(json) {
    return ArticleModel(
      title: json['title'],
      publishedAt: json['publishedAt'],
      url: json['url'],
      urlToImage: json['urlToImage'],
    );
  }
}
