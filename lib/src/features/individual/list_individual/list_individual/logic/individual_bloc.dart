import 'package:equatable/equatable.dart';

import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/product_model.dart';

import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'individual_state.dart';

class IndividualBloc extends Cubit<IndividualState> {
  final BuildContext context;
  IndividualBloc(this.context) : super(IndividualState()) {
    init();
  }

  Domain get domain => GetIt.I<Domain>();

  ScrollController scrollController1 = ScrollController();
  ScrollController scrollController2 = ScrollController();

  void syncScrollController() {
    bool shouldSync = true;

    scrollController1.addListener(() {
      if (shouldSync &&
          scrollController1.position.pixels !=
              scrollController2.position.pixels) {
        scrollController2.jumpTo(scrollController1.position.pixels
            .clamp(0.0, scrollController2.position.maxScrollExtent));
      }
    });

    scrollController2.addListener(() {
      if (shouldSync &&
          scrollController2.position.pixels !=
              scrollController1.position.pixels) {
        scrollController1.jumpTo(scrollController2.position.pixels
            .clamp(0.0, scrollController1.position.maxScrollExtent));
      }
    });
  }

  void init() async {
    await getAllIndividual();
    syncScrollController();
  }

  Future<void> getAllIndividual() async {
    XToast.showLoading();
    final result = await domain.product.getAllProduct();
    if (result.isSuccess) {
      emit(state.copyWith(list: result.data));
      XToast.hideLoading();
      return;
    }
    XToast.hideLoading();
  }

  Future<void> deleteIndividual() async {
    XToast.showLoading();

    await Future.wait(state.listIndividualSelected
        .map((id) => domain.product.deleteProduct(id)));

    getAllIndividual();
    onClearButton();
    XToast.hideLoading();
  }

  void onRefreshButton() async {
    getAllIndividual();
  }

  void onShowDetailIndividual(String id) async {
    emit(state.copyWith(detailIndividualSelectedId: id));
  }

  void onCloseButton() {
    emit(state.copyWith(detailIndividualSelectedId: ""));
  }

  void onCheckBoxAll(bool value) {
    if (value) {
      emit(state.copyWith(
          listIndividualSelected: state.list.map((e) => e.id).toList()));
    } else {
      emit(state.copyWith(listIndividualSelected: []));
    }
  }

  void onCheckBoxItem(String id) {
    final isExists = state.listIndividualSelected.contains(id);
    if (isExists) {
      final List<String> result = [...state.listIndividualSelected];
      result.remove(id);

      emit(state.copyWith(listIndividualSelected: result));
    } else {
      emit(state.copyWith(
          listIndividualSelected: [...state.listIndividualSelected, id]));
    }
  }

  void onClearButton() {
    emit(state.copyWith(listIndividualSelected: []));
  }

  void onTapTitleName() {
    if (state.enableSortWithName) {
      emit(state.copyWith(list: _sortIndividualListByName(state.list)));
    } else {
      emit(state.copyWith(list: _sortIndividualListByName(state.list, true)));
    }
    emit(state.copyWith(
      enableSortWithName: !state.enableSortWithName,
      enableSortWithNameId: false,
    ));
  }

  void onTapTitleNameId() {
    if (state.enableSortWithNameId) {
      emit(state.copyWith(list: _sortIndividualListByNameId(state.list)));
    } else {
      emit(state.copyWith(list: _sortIndividualListByNameId(state.list, true)));
    }
    emit(state.copyWith(
      enableSortWithNameId: !state.enableSortWithNameId,
      enableSortWithName: false,
    ));
  }

  List<ProductModel> _sortIndividualListByName(
      List<ProductModel> individualList,
      [bool reverse = false]) {
    individualList.sort((a, b) => a.name.compareTo(b.name));
    if (reverse) {
      individualList.sort((a, b) => b.name.compareTo(a.name));
    }
    return individualList;
  }

  List<ProductModel> _sortIndividualListByNameId(
      List<ProductModel> individualList,
      [bool reverse = false]) {
    // individualList.sort((a, b) => a.nameId.compareTo(b.nameId));
    // if (reverse) {
    //   individualList.sort((a, b) => b.nameId.compareTo(a.nameId));
    // }
    return individualList;
  }

  @override
  Future<void> close() {
    XToast.hideLoading();
    return super.close();
  }
}
