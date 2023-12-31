import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';

import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/origin_model.dart';
import 'package:familytree/src/router/app_router.gr.dart';

import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'detail_origin_state.dart';

class DetailOriginBloc extends Cubit<DetailOriginState> {
  final BuildContext context;
  final String id;
  DetailOriginBloc(this.context, this.id) : super(DetailOriginState()) {
    getOrigin();
  }

  Domain get domain => GetIt.I<Domain>();

  void getOrigin() async {
    final result = await domain.origin.getOriginWithId(id);
    if (result.isSuccess) {
      final data = result.data!;
      emit(state.copyWith(name: data.name, nameId: data.nameId));
      return;
    }

    XToast.error("Không thể lấy dữ liệu");
    Navigator.pop(context);
  }

  void onChangedName(String value) {
    emit(state.copyWith(name: value));
  }

  void onChangedNameId(String value) {
    emit(state.copyWith(nameId: value));
    checkIdExist();
  }

  void checkIdExist() async {
    final result = await domain.origin.getOriginWithNameId(state.nameId);
    if (result.isSuccess) {
      emit(state.copyWith(isNameIdExist: true));
      return;
    }
    emit(state.copyWith(isNameIdExist: false));
  }

  void onCancelButton() {
    emit(DetailOriginState());
    getOrigin();
  }

  void createNewOrigin() async {
    if (state.isNameIdExist) {
      XToast.error("Mã đã tồn tại");
      return;
    }

    if (state.name.isEmpty || state.nameId.isEmpty) {
      XToast.error("Vui lòng nhập thông tin bắt buộc");
      return;
    }

    XToast.showLoading();

    final model = OriginModel(
      name: state.name,
      nameId: state.nameId,
      id: id,
    );

    final result = await domain.origin.createOrigin(model);
    if (result.isSuccess) {
      emit(DetailOriginState());
      XToast.success("Chỉnh sửa thành công");
      XToast.hideLoading();
      onCloseButton();
      return;
    }
    emit(DetailOriginState());
    XToast.error("Chỉnh sửa thất bại");
    XToast.hideLoading();
    onCloseButton();
  }

  Future<void> deleteOrigin() async {
    XToast.showLoading();
    final result = await domain.origin.deleteOrigin(id);
    if (result.isSuccess) {
      emit(DetailOriginState());
      XToast.success("Xóa thành công");
      XToast.hideLoading();
      onCloseButton();

      return;
    }
    emit(DetailOriginState());
    XToast.error("Xóa thất bại");
    XToast.hideLoading();
    onCloseButton();
  }

  void onChangeEdit() {
    emit(state.copyWith(isEdit: true));
  }

  void onCloseButton() {
    context.router.canPop()
        ? context.router.pop()
        : context.router
            .pushAndPopUntil(OriginRoute(), predicate: (_) => false);
  }

  @override
  Future<void> close() {
    XToast.hideLoading();
    return super.close();
  }
}
