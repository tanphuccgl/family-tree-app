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
  final ProductModel fromFamilyCode;
  final ProductTypeEnum type;
  final List<ProductModel> productSuggest;
  final bool isFamilyCodeExist;
  final PlatformFile? imageFile;
  final String video;
  final String area;

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
    required this.fromFamilyCode,
    this.type = ProductTypeEnum.f0,
    this.isFamilyCodeExist = false,
    this.productSuggest = const [],
    this.imageFile,
    this.video = "",
    this.area = '',
  });

  factory CreateCatheState.ds() =>
      CreateCatheState(fromFamilyCode: ProductModel());

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
        fromFamilyCode,
        type,
        productSuggest,
        isFamilyCodeExist,
        imageFile,
        video,
        area,
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
    ProductModel? fromFamilyCode,
    ProductTypeEnum? type,
    List<ProductModel>? productSuggest,
    bool? isFamilyCodeExist,
    PlatformFile? imageFile,
    String? video,
    String? area,
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
      fromFamilyCode: fromFamilyCode ?? this.fromFamilyCode,
      type: type ?? this.type,
      productSuggest: productSuggest ?? this.productSuggest,
      isFamilyCodeExist: isFamilyCodeExist ?? this.isFamilyCodeExist,
      imageFile: imageFile ?? this.imageFile,
      video: video ?? this.video,
      area: area ?? this.area,
    );
  }
}
