// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'family_tree_bloc.dart';

class FamilyTreeState extends Equatable {
  final List<ProductModel> list;

  const FamilyTreeState({
    this.list = const [],
  });
  @override
  List<Object?> get props => [
        list,
      ];

  FamilyTreeState copyWith({
    List<ProductModel>? list,
  }) {
    return FamilyTreeState(
      list: list ?? this.list,
    );
  }
}
