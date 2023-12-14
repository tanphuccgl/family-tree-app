import 'package:equatable/equatable.dart';
import 'package:familytree/src/features/individual/list_individual/create_individual/logic/create_individual_bloc.dart';

import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/area_model.dart';

import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'get_list_area_state.dart';

class GetListAreaBloc extends Cubit<GetListAreaState> {
  final BuildContext context;
  GetListAreaBloc(this.context) : super(GetListAreaState()) {
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

  void onSelectArea(AreaModel value) async {
    if (value.id == state.selectedArea?.id) {
      emit(state.clearCurrentArea());
    } else {
      emit(state.copyWith(selectedArea: value));
    }

    context
        .read<CreateIndividualBloc>()
        .onChangeCurrentArea(state.selectedArea);
  }

  void onTapTitleName() {
    if (state.enableSortWithName) {
      emit(state.copyWith(list: _sortAreaListByName(state.list)));
    } else {
      emit(state.copyWith(list: _sortAreaListByName(state.list, true)));
    }
    emit(state.copyWith(
      enableSortWithName: !state.enableSortWithName,
      enableSortWithNameId: false,
    ));
  }

  void onTapTitleNameId() {
    if (state.enableSortWithNameId) {
      emit(state.copyWith(list: _sortAreaListByNameId(state.list)));
    } else {
      emit(state.copyWith(list: _sortAreaListByNameId(state.list, true)));
    }
    emit(state.copyWith(
      enableSortWithNameId: !state.enableSortWithNameId,
      enableSortWithName: false,
    ));
  }

  List<AreaModel> _sortAreaListByName(List<AreaModel> areaList,
      [bool reverse = false]) {
    areaList.sort((a, b) => a.name.compareTo(b.name));
    if (reverse) {
      areaList.sort((a, b) => b.name.compareTo(a.name));
    }
    return areaList;
  }

  List<AreaModel> _sortAreaListByNameId(List<AreaModel> areaList,
      [bool reverse = false]) {
    areaList.sort((a, b) => a.nameId.compareTo(b.nameId));
    if (reverse) {
      areaList.sort((a, b) => b.nameId.compareTo(a.nameId));
    }
    return areaList;
  }

  @override
  Future<void> close() {
    XToast.hideLoading();
    return super.close();
  }
}
