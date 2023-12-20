import 'package:familytree/src/network/model/individual_model.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/create_individual_default_bloc.dart';

class ParentDefaultWidget extends StatelessWidget {
  const ParentDefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateIndividualDefaultBloc,
        CreateIndividualDefaultState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Cha mẹ",
              style: TextStyle(
                  color: XColors.primary5,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
            GapHelper.h12,
            state.listFatherSuggest.isEmpty
                ? SizedBox(
                    width: 300,
                    height: 80,
                    child: XInput(value: "N/A", readOnly: true))
                : Column(
                    children: [
                      dropdownListFatherSuggest(),
                      dropdownListMotherSuggest(),
                    ],
                  )
          ],
        );
      },
    );
  }

  Widget dropdownListFatherSuggest() {
    return BlocBuilder<CreateIndividualDefaultBloc,
        CreateIndividualDefaultState>(builder: (context, state) {
      return Container(
        width: 300,
        height: 50,
        margin: EdgeInsets.only(bottom: 30),
        padding: const EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
            color: XColors.primary2, borderRadius: BorderRadius.circular(10)),
        child: DropdownButton<IndividualModel>(
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 22,
          underline: const SizedBox(),
          value: state.fatherSelected,
          onChanged: (IndividualModel? value) {
            context.read<CreateIndividualDefaultBloc>().onChangedFather(value!);
          },
          items: state.listFatherSuggest.map((IndividualModel data) {
            return DropdownMenuItem<IndividualModel>(
              value: data,
              child: Tooltip(
                  message: 'Đây là tooltip',
                  child: Text(
                    data.name,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  )),
            );
          }).toList(),
        ),
      );
    });
  }

  Widget dropdownListMotherSuggest() {
    return BlocBuilder<CreateIndividualDefaultBloc,
        CreateIndividualDefaultState>(builder: (context, state) {
      return state.listMotherSuggest.isEmpty
          ? SizedBox()
          : Container(
              width: 300,
              height: 50,
              margin: EdgeInsets.only(bottom: 30),
              padding: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                  color: XColors.primary2,
                  borderRadius: BorderRadius.circular(10)),
              child: DropdownButton<IndividualModel>(
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 22,
                underline: const SizedBox(),
                value: state.motherSelected,
                onChanged: (IndividualModel? value) {
                  context
                      .read<CreateIndividualDefaultBloc>()
                      .onChangedMother(value!);
                },
                items: state.listMotherSuggest.map((IndividualModel data) {
                  return DropdownMenuItem<IndividualModel>(
                    value: data,
                    child: Tooltip(
                        message: 'Đây là tooltip',
                        child: Text(
                          data.name,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                        )),
                  );
                }).toList(),
              ),
            );
    });
  }
}
