import 'package:familytree/src/features/individual/create_individual/widgets/text_rich.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/create_individual_default_bloc.dart';

class TypeDefaultWidget extends StatelessWidget {
  const TypeDefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateIndividualDefaultBloc,
        CreateIndividualDefaultState>(
      builder: (context, state) {
        return Column(
          children: [
            XTextRich(
              text: "Loại",
            ),
            GapHelper.h20,
            XInput(
              value: state.type?.labelOf ?? "N/A",
              readOnly: true,
            ),
          ],
        );
      },
    );
  }
}
