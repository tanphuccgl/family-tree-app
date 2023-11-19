// ignore_for_file: use_build_context_synchronously

import 'package:equatable/equatable.dart';
import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/product_model.dart';
import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'detail_cathe_state.dart';

class DetailCatheBloc extends Cubit<DetailCatheState> {
  final String id;
  DetailCatheBloc(this.id) : super(DetailCatheState(data: ProductModel())) {
    init();
  }

  Domain get domain => GetIt.I<Domain>();

  void init() async {
    await getProduct();
  }

  Future<void> getProduct() async {
    XToast.showLoading();
    final result = await domain.product.getProduct(id);
    if (result.isSuccess) {
      emit(state.copyWith(data: result.data));
      XToast.hideLoading();
      return;
    }
    XToast.hideLoading();
  }

  Future<void> deleteProduct(BuildContext context) async {
    XToast.showLoading();
    final result = await domain.product.deleteProduct(id);
    if (result.isSuccess) {
      XToast.success("Xóa thành công");
      XToast.hideLoading();

      Navigator.pop(context);
      return;
    }
    XToast.error("Xóa thất bại");
    XToast.hideLoading();
  }

  Future<void> onConfirmButton(BuildContext context) async {
    XToast.showLoading();
    final result = await domain.product.deleteProduct(id);
    if (result.isSuccess) {
      XToast.success("Xóa thành công");
      XToast.hideLoading();

      Navigator.pop(context);
      return;
    }
    XToast.error("Xóa thất bại");
    XToast.hideLoading();
  }

  Future<void> updateProduct() async {
    emit(state.copyWith(isEdit: true));
    // XToast.showLoading();
    // final result = await domain.product.createProduct(id);
    // if (result.isSuccess) {
    //   XToast.success("Xóa thành công");
    //   XToast.hideLoading();
    //   return;
    // }
    // XToast.error("Xóa thất bại");
    // XToast.hideLoading();
  }

  void copy() {
    Clipboard.setData(ClipboardData(text: state.data.videoLink));

    XToast.show("Sao chép");
  }

  @override
  Future<void> close() {
    XToast.hideLoading();
    return super.close();
  }
}
