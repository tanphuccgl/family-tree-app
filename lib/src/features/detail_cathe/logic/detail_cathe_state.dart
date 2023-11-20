// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'detail_cathe_bloc.dart';

class DetailCatheState extends Equatable {
  final bool isEdit;
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

  final String father;
  final String mother;
  final String food;
  final String style;
  final List<InfoMoreModel> listInfoMore;
  final AreaModel? area;
  final String imageNetwork;

  factory DetailCatheState.ds() => DetailCatheState();

  const DetailCatheState({
    this.isEdit = false,
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
    this.father = "",
    this.mother = "",
    this.food = "",
    this.style = "",
    this.listInfoMore = const [],
    this.area,
    this.imageNetwork = "",
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
        type,
        father,
        mother,
        food,
        style,
        listInfoMore,
        isEdit,
        area,
        imageNetwork,
      ];

  DetailCatheState copyWith({
    bool? isEdit,
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
    String? father,
    String? mother,
    String? food,
    String? style,
    List<InfoMoreModel>? listInfoMore,
    AreaModel? area,
    String? imageNetwork,
  }) {
    return DetailCatheState(
      isEdit: isEdit ?? this.isEdit,
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
      father: father ?? this.father,
      mother: mother ?? this.mother,
      food: food ?? this.food,
      style: style ?? this.style,
      listInfoMore: listInfoMore ?? this.listInfoMore,
      area: area ?? this.area,
      imageNetwork: imageNetwork ?? this.imageNetwork,
    );
  }
}
