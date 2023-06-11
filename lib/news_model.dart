class NewsClass {
    String status;
    int totalResults;
    List<Article> articles;

    NewsClass({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

}

class Article {
    // Source source;
    String author;
    String title;
    String description;
    String url;
    String urlToImage;
    DateTime publishedAt;
    String content;

    Article({
        // required this.source,
        required this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
        required this.content,
    });

  factory Article.fromJson(Map<String, dynamic> json) {
  return Article(
    // source: Source.fromJson(json['source']),
    author: json['author'] ?? '',
    title: json['title'] ?? '',
    description: json['description'] ?? '',
    url: json['url'] ?? '',
    urlToImage: json['urlToImage'] ?? '',
    publishedAt: DateTime.parse(json['publishedAt'] ?? ''),
    content: json['content'] ?? '',
  );
}

}

class Source {
    Id id;
    Name name;

    Source({
        required this.id,
        required this.name,
    });
    

  //    factory Source.fromJson(Map<String, dynamic> json) {
  //   return Source(
  //     id: EnumToString.fromString(Id.values, json['id']),
  //     name: EnumToString.fromString(Name.values, json['name']),
  //   );
  // }
     

}

enum Id { TECHCRUNCH }

enum Name { TECH_CRUNCH }
