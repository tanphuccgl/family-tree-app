// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_individual_f0_root_bloc.dart';

class CreateIndividualF0RootState extends Equatable {
  final AreaModel? area;
  final String name;
  final String familyCode;
  final OriginModel? origin;
  final List<OriginModel> listOriginSuggest;

  const CreateIndividualF0RootState({
    this.area,
    this.name = "",
    this.familyCode = "",
    this.origin,
    this.listOriginSuggest = const [],
  });

  factory CreateIndividualF0RootState.ds() => CreateIndividualF0RootState();

  @override
  List<Object?> get props => [
        area,
        name,
        familyCode,
        origin,
        listOriginSuggest,
      ];

  CreateIndividualF0RootState copyWith({
    AreaModel? area,
    String? name,
    String? familyCode,
    OriginModel? origin,
    List<OriginModel>? listOriginSuggest,
  }) {
    return CreateIndividualF0RootState(
      area: area ?? this.area,
      name: name ?? this.name,
      familyCode: familyCode ?? this.familyCode,
      origin: origin ?? this.origin,
      listOriginSuggest: listOriginSuggest ?? this.listOriginSuggest,
    );
  }
}
