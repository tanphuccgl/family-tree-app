import 'package:familytree/src/network/model/origin_model.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/create_individual_default_bloc.dart';

class OriginDefaultWidget extends StatelessWidget {
  const OriginDefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateIndividualDefaultBloc,
        CreateIndividualDefaultState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Xuất xứ",
              style: TextStyle(
                  color: XColors.primary5,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
            GapHelper.h12,
            state.listOriginSuggest.isEmpty
                ? SizedBox(
                    width: 300,
                    height: 80,
                    child: XInput(value: "N/A", readOnly: true))
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
        width: 300,
        height: 50,
        margin: EdgeInsets.only(bottom: 30),
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
              child: Text(
                data.name,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            );
          }).toList(),
        ),
      );
    });
  }
}
