// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drink_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrinkModel _$DrinkModelFromJson(Map<String, dynamic> json) => DrinkModel(
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as int?,
      imgName: json['imgName'] as String?,
    );

Map<String, dynamic> _$DrinkModelToJson(DrinkModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'imgName': instance.imgName,
      'price': instance.price,
    };
