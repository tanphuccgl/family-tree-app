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
    final TransformationController _transformationController =
        TransformationController();
    final size = MediaQuery.of(context).size;

    return BlocBuilder<FamilyTreeBloc, FamilyTreeState>(
      builder: (context, state) {
        return context.read<FamilyTreeBloc>().graph.edges.isEmpty
            ? const Center(child: Text("Không có dữ liệu"))
            : SizedBox(
                width: size.width,
                child: Align(
                  alignment: Alignment.center,
                  child: FittedBox(
                    child: Center(
                      child: GraphView(
                        graph: context.read<FamilyTreeBloc>().graph,
                        algorithm: SugiyamaAlgorithm(
                          context.read<FamilyTreeBloc>().builder,
                        ),
                        paint: Paint()
                          ..color = Colors.black
                          ..strokeWidth = 1
                          ..style = PaintingStyle.stroke,
                        builder: (Node node) {
                          var value = node.key?.value as IndividualModel;

                          return ItemElementWidget(data: value);
                        },
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
