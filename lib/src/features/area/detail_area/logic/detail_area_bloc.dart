import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/area_model.dart';
import 'package:familytree/src/router/app_router.gr.dart';
import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'detail_area_state.dart';

class DetailAreaBloc extends Cubit<DetailAreaState> {
  final BuildContext context;
  final String id;
  DetailAreaBloc(this.context, this.id) : super(DetailAreaState()) {
    getArea();
  }

  Domain get domain => GetIt.I<Domain>();

  void getArea() async {
    final result = await domain.area.getAreaWithId(id);
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
    final result = await domain.area.getAreaWithNameId(state.nameId);
    if (result.isSuccess) {
      emit(state.copyWith(isNameIdExist: true));
      return;
    }
    emit(state.copyWith(isNameIdExist: false));
  }

  void onCancelButton() {
    emit(DetailAreaState());
    getArea();
  }

  void onCloseButton() {
    context.router.canPop()
        ? context.router.pop()
        : context.router.pushAndPopUntil(AreaRoute(), predicate: (_) => false);
  }

  void createNewArea() async {
    if (state.isNameIdExist) {
      XToast.error("Mã đã tồn tại");
      return;
    }

    if (state.name.isEmpty || state.nameId.isEmpty) {
      XToast.error("Vui lòng nhập thông tin bắt buộc");
      return;
    }

    XToast.showLoading();

    final model = AreaModel(
      name: state.name,
      nameId: state.nameId,
      id: id,
    );

    final result = await domain.area.createArea(model);
    if (result.isSuccess) {
      emit(DetailAreaState());
      XToast.success("Chỉnh sửa thành công");
      XToast.hideLoading();
      onCloseButton();
      return;
    }
    emit(DetailAreaState());
    XToast.error("Chỉnh sửa thất bại");
    XToast.hideLoading();
    onCloseButton();
  }

  Future<void> deleteArea() async {
    XToast.showLoading();
    final result = await domain.area.deleteArea(id);
    if (result.isSuccess) {
      emit(DetailAreaState());
      XToast.success("Xóa thành công");
      XToast.hideLoading();
      onCloseButton();
      return;
    }

    emit(DetailAreaState());
    XToast.error("Xóa thất bại");
    XToast.hideLoading();
    onCloseButton();
  }

  void onChangeEdit() {
    emit(state.copyWith(isEdit: true));
  }

  @override
  Future<void> close() {
    XToast.hideLoading();
    return super.close();
  }
}
