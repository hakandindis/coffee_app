import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  List<String>? drinkNames;
  int? totalPrice;

  OrderModel({this.drinkNames, this.totalPrice});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return _$OrderModelFromJson(json);
  }

  Map<String, dynamic> toJson(OrderModel instance) {
    return _$OrderModelToJson(instance);
  }
}
