import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kaffe_repository/kaffe_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kaffe_app/models/models.dart';

class FirestoreReactiveCoffeesRepository implements ReactiveCoffeesRepository {
  static const String path = 'coffee';

  final Firestore firestore;
  final FirebaseUser user;

  const FirestoreReactiveCoffeesRepository(this.firestore, this.user);

  @override
  Future<void> addNewCoffee(CoffeeEntity coffee) {
    return firestore
    .collection(path)
    .document(coffee.id)
    .setData(coffee.toJson());
  }

  @override
  Future<void> deleteCoffee(List<String> idList) async {
    await Future.wait<void>(idList.map((id) {
      return firestore
      .collection(path)
      .document(id)
      .delete();
    }));
  }

  @override
  Stream<List<CoffeeEntity>> coffees() {
    return firestore.collection(path).where('id', isEqualTo: user.uid).snapshots().map((snapshot) {
      return snapshot.documents.map((doc) {
        return CoffeeEntity(
          doc.documentID,
          doc['type'] ?? CoffeeType.unknown,
          doc['grams'] ?? 0,
          doc['amount'] ?? 0,
          doc['bean'] ?? CoffeeBean.unknown,
          doc['time'] ?? DateTime.utc(1337)
        );
      }).toList();
      });
    }

    @override
    Future<void> updateCoffee(CoffeeEntity coffee) {
      return firestore
      .collection(path)
      .document(coffee.id)
      .updateData(coffee.toJson());
    }
}