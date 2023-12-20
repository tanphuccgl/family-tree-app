import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/create_individual_default_bloc.dart';

class FamilyCodeDefaultWidget extends StatelessWidget {
  const FamilyCodeDefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateIndividualDefaultBloc,
        CreateIndividualDefaultState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Family code",
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
                value: state.familyCode,
                errorText: state.isFamilyCodeExist == true ? "Đã tồn tại" : "",
                onChanged: (value) => context
                    .read<CreateIndividualDefaultBloc>()
                    .onChangedFamilyCode(value),
              ),
            ),
          ],
        );
      },
    );
  }
}
