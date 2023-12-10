import 'package:familytree/src/features/individual/create_individual/create_individual_default/logic/create_individual_default_bloc.dart';
import 'package:familytree/src/features/individual/create_individual/widgets/text_rich.dart';
import 'package:familytree/src/network/model/origin_model.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OriginDefaultWidget extends StatelessWidget {
  const OriginDefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateIndividualDefaultBloc,
        CreateIndividualDefaultState>(
      builder: (context, state) {
        return Column(
          children: [
            XTextRich(text: "xuất xứ"),
            GapHelper.h20,
            state.listOriginSuggest.isEmpty
                ? XInput(value: "N/A", readOnly: true)
                : dropdownListOriginSuggest(),
          ],
        );
      },
    );
  }

  Widget dropdownListOriginSuggest() {
    return BlocBuilder<CreateIndividualDefaultBloc,
        CreateIndividualDefaultState>(builder: (context, state) {
      return Container(
        width: 200,
        height: 50,
        padding: const EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
            color: XColors.primary2, borderRadius: BorderRadius.circular(10)),
        child: DropdownButton<OriginModel>(
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 22,
          underline: const SizedBox(),
          value: state.origin,
          onChanged: (OriginModel? value) {
            context.read<CreateIndividualDefaultBloc>().onChangedOrigin(value!);
          },
          items: state.listOriginSuggest.map((OriginModel data) {
            return DropdownMenuItem<OriginModel>(
              value: data,
              child: Tooltip(message: 'Đây là tooltip', child: Text(data.name)),
            );
          }).toList(),
        ),
      );
    });
  }
}
