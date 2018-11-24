import 'package:uuid/uuid.dart';
import 'package:kaffe_repository/kaffe_repository.dart';
import 'package:meta/meta.dart';

@immutable
class Article {
  final String id;
  final String author;
  final DateTime published;
  final String title;
  final int beans;

  Article(this.title, {DateTime published, String id, String author = '', beans})
      : this.published = published ?? DateTime.now(),
        this.author = author ?? '',
        this.id = id ?? Uuid().v4(),
        this.beans = beans ?? 0;

  Article copyWith({String id, String author, DateTime published, String title, int beans}) {
    return Article(
      title ?? this.title,
      id: id ?? this.id,
      author: author ?? this.author,
      published: published ?? this.published,
      beans: beans ?? this.beans,
    );
  }

  @override
  int get hashCode =>
    id.hashCode ^ author.hashCode ^ published.hashCode ^ title.hashCode ^ beans.hashCode;

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
    other is Article &&
    runtimeType == other.runtimeType &&
    id == other.id &&
    author == other.author &&
    published == other.published &&
    title == other.title &&
    beans == other.beans;

    @override
    String toString() {
      return 'Article{id: $id, author: $author, published: $published, title: $title}, beans: $beans';
    }

    ArticleEntity toEntity() {
      return ArticleEntity(id, author, title, published, beans);
    }

    static Article fromEntity(ArticleEntity entity) {
      return Article(
        entity.title,
        id: entity.id,
        author: entity.author,
        published: entity.published,
        beans: entity.beans,
      );
    }
}
