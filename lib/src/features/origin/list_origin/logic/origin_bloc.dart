import 'package:equatable/equatable.dart';
import 'package:familytree/src/features/origin/create_origin/pages/create_origin_page.dart';
import 'package:familytree/src/features/origin/detail_origin/pages/detail_origin_page.dart';

import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/origin_model.dart';

import 'package:familytree/src/router/coordinator.dart';
import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'origin_state.dart';

class OriginBloc extends Cubit<OriginState> {
  OriginBloc() : super(OriginState()) {
    init();
  }

  Domain get domain => GetIt.I<Domain>();

  void init() async {
    await getAllOrigin();
  }

  Future<void> getAllOrigin() async {
    XToast.showLoading();
    final result = await domain.origin.getAllOrigin();
    if (result.isSuccess) {
      emit(state.copyWith(list: result.data));
      XToast.hideLoading();
      return;
    }
    XToast.hideLoading();
  }

  void moveTocreateOrigin() async {
    final OriginModel? result = await XCoordinator.push(CreateOriginPage());
    if (result != null) {
      emit(state.copyWith(list: [...state.list, result]));
    }
  }

  void moveToDetailOrigin(String id) async {
    await XCoordinator.push(DetailOriginPage(
      id: id,
    ));

    await getAllOrigin();
  }

  @override
  Future<void> close() {
    XToast.hideLoading();
    return super.close();
  }
}
