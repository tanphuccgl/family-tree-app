import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';

import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/area_model.dart';
import 'package:familytree/src/router/app_router.gr.dart';

import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'area_state.dart';

class AreaBloc extends Cubit<AreaState> {
  final BuildContext context;
  AreaBloc(this.context) : super(AreaState()) {
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

  Future<void> deleteArea() async {
    XToast.showLoading();

    await Future.wait(
        state.listAreaSelected.map((id) => domain.area.deleteArea(id)));

    getAllArea();
    onClearButton();
    XToast.hideLoading();
  }

  void onRefreshButton() async {
    getAllArea();
  }

  void onShowDetailArea(BuildContext context, String areaId) {
    context.router.push(DetailAreaRoute(areaId: areaId));
  }

  void onCheckBoxAll(bool value) {
    if (value) {
      emit(state.copyWith(
          listAreaSelected: state.list.map((e) => e.id).toList()));
    } else {
      emit(state.copyWith(listAreaSelected: []));
    }
  }

  void onCheckBoxItem(String id) {
    final isExists = state.listAreaSelected.contains(id);
    if (isExists) {
      final List<String> result = [...state.listAreaSelected];
      result.remove(id);

      emit(state.copyWith(listAreaSelected: result));
    } else {
      emit(state.copyWith(listAreaSelected: [...state.listAreaSelected, id]));
    }
  }

  void onClearButton() {
    emit(state.copyWith(listAreaSelected: []));
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
