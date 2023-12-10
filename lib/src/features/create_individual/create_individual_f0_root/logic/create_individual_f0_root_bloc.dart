import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/area_model.dart';
import 'package:familytree/src/network/model/product_model.dart';
import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'create_individual_f0_root_state.dart';

class CreateIndividualF0RootBloc extends Cubit<CreateIndividualF0RootState> {
  final BuildContext context;
  final AreaModel area;

  CreateIndividualF0RootBloc(
    this.context, {
    required this.area,
  }) : super(CreateIndividualF0RootState.ds()) {
    init();
  }

  Domain get domain => GetIt.I<Domain>();

  void init() {
    emit(state.copyWith(area: area));
  }

  void onChangedName(String value) {
    emit(state.copyWith(name: value));
  }

  void onChangedFamilyCode(String value) {
    emit(state.copyWith(familyCode: value));
  }

  void onChangedOrigin(String value) {
    emit(state.copyWith(origin: value));
  }

  void createNewProduct() async {
    if (state.name.isEmpty || state.familyCode.isEmpty) {
      XToast.error("Vui lòng nhập thông tin bắt buộc");
      return;
    }

    XToast.showLoading();

    final product = ProductModel(
      name: state.name,
      id: state.familyCode,
      type: ProductTypeEnum.f0,
      area: area,
      isMale: true,
      updateAt: Timestamp.now(),
      createAt: Timestamp.now(),
    );

    final result = await domain.product.createProduct(product);
    if (result.isSuccess) {
      emit(CreateIndividualF0RootState.ds());
      XToast.success("Tạo mới cá thể thành công");
      XToast.hideLoading();
      Navigator.pop(context, result.data);
      return;
    }
    emit(CreateIndividualF0RootState.ds());
    XToast.error("Tạo cá thể thất bại");
    XToast.hideLoading();
  }

  @override
  Future<void> close() {
    XToast.hideLoading();
    return super.close();
  }
}
