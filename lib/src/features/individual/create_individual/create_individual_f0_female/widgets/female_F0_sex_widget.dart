import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/create_individual_f0_female_bloc.dart';

class FemaleF0SexWidget extends StatelessWidget {
  const FemaleF0SexWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateIndividualF0FemaleBloc,
        CreateIndividualF0FemaleState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Giới tính",
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
                value: "Cái",
                readOnly: true,
                fillColor: XColors.primary7,
              ),
            ),
          ],
        );
      },
    );
  }
}
