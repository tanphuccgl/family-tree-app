// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_cathe_bloc.dart';

class ListCatheState extends Equatable {
  final List<ProductModel> list;

  const ListCatheState({
    this.list = const [],
  });
  @override
  List<Object?> get props => [
        list,
      ];

  ListCatheState copyWith({
    List<ProductModel>? list,
  }) {
    return ListCatheState(
      list: list ?? this.list,
    );
  }
}
