import 'package:familytree/src/features/individual/create_individual/create_individual_default/pages/create_individual_default_page.dart';
import 'package:familytree/src/features/individual/create_individual/create_individual_f0_female/pages/create_individual_f0_female_page.dart';
import 'package:familytree/src/features/individual/create_individual/create_individual_f0_root/pages/create_individual_f0_root_page.dart';
import 'package:familytree/src/features/individual/list_individual/create_individual/logic/create_individual_bloc.dart';
import 'package:familytree/src/features/individual/list_individual/create_individual/widgets/box_select_area.dart';
import 'package:familytree/src/features/individual/list_individual/create_individual/widgets/box_select_type.dart';
import 'package:familytree/src/features/individual/list_individual/create_individual/widgets/button_next_to_create_individual.dart';
import 'package:familytree/src/features/individual/list_individual/create_individual/widgets/button_next_to_select_type.dart';
import 'package:familytree/src/network/model/product_model.dart';

import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabViewCreateIndividual extends StatelessWidget {
  const TabViewCreateIndividual({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateIndividualBloc(context),
      child: BlocBuilder<CreateIndividualBloc, CreateIndividualState>(
        builder: (context, state) {
          if (state.isShowSelectArea && !state.isShowSelectType) {
            return Column(
              children: [
                BoxSelectArea(),
                GapHelper.h12,
                if (state.currnentArea != null) ButtonNextToSelectType(),
              ],
            );
          }

          if (state.isShowSelectType && !state.isShowSelectArea) {
            return Column(
              children: [
                BoxSelectType(),
                GapHelper.h12,
                if (state.type != null) ButtonNextToCreateIndividual(),
              ],
            );
          }

          if (!state.isShowSelectArea &&
              !state.isShowSelectType &&
              state.currnentArea != null &&
              state.type != null) {
            if (state.listIndividualWithArea.isEmpty) {
              return CreateIndividualF0RootPage(area: state.currnentArea!);
            }

            if (state.type == ProductTypeEnum.f0) {
              return CreateIndividualF0FemalePage(area: state.currnentArea!);
            }

            return CreateIndividualDefaultPage(
              area: state.currnentArea!,
              type: state.type!,
            );
            // if()
            // {

            // }
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Text("Lỗi dữ liệu", style: style()),
          );
        },
      ),
    );
  }

  TextStyle style() {
    return TextStyle(
        color: XColors.primary5,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        overflow: TextOverflow.ellipsis);
  }
}
