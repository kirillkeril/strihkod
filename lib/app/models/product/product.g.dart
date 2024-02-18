// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as String,
      countryCode: json['countryCode'] as String,
      manufactureCode: json['manufactureCode'] as String,
      productCode: json['productCode'] as String,
      controlFigure: json['controlFigure'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'countryCode': instance.countryCode,
      'manufactureCode': instance.manufactureCode,
      'productCode': instance.productCode,
      'controlFigure': instance.controlFigure,
      'name': instance.name,
    };
