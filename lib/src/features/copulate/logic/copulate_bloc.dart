import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/product_model.dart';
import 'package:familytree/src/router/coordinator.dart';
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
    getListAllIndividual();
    getListIndividual(ProductTypeEnum.f0);
  }

  void getListAllIndividual() async {
    final result = await domain.product.getAllProduct();
    if (result.isSuccess) {
      emit(state.copyWith(emptyListAll: result.data!.isEmpty));
    }
  }

  void getListIndividual(ProductTypeEnum type) async {
    final result = await domain.product.getProductWithType(type);
    if (result.isSuccess) {
      emit(state.copyWith(listIndividualCurrent: [...result.data!]));
    }
  }

  Future<void> onButtonCopulate() async {
    final femaleSelected = state.femaleSelected;
    final maleSelected = state.maleSelected;

    if (femaleSelected == null || maleSelected == null) {
      XToast.error("Vui lòng chọn đủ");
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

      XCoordinator.pop();
    } catch (error) {
      XToast.error("Đã xảy ra lỗi: $error");
    }
  }

  void onChangeGenerationSelected(ProductTypeEnum type) async {
    emit(state.copyWith(type: type));
    getListIndividual(type);
  }

  void onSelectMaleIndividual(ProductModel data) {
    emit(state.copyWith(maleSelected: data));
  }

  void onSelectFemaleIndividual(ProductModel data) {
    emit(state.copyWith(femaleSelected: data));
  }
}
