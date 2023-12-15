import 'package:familytree/src/features/family_tree/logic/select_area_family_tree_bloc.dart';

import 'package:familytree/src/network/model/area_model.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemAreaFamilyTree extends StatelessWidget {
  final AreaModel data;
  final int index;
  final bool isLastItem;
  const ItemAreaFamilyTree(
      {super.key,
      required this.data,
      required this.index,
      required this.isLastItem});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectAreaFamilyTreeBloc, SelectAreaFamilyTreeState>(
      builder: (context, state) {
        final isSelected = state.selectedArea?.id == data.id;
        return Column(
          children: [
            GestureDetector(
              onTap: () =>
                  context.read<SelectAreaFamilyTreeBloc>().onSelectArea(data),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: isSelected ? BorderRadius.circular(3) : null,
                  color: isSelected ? XColors.primary7 : null,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text((index + 1).toString(),
                            maxLines: 1, style: style(isSelected)),
                      ),
                    ),
                    GapHelper.w4,
                    Expanded(
                      flex: 4,
                      child: Text(data.name,
                          maxLines: 1, style: style(isSelected)),
                    ),
                    GapHelper.w4,
                    Expanded(
                      flex: 4,
                      child: Text(data.nameId,
                          maxLines: 1, style: style(isSelected)),
                    ),
                  ],
                ),
              ),
            ),
            if (!isLastItem) divider(),
          ],
        );
      },
    );
  }

  Widget divider() {
    return Divider(
      color: XColors.primary5,
      thickness: 0.05,
      height: 0,
    );
  }

  TextStyle style(bool isSelected) {
    return TextStyle(
        overflow: TextOverflow.ellipsis,
        color: isSelected ? Colors.white : XColors.primary5,
        fontSize: 18,
        fontWeight: FontWeight.normal);
  }
}
