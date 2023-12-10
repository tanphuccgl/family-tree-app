import 'package:familytree/src/features/individual/create_individual/create_individual_default/logic/create_individual_default_bloc.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/text_rich.dart';

class NameDefaultWidget extends StatelessWidget {
  const NameDefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateIndividualDefaultBloc,
        CreateIndividualDefaultState>(
      builder: (context, state) {
        return Column(
          children: [
            XTextRich(text: "Tên"),
            GapHelper.h20,
            XInput(
                value: state.name,
                onChanged: (value) => context
                    .read<CreateIndividualDefaultBloc>()
                    .onChangedName(value)),
          ],
        );
      },
    );
  }
}
