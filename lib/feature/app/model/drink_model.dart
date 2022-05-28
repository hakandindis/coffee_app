import 'package:json_annotation/json_annotation.dart';

part 'drink_model.g.dart';

@JsonSerializable()
class DrinkModel {
  String? name;
  String? description;
  String? imgName;
  int? price;

  DrinkModel({this.name, this.description, this.price, this.imgName});

  factory DrinkModel.fromJson(Map<String, dynamic> json) {
    return _$DrinkModelFromJson(json);
  }

  Map<String, dynamic> toJson(DrinkModel instance) {
    return _$DrinkModelToJson(instance);
  }
}
