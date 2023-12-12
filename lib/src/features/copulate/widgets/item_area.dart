import 'package:familytree/src/features/copulate/logic/get_list_area_bloc.dart';
import 'package:familytree/src/network/model/area_model.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemArea extends StatelessWidget {
  final AreaModel data;
  final int index;
  final bool isLastItem;
  const ItemArea(
      {super.key,
      required this.data,
      required this.index,
      required this.isLastItem});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetListAreaBloc, GetListAreaState>(
      builder: (context, state) {
        return Column(
          children: [
            GestureDetector(
              onTap: () =>
                  context.read<GetListAreaBloc>().onShowDetailArea(data),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text((index + 1).toString(),
                            maxLines: 1, style: style()),
                      ),
                    ),
                    GapHelper.w4,
                    Expanded(
                      flex: 4,
                      child: Text(data.name, maxLines: 1, style: style()),
                    ),
                    GapHelper.w4,
                    Expanded(
                      flex: 4,
                      child: Text(data.nameId, maxLines: 1, style: style()),
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

  TextStyle style() {
    return TextStyle(
        overflow: TextOverflow.ellipsis,
        color: XColors.primary5,
        fontSize: 18,
        fontWeight: FontWeight.normal);
  }
}
