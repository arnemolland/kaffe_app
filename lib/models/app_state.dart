import 'package:kaffe_repository/kaffe_repository.dart';
import 'package:kaffe_app/models/models.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

@immutable
class AppState {
  final bool isLoading;
  final List<Article> articles;
  final AppTab activeTab;
  final FirebaseUser firebaseUser;

  AppState({
    this.isLoading = false,
    this.articles = const [],
    this.activeTab = AppTab.feed,
    this.firebaseUser,
  });

  factory AppState.loading() => AppState(isLoading: true);

  AppState copyWith({bool isLoading, List<Article> articles, AppTab activeTab}) {
    return AppState(
        isLoading: isLoading ?? this.isLoading,
        articles: articles ?? this.articles,
        activeTab: activeTab ?? this.activeTab,
        firebaseUser: firebaseUser ?? this.firebaseUser);
  }

  @override
  int get hashCode =>
  isLoading.hashCode ^ articles.hashCode ^ activeTab.hashCode ^ firebaseUser.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          articles == other.articles &&
          activeTab == other.activeTab &&
          firebaseUser == other.firebaseUser;

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, articles: $articles, activeTab: $activeTab, firebaseUser: $firebaseUser}';
  }
}
