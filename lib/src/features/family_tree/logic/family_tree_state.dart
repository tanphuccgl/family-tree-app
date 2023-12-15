// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'family_tree_bloc.dart';

class FamilyTreeState extends Equatable {
  final List<IndividualModel> list;
  final String areaIdSelected;
  final List<AreaModel> listArea;
  final List<Edge> edges;
  final List<Node> nodes;

  const FamilyTreeState({
    this.list = const [],
    this.listArea = const [],
    this.areaIdSelected = "",
    this.edges = const [],
    this.nodes = const [],
  });
  @override
  List<Object?> get props => [
        list,
        areaIdSelected,
        listArea,
        edges,
        nodes,
      ];

  FamilyTreeState copyWith({
    List<IndividualModel>? list,
    String? areaIdSelected,
    List<AreaModel>? listArea,
    List<Edge>? edges,
    List<Node>? nodes,
  }) {
    return FamilyTreeState(
      list: list ?? this.list,
      areaIdSelected: areaIdSelected ?? this.areaIdSelected,
      listArea: listArea ?? this.listArea,
      edges: edges ?? this.edges,
      nodes: nodes ?? this.nodes,
    );
  }
}
