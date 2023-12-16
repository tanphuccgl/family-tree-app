// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'individual_bloc.dart';

class IndividualState extends Equatable {
  final List<IndividualModel> list;
  final List<String> listIndividualSelected;
  final String detailIndividualSelectedId;

  final bool enableSortWithName;
  final bool enableSortWithId;
  final bool enableSortWithType;
  final bool enableSortWithSex;
  final bool enableSortWithOrigin;
  final bool enableSortWithArea;

  final bool enableSortWithFatherId;
  final bool enableSortWithMotherId;
  final bool enableSortWithDate;
  final bool enableSortWithAge;
  final bool enableSortWithColor;
  final bool enableSortWithFood;
  final bool enableSortWithPrice;
  final bool enableSortWithReview;
  final bool enableSortWithWeight;

  IndividualState({
    this.list = const [],
    this.listIndividualSelected = const [],
    this.enableSortWithName = false,
    this.enableSortWithId = false,
    this.enableSortWithType = false,
    this.enableSortWithOrigin = false,
    this.enableSortWithSex = false,
    this.enableSortWithArea = false,
    this.enableSortWithFatherId = false,
    this.enableSortWithMotherId = false,
    this.enableSortWithDate = false,
    this.enableSortWithAge = false,
    this.enableSortWithColor = false,
    this.enableSortWithFood = false,
    this.enableSortWithPrice = false,
    this.enableSortWithReview = false,
    this.enableSortWithWeight = false,
    this.detailIndividualSelectedId = "",
  });

  @override
  List<Object?> get props => [
        list,
        listIndividualSelected,
        enableSortWithArea,
        enableSortWithSex,
        enableSortWithName,
        enableSortWithType,
        enableSortWithId,
        enableSortWithOrigin,
        detailIndividualSelectedId,
        enableSortWithFatherId,
        enableSortWithMotherId,
        enableSortWithDate,
        enableSortWithAge,
        enableSortWithColor,
        enableSortWithFood,
        enableSortWithPrice,
        enableSortWithReview,
        enableSortWithWeight,
      ];

  IndividualState copyWith({
    List<IndividualModel>? list,
    List<String>? listIndividualSelected,
    String? detailIndividualSelectedId,
    bool? enableSortWithName,
    bool? enableSortWithId,
    bool? enableSortWithType,
    bool? enableSortWithSex,
    bool? enableSortWithOrigin,
    bool? enableSortWithArea,
    bool? enableSortWithFatherId,
    bool? enableSortWithMotherId,
    bool? enableSortWithDate,
    bool? enableSortWithAge,
    bool? enableSortWithColor,
    bool? enableSortWithFood,
    bool? enableSortWithPrice,
    bool? enableSortWithReview,
    bool? enableSortWithWeight,
  }) {
    return IndividualState(
      list: list ?? this.list,
      listIndividualSelected:
          listIndividualSelected ?? this.listIndividualSelected,
      detailIndividualSelectedId:
          detailIndividualSelectedId ?? this.detailIndividualSelectedId,
      enableSortWithName: enableSortWithName ?? this.enableSortWithName,
      enableSortWithId: enableSortWithId ?? this.enableSortWithId,
      enableSortWithType: enableSortWithType ?? this.enableSortWithType,
      enableSortWithSex: enableSortWithSex ?? this.enableSortWithSex,
      enableSortWithOrigin: enableSortWithOrigin ?? this.enableSortWithOrigin,
      enableSortWithArea: enableSortWithArea ?? this.enableSortWithArea,
      enableSortWithFatherId:
          enableSortWithFatherId ?? this.enableSortWithFatherId,
      enableSortWithMotherId:
          enableSortWithMotherId ?? this.enableSortWithMotherId,
      enableSortWithDate: enableSortWithDate ?? this.enableSortWithDate,
      enableSortWithAge: enableSortWithAge ?? this.enableSortWithAge,
      enableSortWithColor: enableSortWithColor ?? this.enableSortWithColor,
      enableSortWithFood: enableSortWithFood ?? this.enableSortWithFood,
      enableSortWithPrice: enableSortWithPrice ?? this.enableSortWithPrice,
      enableSortWithReview: enableSortWithReview ?? this.enableSortWithReview,
      enableSortWithWeight: enableSortWithWeight ?? this.enableSortWithWeight,
    );
  }
}
