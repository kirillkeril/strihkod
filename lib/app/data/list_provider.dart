import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:strihkod/app/models/list/list.dart';
import 'package:strihkod/app/models/product/product.dart';

class ListProvider extends GetxService {
  final dbReference = 'users-lists';
  Future<UsersList?> get(String userId) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref(dbReference);
    DataSnapshot source = await ref.get();
    if (!source.exists) return null;
    List<UsersList> list = source.value as List<UsersList>;
    return list.firstWhere((element) => element.userIds.contains(userId));
  }

  addProductToList(String userId, Product product) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref(dbReference);
    DataSnapshot source = await ref.get();
    if (!source.exists) return null;
    ref = source.ref;
    ref.get();
  }
}
