import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'info_more_2_state.dart';

class InfoMore1Bloc extends Cubit<InfoMore1State> {
  final String name;
  final String description;
  InfoMore1Bloc(this.name, this.description) : super(InfoMore1State()) {
    onChangeName(name);
    onChangeDescription(description);
  }

  void onChangeName(String value) {
    emit(state.copyWith(name: value));
  }

  void onChangeDescription(String value) {
    emit(state.copyWith(description: value));
  }
}
