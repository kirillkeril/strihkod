import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:strihkod/app/models/product/product.dart';
import 'package:uuid/uuid.dart';

class ProductServiceProvider extends GetxService {
  final dbReference = 'products';

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
      DatabaseReference ref = FirebaseDatabase.instance.ref(dbReference);
      await ref.set(product);
      return product;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> updateProduct(UpdateProductDto dto) async {
    try {
      DatabaseReference ref =
          FirebaseDatabase.instance.ref(dbReference + dto.id);
      await ref.update({"name": dto.name});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteProduct(String id) async {
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref(dbReference + id);
      await ref.remove();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<Product>> getAllProducts() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref(dbReference);
    DataSnapshot result = await ref.get();
    if (!result.exists) return [];
    return result.value as List<Product>;
  }

  Future<Product?> getProductById(String id) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref(dbReference + id);
    DataSnapshot result = await ref.get();
    if (!result.exists) return null;
    return result.value as Product;
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
