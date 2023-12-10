import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/text_rich.dart';
import '../../logic/create_individual_default_bloc.dart';

class AreaDefaultWidget extends StatelessWidget {
  const AreaDefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateIndividualDefaultBloc,
        CreateIndividualDefaultState>(
      builder: (context, state) {
        return Column(
          children: [
            XTextRich(text: "xuất xứ"),
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
