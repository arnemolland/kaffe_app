import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kaffe_repository/kaffe_repository.dart';

class FirestoreReactiveArticlesRepository implements ReactiveArticlesRepository {
  static const String path = 'article';

  final Firestore firestore;

  const FirestoreReactiveArticlesRepository(this.firestore);

  @override
  Future<void> addNewArticle(ArticleEntity article) {
    return firestore
    .collection(path)
    .document(article.id)
    .setData(article.toJson());
  }

  @override
  Future<void> deleteArticle(List<String> idList) async {
    await Future.wait<void>(idList.map((id) {
      return firestore
    .collection(path)
    .document(id)
    .delete();
    }));
  }

  @override
  Stream<List<ArticleEntity>> articles() {
    return firestore.collection(path).snapshots().map((snapshot) {
      return snapshot.documents.map((doc) {
        return ArticleEntity(
          doc.documentID,
          doc['author'] ?? '',
          doc['title'] ?? '',
          doc['published'] ?? DateTime.now(),
          doc['beans'] ?? 0,
        );
      }).toList();
    });
  }

  @override
  Future<void> updateArticle(ArticleEntity article) {
    return firestore
    .collection(path)
    .document(article.id)
    .updateData(article.toJson());
  }
}