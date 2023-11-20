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
  final ProductTypeEnum type;
  final List<ProductModel> listFather;
  final List<ProductModel> listMother;
  final bool isFamilyCodeExist;
  final PlatformFile? imageFile;
  final String video;
  final ProductModel father;
  final ProductModel mother;
  final String food;
  final String style;
  final List<InfoMoreModel> listInfoMore;

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
    this.type = ProductTypeEnum.f0,
    this.isFamilyCodeExist = false,
    this.listFather = const [],
    this.listMother = const [],
    this.imageFile,
    this.video = "",
    required this.father,
    required this.mother,
    this.food = "",
    this.style = "",
    this.listInfoMore = const [],
  });

  factory CreateCatheState.ds() => CreateCatheState(
        father: ProductModel(id: ""),
        mother: ProductModel(id: ""),
      );

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
        type,
        listFather,
        isFamilyCodeExist,
        imageFile,
        video,
        father,
        mother,
        listMother,
        food,
        style,
        listInfoMore,
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
    ProductTypeEnum? type,
    List<ProductModel>? listFather,
    List<ProductModel>? listMother,
    bool? isFamilyCodeExist,
    PlatformFile? imageFile,
    String? video,
    ProductModel? mother,
    ProductModel? father,
    String? food,
    String? style,
    List<InfoMoreModel>? listInfoMore,
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
      type: type ?? this.type,
      listFather: listFather ?? this.listFather,
      isFamilyCodeExist: isFamilyCodeExist ?? this.isFamilyCodeExist,
      imageFile: imageFile ?? this.imageFile,
      video: video ?? this.video,
      father: father ?? this.father,
      mother: mother ?? this.mother,
      listMother: listMother ?? this.listMother,
      food: food ?? this.food,
      style: style ?? this.style,
      listInfoMore: listInfoMore ?? this.listInfoMore,
    );
  }
}
