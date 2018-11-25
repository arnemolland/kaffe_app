import 'dart:async';
import 'dart:core';
import 'package:kaffe_repository/kaffe_repository.dart';

abstract class ReactiveArticlesRepository {
  Future<void> addNewArticle(ArticleEntity article);

  Future<void> deleteArticle(List<String> idList);

  Stream <List<ArticleEntity>> articles();

  Future<void> updateArticle(ArticleEntity article);
}

abstract class ReactiveCoffeesRepository {
  Future<void> addNewCoffee(CoffeeEntity coffee);

  Future<void> deleteCoffee(List<String> idList);

  Stream <List<CoffeeEntity>> coffees();

  Future<void> updateCoffee(CoffeeEntity coffee);
}