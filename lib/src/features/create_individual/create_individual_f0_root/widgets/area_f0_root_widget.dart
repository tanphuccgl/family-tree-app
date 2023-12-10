import 'package:familytree/src/features/create_individual/create_individual_f0_root/logic/create_individual_f0_root_bloc.dart';
import 'package:familytree/src/features/create_individual/widgets/text_rich.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaF0RootWidget extends StatelessWidget {
  const AreaF0RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateIndividualF0RootBloc, CreateIndividualF0RootState>(
      builder: (context, state) {
        return Column(
          children: [
            XTextRich(text: "Khu vực"),
            GapHelper.h20,
            XInput(
              value: state.area!.name + " ( ${state.area!.nameId} )",
              readOnly: true,
            ),
          ],
        );
      },
    );
  }
}
