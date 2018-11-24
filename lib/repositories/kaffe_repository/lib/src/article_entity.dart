class ArticleEntity {
  final String id;
  final String author;
  final String title;
  final DateTime published;
  final int beans;

  ArticleEntity(this.id, this.author, this.title, this.published, this.beans);

  @override
  int get hashCode =>
    id.hashCode ^ author.hashCode ^ title.hashCode ^ published.hashCode ^ beans.hashCode;

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
    other is ArticleEntity &&
    runtimeType == other.runtimeType &&
    id == other.id &&
    author == other.author &&
    published == other.published &&
    title == other.title &&
    beans == other.beans;

  Map<String, Object> toJson() {
    return {
      "id": id,
      "author": author,
      "title": title,
      "published": published,
      "beans": beans
    };
  }

  static ArticleEntity fromJson(Map<String, Object> json) {
    return ArticleEntity(
      json["id"] as String,
      json["author"] as String,
      json["title"] as String,
      json["published"] as DateTime,
      json["beans"] as int,
    );
  }

  @override
  String toString() {
    return 'ArticleEntity{id: $id, author: $author, title: $title, published: $published, beans: $beans}';
  }
}