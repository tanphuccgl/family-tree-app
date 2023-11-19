// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'detail_cathe_bloc.dart';

class DetailCatheState extends Equatable {
  final ProductModel data;
  final bool isEdit;

  const DetailCatheState({
    required this.data,
    this.isEdit = false,
  });
  @override
  List<Object?> get props => [
        data,
        isEdit,
      ];

  DetailCatheState copyWith({
    ProductModel? data,
    bool? isEdit,
  }) {
    return DetailCatheState(
      data: data ?? this.data,
      isEdit: isEdit ?? this.isEdit,
    );
  }
}
