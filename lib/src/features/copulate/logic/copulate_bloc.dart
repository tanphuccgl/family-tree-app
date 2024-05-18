import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/area_model.dart';
import 'package:familytree/src/network/model/individual_model.dart';
import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part "copulate_state.dart";

class CopulateBloc extends Cubit<CopulateState> {
  CopulateBloc() : super(CopulateState());

  Domain get domain => GetIt.I<Domain>();

  void init() {
    getListIndividual(GenerationEnum.f0);
  }

  void getListIndividual(GenerationEnum type) async {
    if (state.currnentArea == null) {
      return;
    }
    final result = await domain.individual.getIndividualWithType(type);
    if (result.isSuccess) {
      final data = [...result.data!];
      final list = data
          .where((e) => e.area?.nameId == state.currnentArea!.nameId)
          .toList();
      emit(state.copyWith(listIndividualCurrent: list));
    }
  }

  void onTapTitleArea() {
    emit(state.clearAreaCurrent());
  }

  void onChangeCurrentArea(AreaModel value) {
    emit(state.copyWith(currnentArea: value));
    init();
  }

  void onRefreshButton() {
    emit(state.refreshData());
    getListIndividual(state.type);
  }

  Future<void> onButtonCopulate() async {
    final femaleSelected = state.femaleSelected;
    final maleSelected = state.maleSelected;

    if (femaleSelected == null || maleSelected == null) {
      XToast.error("Vui lòng chọn cá thể");
      return;
    }
    //TODO
    // if (femaleSelected.origin?.id == maleSelected.origin?.id) {
    //   XToast.error("Không được phối cận huyết - chung xuất xứ");
    //   return;
    // }
    XToast.showLoading();

    try {
      await Future.wait([
        domain.individual.updateIndividual(
          individualId: femaleSelected.id,
          item: {
            "listCopulateId": FieldValue.arrayUnion(['${maleSelected.id}'])
          },
        ),
        domain.individual.updateIndividual(
          individualId: maleSelected.id,
          item: {
            "listCopulateId": FieldValue.arrayUnion(['${femaleSelected.id}'])
          },
        ),
      ]);
      onRefreshButton();
      XToast.success("Thành công");
      XToast.hideLoading();
    } catch (error) {
      onRefreshButton();
      XToast.error("Đã xảy ra lỗi: $error");
      XToast.hideLoading();
    }
  }

  void onChangeGenerationSelected(GenerationEnum type) async {
    emit(state.copyWith(type: type));
    getListIndividual(type);
  }

  void onSelectMaleIndividual(IndividualModel data) {
    if (state.maleSelected?.id == data.id) {
      emit(state.clearSelectMaleIndividual());
      return;
    }
    emit(state.copyWith(maleSelected: data));
  }

  void onSelectFemaleIndividual(IndividualModel data) {
    if (state.femaleSelected?.id == data.id) {
      emit(state.clearSelectFemaleIndividual());
      return;
    }
    emit(state.copyWith(femaleSelected: data));
  }
}
