import 'package:json_annotation/json_annotation.dart';

part 'drink_model.g.dart';

@JsonSerializable()
class DrinkModel {
  String? id;
  String? name;
  String? imgName;
  String? description;
  int? price;
  String? isFavorite;
  String? isAdd;

  DrinkModel({this.id, this.name, this.imgName, this.description, this.price, this.isFavorite, this.isAdd});

  factory DrinkModel.fromJson(Map<String, dynamic> json) {
    return _$DrinkModelFromJson(json);
  }

  Map<String, dynamic> toJson(DrinkModel instance) {
    return _$DrinkModelToJson(instance);
  }
}
