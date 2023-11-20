import 'package:equatable/equatable.dart';
import 'package:familytree/src/features/create_area/pages/create_area_page.dart';
import 'package:familytree/src/features/detail_area/pages/detail_area_page.dart';
import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/area_model.dart';
import 'package:familytree/src/router/coordinator.dart';
import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part "area_state.dart";

class AreaBloc extends Cubit<AreaState> {
  AreaBloc() : super(AreaState()) {
    init();
  }

  Domain get domain => GetIt.I<Domain>();

  void init() async {
    await getAllArea();
  }

  Future<void> getAllArea() async {
    XToast.showLoading();
    final result = await domain.area.getAllArea();
    if (result.isSuccess) {
      emit(state.copyWith(list: result.data));
      XToast.hideLoading();
      return;
    }
    XToast.hideLoading();
  }

  void moveTocreateArea() async {
    final AreaModel? result = await XCoordinator.push(CreateAreaPage());
    if (result != null) {
      emit(state.copyWith(list: [...state.list, result]));
    }
  }

  void moveToDetailArea(String id) async {
    await XCoordinator.push(DetailAreaPage(
      id: id,
    ));

    await getAllArea();
  }

  @override
  Future<void> close() {
    XToast.hideLoading();
    return super.close();
  }
}
