// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:familytree/src/network/model/common/base_model.dart';
import 'package:familytree/src/utils/utils.dart';

class AreaModel extends BaseModel {
  final String nameId;

  final String name;

  AreaModel({
    String? id,
    Timestamp? createAt,
    Timestamp? updateAt,
    this.nameId = "",
    this.name = "",
  }) : super(id: id ?? "", createAt: createAt, updateAt: updateAt);

  factory AreaModel.empty() {
    return AreaModel();
  }

  factory AreaModel.fromDocument(DocumentSnapshot document) {
    return AreaModel.fromMap(
      document.data() as Map<String, dynamic>,
      id: document.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nameId': nameId,
      "createAt": createAt,
      "updateAt": updateAt,
      "id": id,
      'name': name,
    };
  }

  static AreaModel fromMap(Map map, {String? id}) {
    return AreaModel(
      id: id ?? map['id'],
      createAt: Utils.convertMapToTimestamp(map['createAt'] ?? 0),
      updateAt: Utils.convertMapToTimestamp(map['updateAt'] ?? 0),
      nameId: map['nameId'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AreaModel.fromJson(String source) =>
      AreaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  AreaModel copyWith({
    String? nameId,
    String? name,
    String? id,
    Timestamp? createAt,
    Timestamp? updateAt,
  }) {
    return AreaModel(
      id: id ?? this.id,
      createAt: createAt ?? this.createAt,
      updateAt: updateAt ?? this.updateAt,
      nameId: nameId ?? this.nameId,
      name: name ?? this.name,
    );
  }
}
