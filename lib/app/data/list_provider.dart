import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:strihkod/app/data/product_service_provider.dart';
import 'package:strihkod/app/models/list/list.dart';
import 'package:strihkod/app/models/product/product.dart';

class ListService extends GetxService {
  late FirebaseFirestore db;
  late ProductServiceProvider productService;

  ListService() {
    db = FirebaseFirestore.instance;
    productService = ProductServiceProvider();
  }

  Future<UsersList?> get(String userId) async {
    final list = await db.collection("list").doc(userId).get();
    if (list.data() == null) return null;
    return UsersList.fromJson(list.data()!);
  }

  addProductToList(String userId, String code) async {
    final listDoc = db.collection("list").doc(userId);
    var listData = await listDoc.get();
    if (listData.data() == null) return null;

    final list = UsersList.fromJson(listData.data()!);

    Product? product = await productService.getProductByCode(code);
    if (product == null) return null;
    list.products.add(product);

    listDoc.update(list.toJson());
    return list;
  }

  createList(String userId) async {
    UsersList list = UsersList(userId: userId, products: []);
    await db.collection('list').doc(userId).set(list.toJson());
  }
}
