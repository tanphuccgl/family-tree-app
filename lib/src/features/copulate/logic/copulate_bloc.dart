import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/product_model.dart';
import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part "copulate_state.dart";

class CopulateBloc extends Cubit<CopulateState> {
  CopulateBloc() : super(CopulateState()) {
    init();
  }

  Domain get domain => GetIt.I<Domain>();

  void init() {
    getListIndividual(ProductTypeEnum.f0);
  }

  void getListIndividual(ProductTypeEnum type) async {
    final result = await domain.product.getProductWithType(type);
    if (result.isSuccess) {
      emit(state.copyWith(listIndividualCurrent: [...result.data!]));
    }
  }

  void onRefreshButton() {
    emit(CopulateState());
    getListIndividual(state.type);
  }

  Future<void> onButtonCopulate() async {
    final femaleSelected = state.femaleSelected;
    final maleSelected = state.maleSelected;

    if (femaleSelected == null || maleSelected == null) {
      XToast.error("Vui lòng chọn cá thể");
      return;
    }
    if (femaleSelected.origin?.id == maleSelected.origin?.id) {
      XToast.error("Không được phối cận huyết - chung xuất xứ");
      return;
    }

    try {
      await Future.wait([
        domain.product.updateProduct(
          productId: femaleSelected.id,
          item: {
            "listCopulateId": FieldValue.arrayUnion(['${maleSelected.id}'])
          },
        ),
        domain.product.updateProduct(
          productId: maleSelected.id,
          item: {
            "listCopulateId": FieldValue.arrayUnion(['${femaleSelected.id}'])
          },
        ),
      ]);
      emit(CopulateState());
      XToast.success("Thành công");
    } catch (error) {
      XToast.error("Đã xảy ra lỗi: $error");
    }
  }

  void onChangeGenerationSelected(ProductTypeEnum type) async {
    emit(state.copyWith(type: type));
    getListIndividual(type);
  }

  void onSelectMaleIndividual(ProductModel data) {
    if (state.maleSelected?.id == data.id) {
      emit(state.clearSelectMaleIndividual());
      return;
    }
    emit(state.copyWith(maleSelected: data));
  }

  void onSelectFemaleIndividual(ProductModel data) {
    if (state.femaleSelected?.id == data.id) {
      emit(state.clearSelectFemaleIndividual());
      return;
    }
    emit(state.copyWith(femaleSelected: data));
  }
}
