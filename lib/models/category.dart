// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  final bool? success;
  final List<Category>? output;
  final String? errorMassage;

  CategoryModel({
    this.success,
    this.output,
    this.errorMassage,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        success: json["success"],
        output: json["output"] == null
            ? []
            : List<Category>.from(json["output"]!.map((x) => Category.fromJson(x))),
        errorMassage: json["errorMassage"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "output": output == null
            ? []
            : List<dynamic>.from(output!.map((x) => x.toJson())),
        "errorMassage": errorMassage,
      };
}

class Category {
  final String? slug;
  final String? name;

  Category({
    this.slug,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        slug: json["slug"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
      };
}
