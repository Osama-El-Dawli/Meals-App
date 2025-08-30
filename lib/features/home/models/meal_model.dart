import 'package:json_annotation/json_annotation.dart';
part 'meal_model.g.dart';

@JsonSerializable()
class MealModel {
  final int? id;
  final String name;
  final String description;
  final String imageUrl;
  final String time;
  final int calories;
  final double rate;

  const MealModel({
    this.id,
    required this.calories,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.time,
    required this.rate,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) =>
      _$MealModelFromJson(json);

  Map<String, dynamic> toJson() => _$MealModelToJson(this);
}
