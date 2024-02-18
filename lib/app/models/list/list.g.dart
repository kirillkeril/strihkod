// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsersListImpl _$$UsersListImplFromJson(Map<String, dynamic> json) =>
    _$UsersListImpl(
      userId: json['userId'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UsersListImplToJson(_$UsersListImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'products': instance.products,
    };
