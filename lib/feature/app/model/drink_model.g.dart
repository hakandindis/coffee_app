// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drink_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrinkModel _$DrinkModelFromJson(Map<String, dynamic> json) => DrinkModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      imgName: json['imgName'] as String?,
      description: json['description'] as String?,
      price: json['price'] as int?,
      isFavorite: json['isFavorite'] as bool?,
      isAdd: json['isAdd'] as bool?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$DrinkModelToJson(DrinkModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imgName': instance.imgName,
      'description': instance.description,
      'price': instance.price,
      'isFavorite': instance.isFavorite,
      'isAdd': instance.isAdd,
      'category': instance.category,
    };
