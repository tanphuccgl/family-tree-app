import 'package:familytree/src/features/family_tree/logic/family_tree_bloc.dart';
import 'package:familytree/src/features/family_tree/widgets/box_area_family_tree.dart';
import 'package:familytree/src/features/family_tree/widgets/button_next_to_family_tree.dart';
import 'package:familytree/src/features/family_tree/widgets/tree_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';

class TreeViewPage extends StatelessWidget {
  const TreeViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FamilyTreeBloc(),
      child: BlocBuilder<FamilyTreeBloc, FamilyTreeState>(
          builder: (context, state) {
        return Scaffold(
          backgroundColor: XColors.primary8,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: ListView(
              shrinkWrap: true,
              children: [
                Text(
                  "Family tree",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                SizedBox(height: 40),
                if (state.isShowSelectArea)
                  Column(
                    children: [
                      BoxAreaFamilyTree(),
                      GapHelper.h12,
                      if (state.currnentArea != null) ButtonNextToFamilyTree(),
                    ],
                  )
                else if (state.currnentArea != null &&
                    state.isShowSelectArea == false)
                  TreeWidget()
                else
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Text("Lỗi dữ liệu", style: style()),
                  )
              ],
            ),
          ),
        );
      }),
    );
  }

  TextStyle style() {
    return TextStyle(
        color: XColors.primary5,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        overflow: TextOverflow.ellipsis);
  }
}
