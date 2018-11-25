import 'package:kaffe_app/actions/actions.dart';
import 'package:kaffe_app/models/models.dart';
import 'package:redux/redux.dart';

final coffeesReducer = combineReducers<List<Coffee>>([
  TypedReducer<List<Coffee>, LoadCoffeesAction>(_setLoadedCoffees),
  TypedReducer<List<Coffee>, DeleteCoffeeAction>(_deleteCoffee),
]);

List<Coffee> _setLoadedCoffees(List<Coffee> coffees, LoadCoffeesAction action) {
  return action.coffees;
}

List<Coffee> _deleteCoffee(List<Coffee> coffees, DeleteCoffeeAction action) {
  return coffees..removeWhere((coffee) => coffee.id == action.id);
}