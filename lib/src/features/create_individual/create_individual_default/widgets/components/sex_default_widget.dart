import 'package:familytree/src/features/create_individual/create_individual_default/logic/create_individual_default_bloc.dart';

import 'package:familytree/src/features/create_individual/widgets/text_rich.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SexDefaultWidget extends StatelessWidget {
  const SexDefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateIndividualDefaultBloc,
        CreateIndividualDefaultState>(
      builder: (context, state) {
        return Column(
          children: [
            XTextRich(text: "Giới tính"),
            GapHelper.h20,
            XInput(
              value: state.isMale == true ? "Đực" : "Cái",
              readOnly: true,
              onTap: () => context
                  .read<CreateIndividualDefaultBloc>()
                  .onChangedSex(!state.isMale),
            ),
          ],
        );
      },
    );
  }
}
