import 'package:familytree/src/features/family_tree/logic/family_tree_bloc.dart';
import 'package:familytree/src/features/family_tree/widgets/item_element_widget.dart';
import 'package:familytree/src/network/model/individual_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphview/GraphView.dart';

class TreeViewPage extends StatelessWidget {
  const TreeViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TransformationController _transformationController =
        TransformationController();
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => FamilyTreeBloc(),
      child: BlocBuilder<FamilyTreeBloc, FamilyTreeState>(
        builder: (context, state) {
          return Scaffold(
              floatingActionButton: Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _transformationController.value *=
                              Matrix4.diagonal3Values(
                            1.5, // Tăng kích thước 1.5 lần
                            1.5,
                            1,
                          );
                        },
                        child: Text('Tăng Zoom'),
                      ),
                      SizedBox(width: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          _transformationController.value *=
                              Matrix4.diagonal3Values(
                            0.75, // Giảm kích thước 0.75 lần
                            0.75,
                            1,
                          );
                        },
                        child: Text('Giảm Zoom'),
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(width: 20.0),
                  FloatingActionButton(
                    heroTag: "btn2",
                    onPressed: () =>
                        context.read<FamilyTreeBloc>().moveToCreateIndividual(),
                    child: const Icon(Icons.add),
                  ),
                ],
              ), //
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Khu vực: ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(height: 20),
                    SizedBox(
                      width: size.width,
                      child: Wrap(
                          children: state.listArea
                              .map((e) => GestureDetector(
                                    onTap: () => context
                                        .read<FamilyTreeBloc>()
                                        .onChangeAreaIdSelected(e.id),
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      padding: EdgeInsets.all(16.0),
                                      decoration: BoxDecoration(
                                        color: state.areaIdSelected == e.id
                                            ? Colors.grey.shade300
                                            : Colors.grey.shade100,
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Text(e.name + "\n" + e.nameId),
                                    ),
                                  ))
                              .toList()),
                    ),
                    SizedBox(height: 30),
                    context.read<FamilyTreeBloc>().graph.edges.isEmpty
                        ? const Center(child: Text("Không có dữ liệu"))
                        : Expanded(
                            child: InteractiveViewer(
                                constrained: false,
                                transformationController:
                                    _transformationController,
                                alignment: Alignment.center,
                                boundaryMargin: EdgeInsets.all(5),
                                minScale: 1,
                                maxScale: 1,
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
                                    // I can decide what widget should be shown here based on the id
                                    var value =
                                        node.key?.value as IndividualModel;

                                    return ItemElementWidget(data: value);
                                  },
                                )),
                          ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
