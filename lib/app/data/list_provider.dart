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

  Future<List<Product>?> get(String userId) async {
    final list = await db.collection("list").doc(userId).get();
    if (list.data() == null) return null;
    print(list.data());
    return UsersList.fromJson(list.data()!).products;
  }

  Future<List<Product>?> addProductToList(String userId, String code) async {
    final listDoc = db.collection("list").doc(userId);
    var listData = await listDoc.get();
    if (listData.data() == null) return null;

    final list = UsersList.fromJson(listData.data()!);

    Product? product = await productService.getProductByCode(code);
    if (product == null) return null;
    var newList = [...list.products.map((e) => e.toJson()), product.toJson()];

    await listDoc.update({
      "products": newList,
    });
    return list.products;
  }

  removeFromList(String userId, String code) async {
    final list = await get(userId);
    if (list == null) return null;
    List filteredProducts = [];
    for (var p in list) {
      if (p.code != code) {
        filteredProducts.add(p.toJson());
      }
    }
    await db.collection('list').doc(userId).set({
      "userId": userId,
      "products": filteredProducts,
    });
    return filteredProducts;
  }

  createList(String userId) async {
    UsersList list = UsersList(userId: userId, products: []);
    await db.collection('list').doc(userId).set(list.toJson());
  }
}
