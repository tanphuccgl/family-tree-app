// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:familytree/src/network/model/common/base_model.dart';
import 'package:familytree/src/utils/utils.dart';

class ProductModel extends BaseModel {
  final String date;
  final String review;
  final int age;
  final String color;
  final double price;
  final double weight;
  final String name;
  final String videoLink;
  final String familyCode;
  final bool isMale;

  ProductModel({
    String? id,
    Timestamp? createAt,
    Timestamp? updateAt,
    this.date = "",
    this.review = "",
    this.age = 0,
    this.color = "",
    this.price = 0,
    this.weight = 0,
    this.name = "",
    this.videoLink = "",
    this.familyCode = "",
    this.isMale = true,
  }) : super(id: id ?? "", createAt: createAt, updateAt: updateAt);

  factory ProductModel.empty() {
    return ProductModel();
  }

  factory ProductModel.fromDocument(DocumentSnapshot document) {
    return ProductModel.fromMap(
      document.data() as Map<String, dynamic>,
      id: document.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      "createAt": createAt,
      "updateAt": updateAt,
      "id": id,
      'review': review,
      'age': age,
      'color': color,
      'price': price,
      'weight': weight,
      'name': name,
      'videoLink': videoLink,
      'familyCode': familyCode,
      'isMale': isMale,
    };
  }

  static ProductModel fromMap(Map map, {String? id}) {
    return ProductModel(
      id: id ?? map['id'],
      createAt: Utils.convertMapToTimestamp(map['createAt'] ?? 0),
      updateAt: Utils.convertMapToTimestamp(map['updateAt'] ?? 0),
      date: map['date'] as String,
      review: map['review'] as String,
      age: map['age'] as int,
      color: map['color'] as String,
      price: map['price'] as double,
      weight: map['weight'] as double,
      name: map['name'] as String,
      videoLink: map['videoLink'] as String,
      familyCode: map['familyCode'] as String,
      isMale: map['isMale'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  ProductModel copyWith({
    String? date,
    String? review,
    int? age,
    String? color,
    double? price,
    double? weight,
    String? name,
    String? videoLink,
    String? id,
    Timestamp? createAt,
    Timestamp? updateAt,
    String? familyCode,
    bool? isMale,
  }) {
    return ProductModel(
      id: id ?? this.id,
      createAt: createAt ?? this.createAt,
      updateAt: updateAt ?? this.updateAt,
      date: date ?? this.date,
      review: review ?? this.review,
      age: age ?? this.age,
      color: color ?? this.color,
      price: price ?? this.price,
      weight: weight ?? this.weight,
      name: name ?? this.name,
      videoLink: videoLink ?? this.videoLink,
      familyCode: familyCode ?? this.familyCode,
      isMale: isMale ?? this.isMale,
    );
  }
}
