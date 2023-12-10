import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/text_rich.dart';
import '../logic/create_individual_f0_root_bloc.dart';

class OriginF0RootWidget extends StatelessWidget {
  const OriginF0RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateIndividualF0RootBloc, CreateIndividualF0RootState>(
      builder: (context, state) {
        return Column(
          children: [
            XTextRich(text: "xuất xứ"),
            GapHelper.h20,
            XInput(
              value: state.origin,
              onChanged: (value) => context
                  .read<CreateIndividualF0RootBloc>()
                  .onChangedOrigin(value),
            ),
          ],
        );
      },
    );
  }
}