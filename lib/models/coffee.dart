import 'package:kaffe_app/models/models.dart';
import 'package:uuid/uuid.dart';
import 'package:kaffe_repository/kaffe_repository.dart';

class Coffee {
  String id;
  CoffeeType type;
  double grams;
  double amount;
  CoffeeBean bean;
  DateTime time;

  Coffee({CoffeeType type, String id, DateTime time, double grams, double amount, CoffeeBean bean})
  : this.id = id ?? Uuid().v4(),
    this.type = type ?? CoffeeType.black,
    this.grams = grams ?? 10,
    this.amount = amount ?? 1,
    this.bean = bean ?? CoffeeBean.arabica,
    this.time = time ?? DateTime.now();

  Coffee copyWith({String id, CoffeeType type, double grams, double amount, CoffeeBean bean, DateTime time}) {
    return Coffee(
      id: id ?? this.id,
      type: type ?? this.type,
      grams: grams ?? this.grams,
      amount: amount ?? this.amount,
      bean: bean ?? this.bean,
      time: time ?? this.time      
    );
  }

  @override
  int get hashCode =>
  id.hashCode ^ type.hashCode ^ grams.hashCode ^ amount.hashCode ^ bean.hashCode ^ time.hashCode;

  @override
  String toString() => 
  'Coffee{id: $id, type: $type, grams: $grams, amount: $amount, bean: $bean, time: $time}';

  CoffeeEntity toEntity() {
    return CoffeeEntity(id, type, grams, amount, bean, time);
  }

  static Coffee fromEntity(CoffeeEntity entity) {
    return Coffee(
      id: entity.id,
      type: entity.type,
      grams: entity.grams,
      amount: entity.amount,
      bean: entity.bean,
      time: entity.time
    );
  }
  




}