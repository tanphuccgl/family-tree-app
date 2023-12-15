// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'family_tree_bloc.dart';

class FamilyTreeState extends Equatable {
  final bool isShowSelectArea;

  final List<IndividualModel> list;
  final AreaModel? currnentArea;
  final List<AreaModel> listArea;

  final List<Edge> edges;
  final List<Node> nodes;

  const FamilyTreeState({
    this.list = const [],
    this.isShowSelectArea = true,
    this.listArea = const [],
    this.currnentArea,
    this.edges = const [],
    this.nodes = const [],
  });
  @override
  List<Object?> get props => [
        list,
        currnentArea,
        isShowSelectArea,
        listArea,
        edges,
        nodes,
      ];

  FamilyTreeState copyWith({
    bool? isShowSelectArea,
    List<IndividualModel>? list,
    AreaModel? currnentArea,
    List<AreaModel>? listArea,
    List<Edge>? edges,
    List<Node>? nodes,
  }) {
    return FamilyTreeState(
      isShowSelectArea: isShowSelectArea ?? this.isShowSelectArea,
      list: list ?? this.list,
      currnentArea: currnentArea ?? this.currnentArea,
      listArea: listArea ?? this.listArea,
      edges: edges ?? this.edges,
      nodes: nodes ?? this.nodes,
    );
  }

  FamilyTreeState clearAreaCurrent() {
    return FamilyTreeState(
      isShowSelectArea: true,
      list: [],
      currnentArea: null,
      listArea: [],
      edges: [],
      nodes: [],
    );
  }
}
