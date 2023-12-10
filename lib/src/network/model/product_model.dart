// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:familytree/src/network/model/area_model.dart';
import 'package:familytree/src/network/model/common/base_model.dart';
import 'package:familytree/src/network/model/info_more_model.dart';
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
  final AreaModel? area;
  final List<String> listCopulateId;
  final String origin;
  final int age;
  final String color;
  final double price;
  final double weight;
  final String name;
  final String videoLink;
  final bool isMale;
  final String image;
  final ProductTypeEnum type;
  final String fatherId;
  final String motherId;
  final String food;
  final String style;
  final List<InfoMoreModel> listInfoMore;

  ProductModel({
    String? id,
    this.listCopulateId = const [],
    Timestamp? createAt,
    Timestamp? updateAt,
    this.date = "",
    this.origin = "",
    this.review = "",
    this.age = 0,
    this.area,
    this.color = "",
    this.price = 0,
    this.weight = 0,
    this.name = "",
    this.videoLink = "",
    this.isMale = true,
    this.type = ProductTypeEnum.f0,
    this.image = "",
    this.fatherId = "",
    this.motherId = "",
    this.food = "",
    this.style = "",
    this.listInfoMore = const [],
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
      'listCopulateId': listCopulateId.map((e) => e).toList(),
      "createAt": createAt,
      "updateAt": updateAt,
      "type": type.nameOf,
      "id": id,
      'origin': origin,
      'review': review,
      'age': age,
      'color': color,
      'price': price,
      'weight': weight,
      'name': name,
      'videoLink': videoLink,
      'isMale': isMale,
      'image': image,
      'area': area?.toMap(),
      'fatherId': fatherId,
      'motherId': motherId,
      'food': food,
      'style': style,
      "listInfoMore": listInfoMore.map((e) => e.toMap()).toList(),
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
      listCopulateId: map['listCopulateId'] == null
          ? []
          : (map['listCopulateId'] as List).map((e) => e.toString()).toList(),
      origin: map['origin'] as String,
      color: map['color'] as String,
      price: map['price'] as double,
      weight: map['weight'] as double,
      name: map['name'] as String,
      videoLink: map['videoLink'] as String,
      isMale: map['isMale'] as bool,
      image: map['image'] as String,
      area: map['area'] == null ? null : AreaModel.fromMap(map['area']),
      fatherId: map['fatherId'] as String,
      motherId: map['motherId'] as String,
      food: map['food'] == null ? "" : map['food'] as String,
      style: map['style'] == null ? "" : map['style'] as String,
      listInfoMore: map['listInfoMore'] == null
          ? []
          : (map['listInfoMore'] as List)
              .map((e) => InfoMoreModel.fromMap(e))
              .toList(),
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
    bool? isMale,
    List<String>? listCopulateId,
    ProductTypeEnum? type,
    String? image,
    AreaModel? area,
    String? origin,
    String? fatherId,
    String? motherId,
    String? food,
    String? style,
    List<InfoMoreModel>? listInfoMore,
  }) {
    return ProductModel(
      id: id ?? this.id,
      listCopulateId: listCopulateId ?? this.listCopulateId,
      origin: origin ?? this.origin,
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
      isMale: isMale ?? this.isMale,
      type: type ?? this.type,
      image: image ?? this.image,
      area: area ?? this.area,
      fatherId: fatherId ?? this.fatherId,
      motherId: motherId ?? this.motherId,
      food: food ?? this.food,
      style: style ?? this.style,
      listInfoMore: listInfoMore ?? this.listInfoMore,
    );
  }
}
