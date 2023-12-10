// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "choose_type_individual_bloc.dart";

class ChooseTypeIndividualState extends Equatable {
  final List<ProductModel> list;
  ChooseTypeIndividualState({
    this.list = const [],
  });
  @override
  List<Object?> get props => [
        list,
      ];

  ChooseTypeIndividualState copyWith({
    List<ProductModel>? list,
  }) {
    return ChooseTypeIndividualState(
      list: list ?? this.list,
    );
  }
}
