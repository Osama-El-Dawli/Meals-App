import 'package:json_annotation/json_annotation.dart';
part 'meal_model.g.dart';

@JsonSerializable()
class MealModel {
  final int id;
  final String name;
  final String description;
  final String imageUrl;

  const MealModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) =>
      _$MealModelFromJson(json);

  Map<String, dynamic> toJson() => _$MealModelToJson(this);
}
