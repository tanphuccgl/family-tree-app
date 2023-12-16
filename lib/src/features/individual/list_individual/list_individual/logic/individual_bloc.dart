import 'package:equatable/equatable.dart';

import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/individual_model.dart';

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
    final result = await domain.individual.getAllIndividual();
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
        .map((id) => domain.individual.deleteIndividual(id)));

    getAllIndividual();
    onClearButton();
    XToast.hideLoading();
  }

  void onChangedSearchText(String value) {
    emit(state.copyWith(searchText: value));
  }

  void onSearchButton() async {
    if (state.searchText.isEmpty) {
      return;
    }

    final result = await domain.individual.getAllIndividual();
    if (result.isSuccess) {
      final list = result.data!
          .where((element) =>
              element.id.toLowerCase() == state.searchText.toLowerCase())
          .toList();
      emit(state.copyWith(list: list));
      return;
    }

    XToast.error("Tìm kiếm thất bại");
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
    ));
  }

  void onTapTitleId() {
    if (state.enableSortWithId) {
      emit(state.copyWith(list: _sortIndividualListById(state.list)));
    } else {
      emit(state.copyWith(list: _sortIndividualListById(state.list, true)));
    }
    emit(state.copyWith(
      enableSortWithId: !state.enableSortWithId,
    ));
  }

  void onTapTitleOrigin() {
    if (state.enableSortWithOrigin) {
      emit(state.copyWith(list: _sortIndividualListByOrigin(state.list)));
    } else {
      emit(state.copyWith(list: _sortIndividualListByOrigin(state.list, true)));
    }
    emit(state.copyWith(
      enableSortWithOrigin: !state.enableSortWithOrigin,
    ));
  }

  void onTapTitleType() {
    if (state.enableSortWithType) {
      emit(state.copyWith(list: _sortIndividualListByType(state.list)));
    } else {
      emit(state.copyWith(list: _sortIndividualListByType(state.list, true)));
    }
    emit(state.copyWith(
      enableSortWithType: !state.enableSortWithType,
    ));
  }

  void onTapTitleSex() {
    if (state.enableSortWithSex) {
      emit(state.copyWith(list: _sortIndividualListBySex(state.list)));
    } else {
      emit(state.copyWith(list: _sortIndividualListBySex(state.list, true)));
    }
    emit(state.copyWith(
      enableSortWithSex: !state.enableSortWithSex,
    ));
  }

  void onTapTitleArea() {
    if (state.enableSortWithArea) {
      emit(state.copyWith(list: _sortIndividualListByArea(state.list)));
    } else {
      emit(state.copyWith(list: _sortIndividualListByArea(state.list, true)));
    }
    emit(state.copyWith(
      enableSortWithArea: !state.enableSortWithArea,
    ));
  }

  void onTapTitleFatherId() {
    if (state.enableSortWithFatherId) {
      emit(state.copyWith(list: _sortIndividualListByFatherId(state.list)));
    } else {
      emit(state.copyWith(
          list: _sortIndividualListByFatherId(state.list, true)));
    }
    emit(state.copyWith(
      enableSortWithFatherId: !state.enableSortWithFatherId,
    ));
  }

  void onTapTitleMotherId() {
    if (state.enableSortWithMotherId) {
      emit(state.copyWith(list: _sortIndividualListByMotherId(state.list)));
    } else {
      emit(state.copyWith(
          list: _sortIndividualListByMotherId(state.list, true)));
    }
    emit(state.copyWith(
      enableSortWithMotherId: !state.enableSortWithMotherId,
    ));
  }

  void onTapTitleDate() {
    if (state.enableSortWithDate) {
      emit(state.copyWith(list: _sortIndividualListByDate(state.list)));
    } else {
      emit(state.copyWith(list: _sortIndividualListByDate(state.list, true)));
    }
    emit(state.copyWith(
      enableSortWithDate: !state.enableSortWithDate,
    ));
  }

  void onTapTitleAge() {
    if (state.enableSortWithAge) {
      emit(state.copyWith(list: _sortIndividualListByAge(state.list)));
    } else {
      emit(state.copyWith(list: _sortIndividualListByAge(state.list, true)));
    }
    emit(state.copyWith(
      enableSortWithAge: !state.enableSortWithAge,
    ));
  }

  void onTapTitleColor() {
    if (state.enableSortWithColor) {
      emit(state.copyWith(list: _sortIndividualListByColor(state.list)));
    } else {
      emit(state.copyWith(list: _sortIndividualListByColor(state.list, true)));
    }
    emit(state.copyWith(
      enableSortWithColor: !state.enableSortWithColor,
    ));
  }

  void onTapTitleFood() {
    if (state.enableSortWithFood) {
      emit(state.copyWith(list: _sortIndividualListByFood(state.list)));
    } else {
      emit(state.copyWith(list: _sortIndividualListByFood(state.list, true)));
    }
    emit(state.copyWith(
      enableSortWithFood: !state.enableSortWithFood,
    ));
  }

  void onTapTitlePrice() {
    if (state.enableSortWithPrice) {
      emit(state.copyWith(list: _sortIndividualListByPrice(state.list)));
    } else {
      emit(state.copyWith(list: _sortIndividualListByPrice(state.list, true)));
    }
    emit(state.copyWith(
      enableSortWithPrice: !state.enableSortWithPrice,
    ));
  }

  void onTapTitleReview() {
    if (state.enableSortWithReview) {
      emit(state.copyWith(list: _sortIndividualListByReview(state.list)));
    } else {
      emit(state.copyWith(list: _sortIndividualListByReview(state.list, true)));
    }
    emit(state.copyWith(
      enableSortWithReview: !state.enableSortWithReview,
    ));
  }

  void onTapTitleWeight() {
    if (state.enableSortWithWeight) {
      emit(state.copyWith(list: _sortIndividualListByWeight(state.list)));
    } else {
      emit(state.copyWith(list: _sortIndividualListByWeight(state.list, true)));
    }
    emit(state.copyWith(
      enableSortWithWeight: !state.enableSortWithWeight,
    ));
  }

  List<IndividualModel> _sortIndividualListByName(
      List<IndividualModel> individualList,
      [bool reverse = false]) {
    individualList.sort((a, b) => a.name.compareTo(b.name));
    if (reverse) {
      individualList.sort((a, b) => b.name.compareTo(a.name));
    }
    return individualList;
  }

  List<IndividualModel> _sortIndividualListById(
      List<IndividualModel> individualList,
      [bool reverse = false]) {
    individualList.sort((a, b) => a.id.compareTo(b.id));
    if (reverse) {
      individualList.sort((a, b) => b.id.compareTo(a.id));
    }
    return individualList;
  }

  List<IndividualModel> _sortIndividualListByOrigin(
      List<IndividualModel> individualList,
      [bool reverse = false]) {
    individualList.sort(
        (a, b) => (a.origin?.name ?? "").compareTo((b.origin?.name ?? "")));
    if (reverse) {
      individualList.sort(
          (a, b) => (b.origin?.name ?? "").compareTo((a.origin?.name ?? "")));
    }
    return individualList;
  }

  List<IndividualModel> _sortIndividualListByType(
      List<IndividualModel> individualList,
      [bool reverse = false]) {
    individualList.sort((a, b) => (a.type.labelOf).compareTo((b.type.labelOf)));
    if (reverse) {
      individualList
          .sort((a, b) => (b.type.labelOf).compareTo((a.type.labelOf)));
    }
    return individualList;
  }

  List<IndividualModel> _sortIndividualListBySex(
      List<IndividualModel> individualList,
      [bool reverse = false]) {
    individualList
        .sort((a, b) => (a.isMale.toString()).compareTo((b.isMale.toString())));
    if (reverse) {
      individualList.sort(
          (a, b) => (b.isMale.toString()).compareTo((a.isMale.toString())));
    }
    return individualList;
  }

  List<IndividualModel> _sortIndividualListByArea(
      List<IndividualModel> individualList,
      [bool reverse = false]) {
    individualList
        .sort((a, b) => (a.area?.name ?? "").compareTo((b.area?.name ?? "")));
    if (reverse) {
      individualList
          .sort((a, b) => (b.area?.name ?? "").compareTo((a.area?.name ?? "")));
    }
    return individualList;
  }

  List<IndividualModel> _sortIndividualListByFatherId(
      List<IndividualModel> individualList,
      [bool reverse = false]) {
    individualList.sort((a, b) => (a.fatherId).compareTo((b.fatherId)));
    if (reverse) {
      individualList.sort((a, b) => (b.fatherId).compareTo((a.fatherId)));
    }
    return individualList;
  }

  List<IndividualModel> _sortIndividualListByMotherId(
      List<IndividualModel> individualList,
      [bool reverse = false]) {
    individualList.sort((a, b) => (a.motherId).compareTo((b.motherId)));
    if (reverse) {
      individualList.sort((a, b) => (b.motherId).compareTo((a.motherId)));
    }
    return individualList;
  }

  List<IndividualModel> _sortIndividualListByDate(
      List<IndividualModel> individualList,
      [bool reverse = false]) {
    individualList.sort((a, b) => (a.date).compareTo((b.date)));
    if (reverse) {
      individualList.sort((a, b) => (b.date).compareTo((a.date)));
    }
    return individualList;
  }

  List<IndividualModel> _sortIndividualListByAge(
      List<IndividualModel> individualList,
      [bool reverse = false]) {
    individualList.sort((a, b) => (a.age).compareTo((b.age)));
    if (reverse) {
      individualList.sort((a, b) => (b.age).compareTo((a.age)));
    }
    return individualList;
  }

  List<IndividualModel> _sortIndividualListByColor(
      List<IndividualModel> individualList,
      [bool reverse = false]) {
    individualList.sort((a, b) => (a.color).compareTo((b.color)));
    if (reverse) {
      individualList.sort((a, b) => (b.color).compareTo((a.color)));
    }
    return individualList;
  }

  List<IndividualModel> _sortIndividualListByFood(
      List<IndividualModel> individualList,
      [bool reverse = false]) {
    individualList.sort((a, b) => (a.food).compareTo((b.food)));
    if (reverse) {
      individualList.sort((a, b) => (b.food).compareTo((a.food)));
    }
    return individualList;
  }

  List<IndividualModel> _sortIndividualListByPrice(
      List<IndividualModel> individualList,
      [bool reverse = false]) {
    individualList.sort((a, b) => (a.price).compareTo((b.price)));
    if (reverse) {
      individualList.sort((a, b) => (b.price).compareTo((a.price)));
    }
    return individualList;
  }

  List<IndividualModel> _sortIndividualListByReview(
      List<IndividualModel> individualList,
      [bool reverse = false]) {
    individualList.sort((a, b) => (a.review).compareTo((b.review)));
    if (reverse) {
      individualList.sort((a, b) => (b.review).compareTo((a.review)));
    }
    return individualList;
  }

  List<IndividualModel> _sortIndividualListByWeight(
      List<IndividualModel> individualList,
      [bool reverse = false]) {
    individualList.sort((a, b) => (a.weight).compareTo((b.weight)));
    if (reverse) {
      individualList.sort((a, b) => (b.weight).compareTo((a.weight)));
    }
    return individualList;
  }

  @override
  Future<void> close() {
    XToast.hideLoading();
    return super.close();
  }
}
