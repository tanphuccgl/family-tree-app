import 'package:equatable/equatable.dart';

import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/area_model.dart';
import 'package:familytree/src/network/model/individual_model.dart';
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
  SugiyamaConfiguration builder = SugiyamaConfiguration();

  void init() async {
    XToast.showLoading();
    builder..bendPointShape = CurvedBendPointShape(curveLength: 20);
    await getAllArea();
    await getAllIndividual();

    XToast.hideLoading();
  }

  Future<void> getAllArea() async {
    final result = await domain.area.getAllArea();
    if (result.isSuccess) {
      emit(state.copyWith(listArea: result.data));
      if (result.data!.isNotEmpty) {
        emit(state.copyWith(areaIdSelected: result.data!.first.id));
      }

      return;
    }
  }

  void onChangeAreaIdSelected(String id) async {
    emit(state.copyWith(areaIdSelected: id));
    await getAllIndividual();
  }

  void createNode(List<IndividualModel> list) {
    graph.removeEdges(state.edges);
    graph.removeNodes(state.nodes);
    final List<Edge> edges = [];
    final List<Node> nodes = [];
    final root = list.singleWhere((e) => e.type == GenerationEnum.f0);
    final nodeRoot = Node.Id(root);
    nodes.add(nodeRoot);
    for (var element in list) {
      if (element.type == GenerationEnum.f1) {
        edges.add(Edge(nodeRoot, Node.Id(element)));
        nodes.add(Node.Id(element));
        nodes.add(Node.Id(nodeRoot));
      }
      if (element.type != GenerationEnum.f0 &&
          element.type != GenerationEnum.f1) {
        final a = list.singleWhere((e) => e.id == element.fatherId);
        final b = list.singleWhere((e) => e.id == element.motherId);
        edges.add(Edge(Node.Id(a), Node.Id(element)));
        edges.add(Edge(Node.Id(b), Node.Id(element)));
        nodes.add(Node.Id(a));
        nodes.add(Node.Id(b));
        nodes.add(Node.Id(element));
      }
    }
    emit(state.copyWith(edges: edges));
    emit(state.copyWith(nodes: nodes));
    graph.addEdges(edges);
  }

  Future<void> getAllIndividual() async {
    final result = await domain.individual.getAllIndividual();
    if (result.isSuccess) {
      final list = result.data!
          .where((e) => e.area?.id == state.areaIdSelected)
          .toList();
      emit(state.copyWith(list: list));
//TODO
      // createNode(list);
    }
  }

  void moveToCreateIndividual() async {
    // try {
    //   AreaModel area = state.listArea
    //       .singleWhere((element) => element.id == state.areaIdSelected);

    //   if (state.list.isEmpty) {
    //     XCoordinator.push(CreateIndividualF0RootPage(
    //       area: area,
    //     ));
    //   } else {
    //     XCoordinator.push(ChooseTypeIndividualPage(
    //       area: area,
    //     ));
    //   }
    // } catch (e) {
    //   XToast.error("Có lỗi xảy ra");
    // }
  }

  void moveToItem(String id) async {
    // final ProductModel? result =
    //     await XCoordinator.push(DetailIndividualPage(id: id));
    // if (result != null) {
    //   if (result.id == "") {
    //     onChangeAreaIdSelected(state.areaIdSelected);
    //   }
    // }
  }

  @override
  Future<void> close() {
    XToast.hideLoading();
    return super.close();
  }
}
