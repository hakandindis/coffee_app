// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoffeeModel _$CoffeeModelFromJson(Map<String, dynamic> json) => CoffeeModel(
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as int?,
      imgName: json['imgName'] as String?,
    );

Map<String, dynamic> _$CoffeeModelToJson(CoffeeModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'imgName': instance.imgName,
    };
