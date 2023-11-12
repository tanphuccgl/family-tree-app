import 'package:equatable/equatable.dart';
import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/product_model.dart';
import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
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
    await getAllProduct();
  }

  Future<void> getAllProduct() async {
    XToast.showLoading();
    final result = await domain.product.getProduct(id);
    if (result.isSuccess) {
      emit(state.copyWith(data: result.data));
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
