import 'package:equatable/equatable.dart';
import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/product_model.dart';
import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'list_cathe_state.dart';

class ListCatheBloc extends Cubit<ListCatheState> {
  ListCatheBloc() : super(const ListCatheState()) {
    init();
  }

  Domain get domain => GetIt.I<Domain>();

  void init() async {
    await getAllProduct();
  }

  Future<void> getAllProduct() async {
    XToast.showLoading();
    final result = await domain.product.getAllProduct();
    if (result.isSuccess) {
      emit(state.copyWith(list: result.data));
      XToast.hideLoading();
      return;
    }
    XToast.hideLoading();
  }

  @override
  Future<void> close() {
    XToast.hideLoading();
    return super.close();
  }
}
