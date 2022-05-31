// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      drinkNames: (json['drinkNames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      totalPrice: json['totalPrice'] as int?,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'drinkNames': instance.drinkNames,
      'totalPrice': instance.totalPrice,
    };
