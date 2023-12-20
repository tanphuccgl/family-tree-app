// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'detail_individual_bloc.dart';

class DetailIndividualState extends Equatable {
  final bool isEdit;

  final AreaModel? area;
  final GenerationEnum? type;
  final OriginModel? origin;

  final IndividualModel? father;
  final IndividualModel? mother;

  final String name;
  final String familyCode;
  final bool isMale;
  final bool isFamilyCodeExist;
  final String age;
  final String color;
  final String date;
  final String food;
  final String price;
  final String review;
  final String style;
  final String weight;

  final String image;
  final String video;

  final List<InfoMoreModel> listFieldInfo;
  final List<String> listCopulateId;

  const DetailIndividualState({
    this.area,
    this.type,
    this.origin,
    this.father,
    this.isEdit = false,
    this.mother,
    this.name = "",
    this.familyCode = "",
    this.isMale = true,
    this.isFamilyCodeExist = false,
    this.age = "",
    this.color = "",
    this.date = "",
    this.food = "",
    this.price = "",
    this.review = "",
    this.style = "",
    this.weight = "",
    this.image = "",
    this.video = "",
    this.listFieldInfo = const [],
    this.listCopulateId = const [],
  });

  factory DetailIndividualState.ds() => DetailIndividualState();

  @override
  List<Object?> get props {
    return [
      area,
      isEdit,
      type,
      origin,
      father,
      mother,
      name,
      familyCode,
      isMale,
      isFamilyCodeExist,
      listCopulateId,
      age,
      color,
      date,
      food,
      price,
      review,
      style,
      weight,
      image,
      video,
      listFieldInfo,
    ];
  }

  DetailIndividualState copyWith({
    bool? isEdit,
    AreaModel? area,
    GenerationEnum? type,
    OriginModel? origin,
    IndividualModel? father,
    IndividualModel? mother,
    String? name,
    String? familyCode,
    bool? isMale,
    bool? isFamilyCodeExist,
    String? age,
    String? color,
    String? date,
    String? food,
    String? price,
    String? review,
    String? style,
    String? weight,
    String? image,
    String? video,
    List<InfoMoreModel>? listFieldInfo,
    List<String>? listCopulateId,
  }) {
    return DetailIndividualState(
      isEdit: isEdit ?? this.isEdit,
      area: area ?? this.area,
      type: type ?? this.type,
      origin: origin ?? this.origin,
      father: father ?? this.father,
      mother: mother ?? this.mother,
      name: name ?? this.name,
      familyCode: familyCode ?? this.familyCode,
      isMale: isMale ?? this.isMale,
      isFamilyCodeExist: isFamilyCodeExist ?? this.isFamilyCodeExist,
      age: age ?? this.age,
      color: color ?? this.color,
      date: date ?? this.date,
      food: food ?? this.food,
      price: price ?? this.price,
      review: review ?? this.review,
      style: style ?? this.style,
      weight: weight ?? this.weight,
      image: image ?? this.image,
      video: video ?? this.video,
      listFieldInfo: listFieldInfo ?? this.listFieldInfo,
      listCopulateId: listCopulateId ?? this.listCopulateId,
    );
  }
}
