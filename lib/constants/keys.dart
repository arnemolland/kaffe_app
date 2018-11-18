import 'package:flutter/widgets.dart';

class KaffeKeys {
  // Home screens
  static final homeScreen = const Key('__homeScreen__');
  static final addCoffeeFab = const Key('_addCoffeeFab__');
  static snackbarAction(String id) => Key('__snackbar_action_${id}');

  // Commong
  static final kaffeBottomBar = const Key('__kaffeBottomBar__');

  // Login screen
  static final loginScreen = const Key('__loginScreen__');
  static final googleButton = const Key('__googleButton__');
  static final mailButton = const Key('__mailButton__');

  // Coffees
  static final coffeeList = const Key('__coffeeList__');
  static final coffeesLoading = const Key('__coffeesLoading__');
  static final coffee = (String id) => Key('Coffee_${id}');
  
  // Tabs
  static final tabs = const Key('__tabs__');
  static final coffeeTab = const Key('__coffeeTab__');
  static final statsTab = const Key('__statsTab__');

  // Filters
  static final filterButton = const Key('__filterButton__');
  static final allFilter = const Key('__allFilter__');
  static final espressoFilter = const Key('__espressoFilter__');
  static final ristrettoFilter = const Key('__ristrettoFilter__');
  static final flatWhiteFilter = const Key('__flatWhiteFilter__');

  // Stats
  static final statsCounter = const Key('__statsCounter__');
  static final statsLoading = const Key('__statsLoading__');
  static final statsNumEspresso = const Key('__statsEspressoCoffees');
  static final statsNumRistretto = const Key('__statsRistrettoCoffees');
  static final statsNumFlatWhite = const Key('__statsFlatWhiteCoffees__');

  // Coffee detail screen
  static final editCoffeeFab = const Key('__editCoffeeFab__');
  static final deleteCoffeeFab = const Key('__deleteCoffeeFab__');
  static final coffeeDetailsScreen = const Key('__coffeeDetailsScreen__');
  static final detailsCoffeeNote = Key('DetailsCoffee__Note');
  static final detailsCoffeeGrams = Key('DetailsCoffee__Grams');
  static final detailsCoffeeShots = Key('DetailsCoffee__Shots');
  static final detailsCoffeeFoam = Key('DetailsCoffee__Foam');
  static final detailsCoffeeDecaf = Key('DetailsCoffee__Decaf');
  static final detailsCoffeeMilkAmount = Key('DetailsCoffee__MilkAmount');
  static final detailsCoffeeRoast = Key('DetailsCoffee__Roast');
  static final detailsCoffeeExtractionTime = Key('DetailsCoffee__ExtractionTime');

  // Add screen
  static final addCoffeeScreen = const Key('__addCoffeeScreen__');
  static final saveNewCoffee = const Key('__saveNewCoffee__');
  static final coffeeField = const Key('__coffeeField__');
  static final noteField = const Key('__noteField__');

  // Edit screen
  static final editCoffeeScreen = const Key('__editCoffeeScreen__');
  static final saveCoffeeFab = const Key('__saveCoffeeFab__');
}