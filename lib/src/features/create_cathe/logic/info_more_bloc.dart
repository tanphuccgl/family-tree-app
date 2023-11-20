import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'info_more_state.dart';

class InfoMoreBloc extends Cubit<InfoMoreState> {
  InfoMoreBloc() : super(InfoMoreState());

  void onChangeName(String value) {
    emit(state.copyWith(name: value));
  }

  void onChangeDescription(String value) {
    emit(state.copyWith(description: value));
  }
}
