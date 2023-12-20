import 'package:familytree/src/features/copulate/logic/copulate_bloc.dart';
import 'package:familytree/src/features/copulate/widgets/button_confirm_copulate.dart';
import 'package:familytree/src/features/copulate/widgets/button_refresh_copulate.dart';
import 'package:familytree/src/features/copulate/widgets/individual_item_widget.dart';

import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabViewCopulateWithGeneration extends StatelessWidget {
  const TabViewCopulateWithGeneration({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CopulateBloc, CopulateState>(
      builder: (context, state) {
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
                        "Chọn cá thể",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 25),
                      ),
                      Spacer(),
                      ButtonRefreshCopulate(),
                    ],
                  ),
                ),
                divider(),
                GapHelper.h4,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  child: Column(
                    children: [
                      individualList(),
                      GapHelper.h16,
                      if (state.femaleSelected != null &&
                          state.maleSelected != null)
                        Align(
                            alignment: Alignment.centerRight,
                            child: ButtonConfirmCopulate()),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget individualList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        maleList(),
        GapHelper.h4,
        femaleList(),
      ],
    );
  }

  Widget femaleList() {
    return BlocBuilder<CopulateBloc, CopulateState>(
      builder: (context, state) {
        final list = state.listFemaleIndividual;
        final size = MediaQuery.of(context).size;

        final isResize = size.width > 1120 && size.width < 1300;
        return Container(
          width: isResize ? size.width / 4 : size.width / 3,
          height: 400,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 3,
                offset: Offset(0, 2),
                spreadRadius: 1,
              )
            ],
            borderRadius: BorderRadius.circular(10),
            color: XColors.primary9,
          ),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          child: Column(
            children: [
              Text(
                "Cá thể cái",
                style: TextStyle(
                    color: XColors.primary6,
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
              ),
              GapHelper.h12,
              divider(),
              state.listFemaleIndividual.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Text("Chưa có dữ liệu", style: style()),
                    )
                  : Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () => context
                                  .read<CopulateBloc>()
                                  .onSelectFemaleIndividual(list[index]),
                              child: IndividualItemWidget(
                                data: list[index],
                                isLastItem: index == list.length - 1,
                              ));
                        },
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }

  Widget maleList() {
    return BlocBuilder<CopulateBloc, CopulateState>(
      builder: (context, state) {
        final list = state.listMaleIndividual;
        final size = MediaQuery.of(context).size;
        final isResize = size.width > 1120 && size.width < 1300;
        return Container(
          width: isResize ? size.width / 4 : size.width / 3,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: XColors.primary9,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 3,
                offset: Offset(0, 2),
                spreadRadius: 1,
              )
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          child: Column(
            children: [
              Text(
                "Cá thể đực",
                style: TextStyle(
                    color: XColors.primary6,
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
              ),
              GapHelper.h12,
              divider(),
              state.listMaleIndividual.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Text("Chưa có dữ liệu", style: style()),
                    )
                  : Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () => context
                                  .read<CopulateBloc>()
                                  .onSelectMaleIndividual(list[index]),
                              child: IndividualItemWidget(
                                data: list[index],
                                isLastItem: index == list.length - 1,
                              ));
                        },
                      ),
                    ),
            ],
          ),
        );
      },
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
