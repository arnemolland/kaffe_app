import 'package:kaffe_app/models/models.dart';

class CoffeeEntity {
  final String id;
  final CoffeeType type;
  final double grams;
  final double amount;
  final CoffeeBean bean;
  final DateTime time;

  CoffeeEntity(this.id, this.type, this.grams, this.amount, this.bean, this.time);

  @override
  int get hashCode => 
  id.hashCode ^ type.hashCode ^ grams.hashCode ^ amount.hashCode ^ bean.hashCode ^ time.hashCode;

  @override
  bool operator ==(Object other) =>
  identical(this, other) ||
  other is CoffeeEntity &&
  runtimeType == other.runtimeType &&
  id == other.id &&
  type == other.type &&
  grams == other.grams &&
  amount == other.amount &&
  bean == other.bean &&
  time == other.time;

  Map<String, Object> toJson() {
    return {
      "id": id,
      "type": type,
      "grams": grams,
      "amount": amount,
      "bean": bean,
      "time": time
    };
  }

  static CoffeeEntity fromJson(Map<String, Object> json) {
    return CoffeeEntity(
      json["id"] as String,
      json["type"] as CoffeeType,
      json["grams"] as double,
      json["amount"] as double,
      json["bean"] as CoffeeBean,
      json["time"] as DateTime
    );
      }

    @override
    String toString() =>
    'CoffeeEntity{id: $id, type: $type, grams: $grams, amount: $amount, bean: $bean, time: $time}';
}