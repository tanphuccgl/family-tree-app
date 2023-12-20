import 'package:familytree/src/network/model/individual_model.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class AreaOvelayWidget extends StatelessWidget {
  final IndividualModel individual;
  const AreaOvelayWidget({super.key, required this.individual});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Xuất xứ",
          style: TextStyle(
              color: XColors.primary5,
              fontSize: 15,
              fontWeight: FontWeight.normal),
        ),
        GapHelper.h4,
        SizedBox(
          width: isMobile ? 100 : 150,
          height: isMobile ? 30 : 40,
          child: XInput(
            value: individual.area?.name ?? "N/A",
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
