import 'package:familytree/src/features/individual/list_individual/create_individual/logic/create_individual_bloc.dart';

import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameIdIndividualWidget extends StatelessWidget {
  const NameIdIndividualWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateIndividualBloc, CreateIndividualState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mã",
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
                  value: state.nameId,
                  errorText: state.isNameIdExist == true ? "Đã tồn tại" : "",
                  onChanged: (value) => context
                      .read<CreateIndividualBloc>()
                      .onChangedNameId(value)),
            ),
          ],
        );
      },
    );
  }
}
