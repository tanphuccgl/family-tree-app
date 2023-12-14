import 'package:equatable/equatable.dart';
import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/area_model.dart';
import 'package:familytree/src/network/model/origin_model.dart';
import 'package:familytree/src/network/model/product_model.dart';
import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

part 'create_individual_state.dart';

class CreateIndividualBloc extends Cubit<CreateIndividualState> {
  final BuildContext context;
  CreateIndividualBloc(this.context) : super(CreateIndividualState()) {
    init();
  }

  Domain get domain => GetIt.I<Domain>();

  void init() {}

  void onChangedName(String value) {
    emit(state.copyWith(name: value));
  }

  void onChangedNameId(String value) {
    emit(state.copyWith(nameId: value));
    checkIdExist();
  }

  void onNextToSelectType() {
    if (state.currnentArea == null) {
      XToast.error("Vui lòng chọn khu vực");
      return;
    }

    emit(state.copyWith(isShowSelectType: true, isShowSelectArea: false));
  }

  void onNextToCreateIndividual() {
    if (state.type == null) {
      XToast.error("Vui lòng chọn thế hệ");
      return;
    }
    emit(state.copyWith(isShowSelectType: false, isShowSelectArea: false));
  }

  void onChangeCurrentType(ProductTypeEnum value) {
    emit(state.copyWith(type: value));
  }

  void onChangeCurrentArea(AreaModel? value) {
    if (value == null) {
      emit(state.clearAreaCurrent());
    } else {
      emit(state.copyWith(currnentArea: value));
    }
  }

  void checkIdExist() async {
    final result = await domain.origin.getOriginWithNameId(state.nameId);
    if (result.isSuccess) {
      emit(state.copyWith(isNameIdExist: true));
      return;
    }
    emit(state.copyWith(isNameIdExist: false));
  }

  void createNewProduct() async {
    if (state.isNameIdExist) {
      XToast.error("Mã đã tồn tại");
      return;
    }

    if (state.name.isEmpty || state.nameId.isEmpty) {
      XToast.error("Vui lòng nhập thông tin bắt buộc");
      return;
    }

    XToast.showLoading();

    final product = OriginModel(
      name: state.name,
      nameId: state.nameId,
      id: Uuid().v4(),
    );

    final result = await domain.origin.createOrigin(product);
    if (result.isSuccess) {
      XToast.success("Tạo thành công");
      XToast.hideLoading();
      emit(CreateIndividualState());
      return;
    }
    emit(CreateIndividualState());
    XToast.error("Tạo thất bại");
    XToast.hideLoading();
  }
}
