class ArticleEntity {
  final String id;
  final String author;
  final String title;
  final DateTime published;

  ArticleEntity(this.id, this.author, this.title, this.published);

  @override
  int get hashCode =>
    id.hashCode ^ author.hashCode ^ title.hashCode ^ published.hashCode;

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
    other is ArticleEntity &&
    runtimeType == other.runtimeType &&
    id == other.id &&
    author == other.author &&
    published == other.published &&
    title == other.title;

  Map<String, Object> toJson() {
    return {
      "id": id,
      "author": author,
      "title": title,
      "published": published,
    };
  }

  static ArticleEntity fromJson(Map<String, Object> json) {
    return ArticleEntity(
      json["id"] as String,
      json["author"] as String,
      json["title"] as String,
      json["published"] as DateTime,
    );
  }

  @override
  String toString() {
    return 'ArticleEntity{id: $id, author: $author, title: $title, published: $published}';
  }
}