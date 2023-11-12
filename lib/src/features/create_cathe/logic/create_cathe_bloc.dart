import 'package:equatable/equatable.dart';
import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/product_model.dart';
import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

part 'create_cathe_state.dart';

class CreateCatheBloc extends Cubit<CreateCatheState> {
  CreateCatheBloc() : super(CreateCatheState());

  Domain get domain => GetIt.I<Domain>();

  void onChangedName(String value) {
    emit(state.copyWith(name: value));
  }

  void onChangedAge(String value) {
    emit(state.copyWith(age: int.tryParse(value) ?? 0));
  }

  void onChangedWeigth(String value) {
    emit(state.copyWith(weight: double.tryParse(value) ?? 0));
  }

  void onChangedPrice(String value) {
    emit(state.copyWith(price: double.tryParse(value) ?? 0));
  }

  void onChangedFamilyCode(String value) {
    emit(state.copyWith(familyCode: value));
  }

  void onChangedReview(String value) {
    emit(state.copyWith(review: value));
  }

  void onChangedColor(String value) {
    emit(state.copyWith(color: value));
  }

  void onChangedSex(bool value) {
    emit(state.copyWith(isMale: value));
  }

  void createNewProduct() async {
    if (state.name.isEmpty || state.familyCode.isEmpty) {
      XToast.error("Vui lòng nhập thông tin bắt buộc");
      return;
    }

    XToast.showLoading();

    // String url = "";
    // if (state.fileImage != null) {
    //   url = await uploadUserAvatar(state.fileImage!) ?? "";
    // }

    final product = ProductModel(
      age: state.age,
      color: state.color,
      date: state.date,
      familyCode: state.familyCode,
      isMale: state.isMale,
      name: state.name,
      price: state.price,
      review: state.review,
      videoLink: state.videoLink,
      weight: state.weight,
      id: const Uuid().v4(),
    );

    final result = await domain.product.createProduct(product);
    if (result.isSuccess) {
      emit(const CreateCatheState());
      XToast.success("Tạo mới cá thể thành công");
      XToast.hideLoading();
      return;
    }
    emit(const CreateCatheState());
    XToast.error("Tạo cá thể thất bại");
    XToast.hideLoading();
  }
}
