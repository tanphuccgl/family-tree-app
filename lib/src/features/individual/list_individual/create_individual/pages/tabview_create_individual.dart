import 'package:familytree/src/features/individual/list_individual/create_individual/logic/create_individual_bloc.dart';
import 'package:familytree/src/features/individual/list_individual/create_individual/widgets/box_select_area.dart';
import 'package:familytree/src/features/individual/list_individual/create_individual/widgets/box_select_type.dart';
import 'package:familytree/src/features/individual/list_individual/create_individual/widgets/button_create_individual.dart';
import 'package:familytree/src/features/individual/list_individual/create_individual/widgets/button_next_to_create_individual.dart';
import 'package:familytree/src/features/individual/list_individual/create_individual/widgets/button_next_to_select_type.dart';
import 'package:familytree/src/features/individual/list_individual/create_individual/widgets/name_id_individual_widget.dart';
import 'package:familytree/src/features/individual/list_individual/create_individual/widgets/name_individual_widget.dart';

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
            return bodyCreateIndivider(context);
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Text("Lỗi dữ liệu", style: style()),
          );
        },
      ),
    );
  }

  Widget bodyCreateIndivider(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: XColors.primary10,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: XColors.primary9,
              ),
              child: Row(
                children: [
                  Text(
                    "Thêm mới cá thể",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 25),
                  ),
                ],
              ),
            ),
            divider(),
            GapHelper.h12,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Column(
                children: [
                  size.width < 750
                      ? Column(
                          children: [
                            NameIndividualWidget(),
                            GapHelper.h8,
                            NameIdIndividualWidget(),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            NameIndividualWidget(),
                            GapHelper.w20,
                            NameIdIndividualWidget(),
                          ],
                        ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: ButtonCreateIndividual()),
                ],
              ),
            )
          ],
        ),
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

  Widget divider() {
    return Divider(
      color: XColors.primary5,
      thickness: 0.5,
      height: 0,
    );
  }
}
