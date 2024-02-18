import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:strihkod/app/models/product/product.dart';
import 'package:uuid/uuid.dart';

class ProductServiceProvider extends GetxService {
  final db = FirebaseFirestore.instance;

  Future<Product?> addProduct(AddProductDto dto) async {
    String id = const Uuid().v4();
    Product product = Product(
        id: id,
        countryCode: dto.countryCode,
        manufactureCode: dto.manufactureCode,
        productCode: dto.productCode,
        controlFigure: dto.controlFigure,
        name: dto.name);
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
        result.add(s as Product);
      }
    });
    return result;
  }

  Future<Product?> getProductById(String id) async {
    final product = db.collection("products").doc(id);
    return product.get().then((DocumentSnapshot doc) {
      return doc.data() as Product;
    });
  }
}

class AddProductDto {
  String countryCode;
  String manufactureCode;
  String productCode;
  String controlFigure;
  String name;
  AddProductDto({
    required this.countryCode,
    required this.manufactureCode,
    required this.productCode,
    required this.controlFigure,
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
