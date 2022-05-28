import 'package:json_annotation/json_annotation.dart';

part 'coffee_model.g.dart';

@JsonSerializable()
class CoffeeModel {
  String? name;
  String? description;
  int? price;
  String? imgName;

  CoffeeModel({this.name, this.description, this.price, this.imgName});

  factory CoffeeModel.fromJson(Map<String, dynamic> json) {
    return _$CoffeeModelFromJson(json);
  }

  Map<String, dynamic> toJson(CoffeeModel instance) {
    return _$CoffeeModelToJson(instance);
  }
}
