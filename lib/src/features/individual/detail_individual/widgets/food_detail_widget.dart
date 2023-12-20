import 'package:familytree/src/features/individual/detail_individual/logic/detail_individual_bloc.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodDetailWidget extends StatelessWidget {
  const FoodDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailIndividualBloc, DetailIndividualState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Thức ăn",
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
                  readOnly: !state.isEdit,
                  fillColor: state.isEdit ? null : XColors.primary7,
                  value: state.food,
                  onChanged: (value) => context
                      .read<DetailIndividualBloc>()
                      .onChangedFood(value)),
            ),
          ],
        );
      },
    );
  }
}
