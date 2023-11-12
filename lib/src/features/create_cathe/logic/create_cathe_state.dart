// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_cathe_bloc.dart';

class CreateCatheState extends Equatable {
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
  const CreateCatheState({
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
  });

  @override
  List<Object?> get props => [
        date,
        review,
        age,
        color,
        price,
        weight,
        name,
        videoLink,
        familyCode,
        isMale,
      ];

  CreateCatheState copyWith({
    String? date,
    String? review,
    int? age,
    String? color,
    double? price,
    double? weight,
    String? name,
    String? videoLink,
    String? familyCode,
    bool? isMale,
  }) {
    return CreateCatheState(
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
