import 'package:familytree/src/features/individual/list_individual/detail_individual/logic/detail_individual_bloc.dart';

import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OriginDetailWidget extends StatelessWidget {
  const OriginDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailIndividualBloc, DetailIndividualState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Xuất xứ",
              style: TextStyle(
                  color: XColors.primary5,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
            GapHelper.h12,
            SizedBox(
                width: 300,
                height: 80,
                child: XInput(
                  value: state.origin?.name ?? "N/A",
                  readOnly: true,
                  fillColor: XColors.primary7,
                )),
          ],
        );
      },
    );
  }
}
