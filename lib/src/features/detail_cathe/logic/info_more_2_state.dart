// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'info_more_1_bloc.dart';

class InfoMore1State extends Equatable {
  final String name;
  final String description;
  InfoMore1State({
    this.name = "",
    this.description = "",
  });
  @override
  List<Object?> get props => [
        name,
        description,
      ];

  InfoMore1State copyWith({
    String? name,
    String? description,
  }) {
    return InfoMore1State(
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}
