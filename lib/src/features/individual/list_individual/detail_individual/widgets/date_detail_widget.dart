import 'package:familytree/src/features/individual/list_individual/detail_individual/logic/detail_individual_bloc.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateDetailWidget extends StatelessWidget {
  const DateDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailIndividualBloc, DetailIndividualState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ngày",
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
                readOnly: true,
                fillColor: state.isEdit ? null : XColors.primary7,
                onTap: state.isEdit
                    ? () => context.read<DetailIndividualBloc>().onChangedDate()
                    : () {},
                value: state.date,
              ),
            ),
          ],
        );
      },
    );
  }
}
