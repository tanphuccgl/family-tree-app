import 'package:familytree/src/features/family_tree/logic/family_tree_bloc.dart';
import 'package:familytree/src/features/family_tree/widgets/item_element_widget.dart';
import 'package:familytree/src/network/model/individual_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphview/GraphView.dart';

class TreeWidget extends StatelessWidget {
  const TreeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FamilyTreeBloc, FamilyTreeState>(
      builder: (context, state) {
        final graph = context.read<FamilyTreeBloc>().graph;
        final builder = context.read<FamilyTreeBloc>().builder;
        if (graph.edges.isEmpty) {
          return Center(child: Text("Không có dữ liệu"));
        }

        return Expanded(
          child: InteractiveViewer(
            constrained: false,
            minScale: 0.1,
            maxScale: 5.0,
            boundaryMargin: const EdgeInsets.all(double.infinity),
            child: GraphView(
              graph: graph,
              algorithm:
                  BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
              paint: Paint()
                ..color = Colors.white
                ..strokeWidth = 1
                ..style = PaintingStyle.stroke,
              builder: (Node node) {
                var value = node.key?.value as IndividualModel;

                return ItemElementWidget(data: value);
              },
            ),
          ),
        );
      },
    );
  }
}
