// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:familytree/src/network/model/common/base_model.dart';

class InfoMoreModel extends BaseModel {
  String name;
  String description;
  String id;

  InfoMoreModel({
    this.description = "",
    this.name = "",
    this.id = "",
  });

  factory InfoMoreModel.empty() {
    return InfoMoreModel();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
    };
  }

  static InfoMoreModel fromMap(Map map, {String? id}) {
    return InfoMoreModel(
      description: map['description'] as String,
      name: map['name'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory InfoMoreModel.fromJson(String source) =>
      InfoMoreModel.fromMap(json.decode(source) as Map<String, dynamic>);

  InfoMoreModel copyWith({
    String? description,
    String? name,
    String? id,
  }) {
    return InfoMoreModel(
      description: description ?? this.description,
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }
}
