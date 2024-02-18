import 'package:strihkod/app/models/product/product.dart';

class UsersList {
  List<String> userIds;
  List<Product> products;

  UsersList({
    required this.userIds,
    required this.products,
  });
}
