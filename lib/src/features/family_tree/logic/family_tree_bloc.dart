import 'package:equatable/equatable.dart';
import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/product_model.dart';
import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:graphview/GraphView.dart';

part 'family_tree_state.dart';

class FamilyTreeBloc extends Cubit<FamilyTreeState> {
  FamilyTreeBloc() : super(const FamilyTreeState()) {
    init();
  }

  Domain get domain => GetIt.I<Domain>();
  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  void init() async {
    XToast.showLoading();
    builder
      ..siblingSeparation = (100)
      ..levelSeparation = (150)
      ..subtreeSeparation = (150)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
    await getAllProduct();
    XToast.hideLoading();
  }

  void createNode(List<ProductModel> list) {
    for (var element in list) {
      if (element.type != ProductTypeEnum.f0) {
        graph.addEdge(Node.Id(list.singleWhere((e) => e.id == element.fromId)),
            Node.Id(element));
      } else {}
    }
  }

  Future<void> getAllProduct() async {
    final result = await domain.product.getAllProduct();
    if (result.isSuccess) {
      emit(state.copyWith(list: result.data));
      createNode(result.data!);
    }
  }

  @override
  Future<void> close() {
    XToast.hideLoading();
    return super.close();
  }
}
