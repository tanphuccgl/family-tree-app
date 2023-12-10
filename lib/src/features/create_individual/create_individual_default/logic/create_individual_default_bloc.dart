import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/area_model.dart';
import 'package:familytree/src/network/model/product_model.dart';
import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'create_individual_default_state.dart';

class CreateIndividualDefaultBloc extends Cubit<CreateIndividualDefaultState> {
  final BuildContext context;
  final AreaModel area;
  final ProductTypeEnum type;

  CreateIndividualDefaultBloc(
    this.context, {
    required this.type,
    required this.area,
  }) : super(CreateIndividualDefaultState.ds()) {
    init();
  }

  Domain get domain => GetIt.I<Domain>();

  void init() {
    emit(state.copyWith(area: area, type: type));
    getListParentSuggest();
  }

  void _checkIdExist() async {
    final result = await domain.product.getProduct(state.familyCode);
    if (result.isSuccess) {
      emit(state.copyWith(isFamilyCodeExist: true));
      return;
    }
    emit(state.copyWith(isFamilyCodeExist: false));
  }

  void onChangedName(String value) {
    emit(state.copyWith(name: value));
  }

  void onChangedFamilyCode(String value) {
    emit(state.copyWith(familyCode: value));
    _checkIdExist();
  }

  void onChangedSex(bool value) {
    emit(state.copyWith(isMale: value));
  }

  void onChangedOrigin(String value) {
    emit(state.copyWith(origin: value));
  }

  void onChangedMother(ProductModel value) {
    emit(state.copyWith(motherSelected: value));
  }

  void onChangedFather(ProductModel value) async {
    emit(state.copyWith(fatherSelected: value));

    final list = await Future.wait(value.listCopulateId.map((item) async {
      final result = await getProduct(item);
      return result;
    }));

    emit(state.copyWith(
        listMotherSuggest: list.whereType<ProductModel>().toList()));
  }

  Future<ProductModel?> getProduct(String id) async {
    final result = await domain.product.getProduct(id);
    return result.isSuccess ? result.data! : null;
  }

  void createNewProduct() async {
    if (state.isFamilyCodeExist) {
      XToast.error("Mã đã tồn tại");
      return;
    }
    if (state.fatherSelected == null || state.motherSelected == null) {
      XToast.error("Chọn bố mẹ");
      return;
    }

    XToast.showLoading();

    final product = ProductModel(
      isMale: state.isMale,
      name: state.name,
      id: state.familyCode,
      type: type,
      area: area,
      fatherId: state.fatherSelected!.id,
      motherId: state.motherSelected!.id,
      updateAt: Timestamp.now(),
      createAt: Timestamp.now(),
    );

    final result = await domain.product.createProduct(product);
    if (result.isSuccess) {
      emit(CreateIndividualDefaultState.ds());
      XToast.success("Tạo mới cá thể thành công");
      XToast.hideLoading();
      Navigator.pop(context, result.data);
      return;
    }
    emit(CreateIndividualDefaultState.ds());
    XToast.error("Tạo cá thể thất bại");
    XToast.hideLoading();
  }

  void getListParentSuggest() async {
    ProductTypeEnum? typeQuery;
    print(type);
    switch (type) {
      case ProductTypeEnum.f0:
        break;
      case ProductTypeEnum.f1:
        typeQuery = ProductTypeEnum.f0;
        break;
      case ProductTypeEnum.f2:
        typeQuery = ProductTypeEnum.f1;
        break;
      case ProductTypeEnum.f3:
        typeQuery = ProductTypeEnum.f2;
        break;
    }
    if (typeQuery == null) {
      return;
    }

    final result = await domain.product.getProductWithType(typeQuery);
    if (result.isSuccess) {
      final listParent = result.data!
          .where((e) => e.isMale == true && e.listCopulateId.isNotEmpty)
          .toList();
      emit(state.copyWith(listFatherSuggest: [...listParent]));
    }
  }

  @override
  Future<void> close() {
    XToast.hideLoading();
    return super.close();
  }
}
