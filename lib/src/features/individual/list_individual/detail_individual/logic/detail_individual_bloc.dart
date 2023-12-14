import 'package:equatable/equatable.dart';
import 'package:familytree/src/features/origin/list_origin/logic/origin_bloc.dart';
import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/origin_model.dart';

import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'detail_individual_state.dart';

class DetailIndividualBloc extends Cubit<DetailIndividualState> {
  final BuildContext context;
  final String id;
  DetailIndividualBloc(this.context, this.id) : super(DetailIndividualState()) {
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
    emit(DetailIndividualState());
    getOrigin();
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
      id: id,
    );

    final result = await domain.origin.createOrigin(product);
    if (result.isSuccess) {
      emit(DetailIndividualState());
      XToast.success("Chỉnh sửa thành công");
      XToast.hideLoading();
      context.read<OriginBloc>().onCloseButton();
      return;
    }
    emit(DetailIndividualState());
    XToast.error("Chỉnh sửa thất bại");
    XToast.hideLoading();
    context.read<OriginBloc>().onCloseButton();
  }

  Future<void> deleteOrigin() async {
    XToast.showLoading();
    final result = await domain.origin.deleteOrigin(id);
    if (result.isSuccess) {
      emit(DetailIndividualState());
      XToast.success("Xóa thành công");
      XToast.hideLoading();
      context.read<OriginBloc>().onCloseButton();

      return;
    }
    emit(DetailIndividualState());
    XToast.error("Xóa thất bại");
    XToast.hideLoading();
    context.read<OriginBloc>().onCloseButton();
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
