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
    _checkIdExist();
  }

  void onNextToSelectType() async {
    if (state.currnentArea == null) {
      XToast.error("Vui lòng chọn khu vực");
      return;
    }
    await _getProductsWithArea(state.currnentArea!.id);

    emit(state.copyWith(isShowSelectType: true, isShowSelectArea: false));
  }

  Future<void> _getProductsWithArea(String areaId) async {
    XToast.showLoading();
    final result = await domain.product.getProductsWithArea(areaId);
    if (result.isSuccess) {
      emit(state.copyWith(listIndividualWithArea: result.data));
      XToast.hideLoading();
      return;
    }
    emit(CreateIndividualState());
    XToast.hideLoading();
  }

  void replaceCreatePage() {
    emit(CreateIndividualState(isShowSelectArea: true));
  }

  void onNextToCreateIndividual() {
    if (state.type == null) {
      XToast.error("Vui lòng chọn thế hệ");
      return;
    }

    final parentType = _getParentType(state.type!);
    final isTrue = _hasParent(parentType);
    if (!isTrue && state.type != ProductTypeEnum.f0) {
      XToast.error("Chưa có cha mẹ");
      return;
    }

    emit(state.copyWith(isShowSelectType: false, isShowSelectArea: false));
  }

  ProductTypeEnum _getParentType(ProductTypeEnum currentType) {
    switch (currentType) {
      case ProductTypeEnum.f1:
        return ProductTypeEnum.f0;
      case ProductTypeEnum.f2:
        return ProductTypeEnum.f1;
      case ProductTypeEnum.f3:
        return ProductTypeEnum.f2;

      default:
        return ProductTypeEnum.f0;
    }
  }

  bool _hasParent(ProductTypeEnum parentType) {
    return state.listIndividualWithArea
        .where((e) =>
            e.isMale == true &&
            e.listCopulateId.isNotEmpty &&
            e.type == parentType)
        .toList()
        .isNotEmpty;
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

  void _checkIdExist() async {
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
