// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'detail_cathe_bloc.dart';

class DetailCatheState extends Equatable {
  final ProductModel data;

  const DetailCatheState({required this.data});
  @override
  List<Object?> get props => [
        data,
      ];

  DetailCatheState copyWith({
    ProductModel? data,
  }) {
    return DetailCatheState(
      data: data ?? this.data,
    );
  }
}
