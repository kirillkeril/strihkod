import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:strihkod/app/models/product/product.dart';
import 'package:uuid/uuid.dart';

class ProductServiceProvider extends GetxService {
  late FirebaseFirestore db;

  ProductServiceProvider() {
    db = FirebaseFirestore.instance;
  }

  Future<Product?> addProduct(AddProductDto dto) async {
    String id = const Uuid().v4();
    Product product = Product(id: id, code: dto.code, name: dto.name);
    try {
      await db.collection('products').add(product.toJson());
      return product;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> updateProduct(UpdateProductDto dto) async {
    final doc = db.collection("products").doc(dto.id);
    try {
      bool result = await db.runTransaction((transaction) async {
        transaction.update(doc, {"name": dto.name});
        return true;
      });
      return result;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteProduct(String id) async {
    try {
      await db.collection("products").doc(id).delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<Product>?> getAllProducts() async {
    final products = db.collection("products");
    final List<Product> result = [];
    products.get().then((docs) {
      for (var s in docs.docs) {
        result.add(Product.fromJson(s.data()));
      }
    });
    return result;
  }

  Future<Product?> getProductById(String id) async {
    final product = await db.collection("products").doc(id).get();
    return product.data() as Product;
  }

  Future<Product?> getProductByCode(String code) async {
    final product =
        await db.collection("products").where('code', isEqualTo: code).get();
    return Product.fromJson(product.docs.first.data());
  }
}

class AddProductDto {
  String code;
  String name;
  AddProductDto({
    required this.code,
    required this.name,
  });
}

class UpdateProductDto {
  String id;
  String name;
  UpdateProductDto({
    required this.id,
    required this.name,
  });
}
