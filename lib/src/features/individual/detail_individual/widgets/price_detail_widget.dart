import 'package:familytree/src/features/individual/detail_individual/logic/detail_individual_bloc.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceDetailWidget extends StatelessWidget {
  const PriceDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailIndividualBloc, DetailIndividualState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Giá",
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
                  value: state.price,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  keyboardType: TextInputType.number,
                  onChanged: (value) => context
                      .read<DetailIndividualBloc>()
                      .onChangedPrice(value)),
            ),
          ],
        );
      },
    );
  }
}
