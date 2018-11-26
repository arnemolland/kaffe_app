import 'package:kaffe_app/models/models.dart';


typedef void VoidCallback();
typedef void ErrorCallback(error);
class LoadArticlesAction {
  final List<Article> articles;

  LoadArticlesAction(this.articles);

  @override
  String toString() {
    return 'LoadArticlesAction{articles: $articles}';
  }
}

  class UpdateArticleAction {
  final String id;
  final Article updatedArticle;

  UpdateArticleAction(this.id, this.updatedArticle);

  @override
  String toString() {
    return 'UpdatearticleAction{id: $id, updatedarticle: $updatedArticle}';
  }
}

class DeleteArticleAction {
  final String id;

  DeleteArticleAction(this.id);

  @override
  String toString() {
    return 'DeleteArticleAction{id: $id}';
  }
}

class AddArticleAction {
  final Article article;

  AddArticleAction(this.article);

  @override
  String toString() {
    return 'AddArticleAction{article: $article}';
  }
}

class LoadCoffeesAction {
  final List<Coffee> coffees;

  LoadCoffeesAction(this.coffees);

  @override
  String toString() {
    return 'LoadArticlesAction{articles: $coffees}';
  }
}

  class UpdateCoffeeAction {
  final String id;
  final Article updatedCoffee;

  UpdateCoffeeAction(this.id, this.updatedCoffee);

  @override
  String toString() {
    return 'UpdatearticleAction{id: $id, updatedarticle: $updatedCoffee}';
  }
}

class DeleteCoffeeAction {
  final String id;

  DeleteCoffeeAction(this.id);

  @override
  String toString() {
    return 'DeleteArticleAction{id: $id}';
  }
}

class AddCoffeeAction {
  final Coffee coffee;

  AddCoffeeAction(this.coffee);

  @override
  String toString() {
    return 'AddArticleAction{article: $coffee}';
  }
}


class InitAppAction {
  @override
  String toString() {
    return 'InitAppAction{}';
  }
}

class SignInMailAction {
  final String email;
  final String password;

  VoidCallback onCompleted;
  ErrorCallback onError;

  SignInMailAction({this.email, this.password, this.onCompleted, this.onError});
  
  @override
  String toString() {
    return 'SignInMailAction{}';
  }
}

class SignInGoogleAction {
  @override
  String toString() {
    return 'SignInGoogleAction{}';
  }
}
class SignUpMailAction {
  final String email;
  final String password;

  VoidCallback onCompleted;
  ErrorCallback onError;

  SignUpMailAction({this.email, this.password, this.onCompleted, this.onError});

  @override
  String toString() {
    return 'SignUpMailAction{email: $email, password: $password}';
  }
}

class ConnectToDataSourceAction {
  @override
  String toString() {
    return 'ConnectToDataSourceAction{}';
  }
}

class UpdateTabAction {
  final AppTab newTab;

  UpdateTabAction(this.newTab);

  @override
  String toString() {
    return 'UpdateTabAction{newTab: $newTab}';
  }
}

class UpdateFilterAction {
  final VisibilityFilter newFilter;

  UpdateFilterAction(this.newFilter);

  @override
  String toString() {
    return 'UpdateFilterAction{newFilter: $newFilter}';
  }
}