import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';

import '../../../../network/model/individual_model.dart';

class SexOverlayWidget extends StatelessWidget {
  final IndividualModel individual;
  const SexOverlayWidget({super.key, required this.individual});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Giới tính",
          style: TextStyle(
              color: XColors.primary5,
              fontSize: 15,
              fontWeight: FontWeight.normal),
        ),
        GapHelper.h4,
        SizedBox(
          width: 150,
          height: 40,
          child: XInput(
            value: individual.isMale == true ? "Đực" : "Cái",
            readOnly: true,
            fillColor: XColors.primary7,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontSize: 13, color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
