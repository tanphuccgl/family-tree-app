import 'package:familytree/src/features/family_tree/logic/family_tree_bloc.dart';
import 'package:familytree/src/features/family_tree/widgets/item_element_widget.dart';
import 'package:familytree/src/network/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphview/GraphView.dart';

class TreeViewPage extends StatelessWidget {
  const TreeViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FamilyTreeBloc(),
      child: BlocBuilder<FamilyTreeBloc, FamilyTreeState>(
        builder: (context, state) {
          return Scaffold(
              body: context.read<FamilyTreeBloc>().graph.edges.isEmpty
                  ? const Center(child: Text("Không có dữ liệu"))
                  : InteractiveViewer(
                      constrained: false,
                      panEnabled: false,
                      scaleEnabled: false,
                      minScale: 1,
                      alignment: Alignment.center,
                      maxScale: 1,
                      child: GraphView(
                        graph: context.read<FamilyTreeBloc>().graph,
                        algorithm: BuchheimWalkerAlgorithm(
                            context.read<FamilyTreeBloc>().builder,
                            TreeEdgeRenderer(
                                context.read<FamilyTreeBloc>().builder)),
                        paint: Paint()
                          ..color = Colors.black
                          ..strokeWidth = 1
                          ..style = PaintingStyle.stroke,
                        builder: (Node node) {
                          // I can decide what widget should be shown here based on the id
                          var value = node.key?.value as ProductModel;
                          return ItemElementWidget(data: value);
                        },
                      )));
        },
      ),
    );
  }
}
