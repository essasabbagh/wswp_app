// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  final bool? success;
  final List<Output>? output;
  final String? errorMassage;

  DataModel({
    this.success,
    this.output,
    this.errorMassage,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        success: json["success"],
        output: json["output"] == null
            ? []
            : List<Output>.from(json["output"]!.map((x) => Output.fromJson(x))),
        errorMassage: json["errorMassage"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "output":
            output == null ? [] : List<dynamic>.from(output!.map((x) => x.toJson())),
        "errorMassage": errorMassage,
      };
}

class Output {
  final int? id;
  final String? name;
  final String? image;
  final String? techTypeIcon;
  final List<Evidence>? evidences;
  final List<Alternative>? alternatives;

  Output({
    this.id,
    this.name,
    this.image,
    this.techTypeIcon,
    this.evidences,
    this.alternatives,
  });

  factory Output.fromJson(Map<String, dynamic> json) => Output(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        techTypeIcon: json["tech_type_icon"],
        evidences: json["evidences"] == null
            ? []
            : List<Evidence>.from(
                json["evidences"]!.map((x) => Evidence.fromJson(x))),
        alternatives: json["alternatives"] == null
            ? []
            : List<Alternative>.from(
                json["alternatives"]!.map((x) => Alternative.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "tech_type_icon": techTypeIcon,
        "evidences": evidences == null
            ? []
            : List<dynamic>.from(evidences!.map((x) => x.toJson())),
        "alternatives": alternatives == null
            ? []
            : List<dynamic>.from(alternatives!.map((x) => x.toJson())),
      };
}

class Alternative {
  final String? name;
  final String? image;

  Alternative({
    this.name,
    this.image,
  });

  factory Alternative.fromJson(Map<String, dynamic> json) => Alternative(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}

class Evidence {
  final String? url;
  final String? image;

  Evidence({
    this.url,
    this.image,
  });

  factory Evidence.fromJson(Map<String, dynamic> json) => Evidence(
        url: json["url"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "image": image,
      };
}
