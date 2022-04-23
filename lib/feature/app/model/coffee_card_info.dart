import 'package:json_annotation/json_annotation.dart';

part 'coffee_card_info.g.dart';

@JsonSerializable(createToJson: false)
class CoffeeCardInfo {
  String? imgName;
  String? name;
  String? description;
  int? price;

  CoffeeCardInfo({this.imgName, this.name, this.description, this.price});

  factory CoffeeCardInfo.fromJson(Map<String, dynamic> json) {
    return _$CoffeeCardInfoFromJson(json);
  }
}
