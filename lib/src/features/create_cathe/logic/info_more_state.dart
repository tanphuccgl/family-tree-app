// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'info_more_bloc.dart';

class InfoMoreState extends Equatable {
  final String name;
  final String description;
  InfoMoreState({
    this.name = "",
    this.description = "",
  });
  @override
  List<Object?> get props => [
        name,
        description,
      ];

  InfoMoreState copyWith({
    String? name,
    String? description,
  }) {
    return InfoMoreState(
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}
