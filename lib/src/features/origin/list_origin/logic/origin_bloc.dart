import 'package:equatable/equatable.dart';
import 'package:familytree/src/features/origin/detail_origin/pages/detail_origin_page.dart';

import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/origin_model.dart';

import 'package:familytree/src/router/coordinator.dart';
import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'origin_state.dart';

class OriginBloc extends Cubit<OriginState> {
  final BuildContext context;
  OriginBloc(this.context) : super(OriginState()) {
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

  Future<void> deleteOrigin() async {
    XToast.showLoading();

    await Future.wait(
        state.listOriginSelected.map((id) => domain.origin.deleteOrigin(id)));

    getAllOrigin();
    onClearButton();
    XToast.hideLoading();
  }

  void onRefreshButton() async {
    getAllOrigin();
  }

  void moveToDetailOrigin(String id) async {
    await XCoordinator.push(DetailOriginPage(id: id));
    await getAllOrigin();
  }

  void onCheckBoxAll(bool value) {
    if (value) {
      emit(state.copyWith(
          listOriginSelected: state.list.map((e) => e.id).toList()));
    } else {
      emit(state.copyWith(listOriginSelected: []));
    }
  }

  void onCheckBoxItem(String id) {
    final isExists = state.listOriginSelected.contains(id);
    if (isExists) {
      final List<String> result = [...state.listOriginSelected];
      result.remove(id);

      emit(state.copyWith(listOriginSelected: result));
    } else {
      emit(state
          .copyWith(listOriginSelected: [...state.listOriginSelected, id]));
    }
  }

  void onClearButton() {
    emit(state.copyWith(listOriginSelected: []));
  }

  void onTapTitleName() {
    if (state.enableSortWithName) {
      emit(state.copyWith(list: _sortOriginListByName(state.list)));
    } else {
      emit(state.copyWith(list: _sortOriginListByName(state.list, true)));
    }
    emit(state.copyWith(
      enableSortWithName: !state.enableSortWithName,
      enableSortWithNameId: false,
    ));
  }

  void onTapTitleNameId() {
    if (state.enableSortWithNameId) {
      emit(state.copyWith(list: _sortOriginListByNameId(state.list)));
    } else {
      emit(state.copyWith(list: _sortOriginListByNameId(state.list, true)));
    }
    emit(state.copyWith(
      enableSortWithNameId: !state.enableSortWithNameId,
      enableSortWithName: false,
    ));
  }

  List<OriginModel> _sortOriginListByName(List<OriginModel> originList,
      [bool reverse = false]) {
    originList.sort((a, b) => a.name.compareTo(b.name));
    if (reverse) {
      originList.sort((a, b) => b.name.compareTo(a.name));
    }
    return originList;
  }

  List<OriginModel> _sortOriginListByNameId(List<OriginModel> originList,
      [bool reverse = false]) {
    originList.sort((a, b) => a.nameId.compareTo(b.nameId));
    if (reverse) {
      originList.sort((a, b) => b.nameId.compareTo(a.nameId));
    }
    return originList;
  }

  @override
  Future<void> close() {
    XToast.hideLoading();
    return super.close();
  }
}
