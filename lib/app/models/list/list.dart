import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:strihkod/app/models/product/product.dart';

part 'list.freezed.dart';
part 'list.g.dart';

@freezed
class UsersList with _$UsersList {
  factory UsersList({
    required String userId,
    required List<Product> products,
  }) = _UsersList;

  factory UsersList.fromJson(Map<String, dynamic> json) =>
      _$UsersListFromJson(json);
}
