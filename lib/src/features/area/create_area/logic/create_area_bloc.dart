import 'package:equatable/equatable.dart';
import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/area_model.dart';
import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

part 'create_area_state.dart';

class CreateAreaBloc extends Cubit<CreateAreaState> {
  final BuildContext context;
  CreateAreaBloc(this.context) : super(CreateAreaState());

  Domain get domain => GetIt.I<Domain>();

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

    final product = AreaModel(
      name: state.name,
      nameId: state.nameId,
      id: Uuid().v4(),
    );

    final result = await domain.area.createArea(product);
    if (result.isSuccess) {
      XToast.success("Tạo thành công");
      XToast.hideLoading();
      Navigator.pop(context, result.data);

      return;
    }
    emit(CreateAreaState());
    XToast.error("Tạo thất bại");
    XToast.hideLoading();
  }
}
