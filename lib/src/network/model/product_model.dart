// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:familytree/src/network/model/common/base_model.dart';
import 'package:familytree/src/utils/utils.dart';

enum ProductTypeEnum {
  f0,
  f1,
  f2,
  f3;

  static ProductTypeEnum fromString(String? type) {
    switch (type) {
      case "F0":
        return ProductTypeEnum.f0;
      case "F1":
        return ProductTypeEnum.f1;
      case "F2":
        return ProductTypeEnum.f2;
      case "F3":
        return ProductTypeEnum.f3;
    }
    return ProductTypeEnum.f0;
  }

  String get nameOf {
    switch (this) {
      case ProductTypeEnum.f0:
        return "F0";
      case ProductTypeEnum.f1:
        return "F1";
      case ProductTypeEnum.f2:
        return "F2";
      case ProductTypeEnum.f3:
        return "F3";
    }
  }

  String get labelOf {
    switch (this) {
      case ProductTypeEnum.f0:
        return "F0";
      case ProductTypeEnum.f1:
        return "F1";
      case ProductTypeEnum.f2:
        return "F2";
      case ProductTypeEnum.f3:
        return "F3";
    }
  }
}

class ProductModel extends BaseModel {
  final String date;
  final String review;
  final String area;
  final int age;
  final String color;
  final double price;
  final double weight;
  final String name;
  final String videoLink;
  final String fromId;
  final bool isMale;
  final String image;
  final ProductTypeEnum type;

  ProductModel({
    String? id,
    Timestamp? createAt,
    Timestamp? updateAt,
    this.date = "",
    this.review = "",
    this.age = 0,
    this.area = "",
    this.color = "",
    this.price = 0,
    this.weight = 0,
    this.name = "",
    this.videoLink = "",
    this.fromId = "",
    this.isMale = true,
    this.type = ProductTypeEnum.f0,
    this.image = "",
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
      "type": type.nameOf,
      "id": id,
      'review': review,
      'age': age,
      'color': color,
      'price': price,
      'weight': weight,
      'name': name,
      'videoLink': videoLink,
      'fromId': fromId,
      'isMale': isMale,
      'image': image,
      'area': area,
    };
  }

  static ProductModel fromMap(Map map, {String? id}) {
    return ProductModel(
      id: id ?? map['id'],
      createAt: Utils.convertMapToTimestamp(map['createAt'] ?? 0),
      updateAt: Utils.convertMapToTimestamp(map['updateAt'] ?? 0),
      type: map["type"] == null
          ? ProductTypeEnum.f0
          : ProductTypeEnum.fromString(map["type"]),
      date: map['date'] as String,
      review: map['review'] as String,
      age: map['age'] as int,
      color: map['color'] as String,
      price: map['price'] as double,
      weight: map['weight'] as double,
      name: map['name'] as String,
      videoLink: map['videoLink'] as String,
      fromId: map['fromId'] as String,
      isMale: map['isMale'] as bool,
      image: map['image'] as String,
      area: map['area'] as String,
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
    String? fromId,
    bool? isMale,
    ProductTypeEnum? type,
    String? image,
    String? area,
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
      fromId: fromId ?? this.fromId,
      isMale: isMale ?? this.isMale,
      type: type ?? this.type,
      image: image ?? this.image,
      area: area ?? this.area,
    );
  }
}
