// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:familytree/src/network/model/common/base_model.dart';
import 'package:familytree/src/utils/utils.dart';

class OriginModel extends BaseModel {
  final String nameId;
  final String name;

  OriginModel({
    String? id,
    Timestamp? createAt,
    Timestamp? updateAt,
    this.nameId = "",
    this.name = "",
  }) : super(id: id ?? "", createAt: createAt, updateAt: updateAt);

  factory OriginModel.empty() {
    return OriginModel();
  }

  factory OriginModel.fromDocument(DocumentSnapshot document) {
    return OriginModel.fromMap(
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

  static OriginModel fromMap(Map map, {String? id}) {
    return OriginModel(
      id: id ?? map['id'],
      createAt: Utils.convertMapToTimestamp(map['createAt'] ?? 0),
      updateAt: Utils.convertMapToTimestamp(map['updateAt'] ?? 0),
      nameId: map['nameId'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OriginModel.fromJson(String source) =>
      OriginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  OriginModel copyWith({
    String? nameId,
    String? name,
    String? id,
    Timestamp? createAt,
    Timestamp? updateAt,
  }) {
    return OriginModel(
      id: id ?? this.id,
      createAt: createAt ?? this.createAt,
      updateAt: updateAt ?? this.updateAt,
      nameId: nameId ?? this.nameId,
      name: name ?? this.name,
    );
  }
}
