import 'package:familytree/src/features/individual/list_individual/detail_individual/logic/detail_individual_bloc.dart';
import 'package:familytree/src/features/individual/list_individual/detail_individual/widgets/button/button_cancel_edit_individual.dart';
import 'package:familytree/src/features/individual/list_individual/detail_individual/widgets/button/button_confirm_edit_individual.dart';
import 'package:familytree/src/features/individual/list_individual/detail_individual/widgets/button/button_edit_individual.dart';
import 'package:familytree/src/features/individual/list_individual/detail_individual/widgets/button/button_remove_individual.dart';
import 'package:familytree/src/features/individual/list_individual/list_individual/logic/individual_bloc.dart';

import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailIndividual extends StatelessWidget {
  final String individualId;
  const DetailIndividual({super.key, required this.individualId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailIndividualBloc(context, individualId),
      child: BlocBuilder<DetailIndividualBloc, DetailIndividualState>(
        builder: (context, state) {
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
                          state.isEdit ? "Chỉnh sửa" : "Chi tiết cá thể",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 25),
                        ),
                        Spacer(),
                        if (!state.isEdit) ButtonEditIndividual(),
                        GapHelper.w4,
                        ButtonRemoveIndividual(),
                        GapHelper.w4,
                        IconButton(
                            iconSize: 30,
                            onPressed: () =>
                                context.read<IndividualBloc>().onCloseButton(),
                            icon: Icon(
                              Icons.clear,
                              color: XColors.primary6,
                              size: 30,
                            )),
                      ],
                    ),
                  ),
                  divider(),
                  GapHelper.h12,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 30),
                    child: Column(
                      children: [
                        if (size.width <= 1500 && size.width > 800)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              sessionOneWidget1(),
                              GapHelper.w20,
                              sessionTwoWidget1(),
                            ],
                          )
                        else if (size.width < 800)
                          Column(
                            children: [
                              sessionOneWidget(),
                              sessionTwoWidget(),
                              sessionThreeWidget(),
                            ],
                          )
                        else
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              sessionOneWidget(),
                              GapHelper.w20,
                              sessionTwoWidget(),
                              GapHelper.w20,
                              sessionThreeWidget(),
                            ],
                          ),
                      ],
                    ),
                  ),
                  if (state.isEdit)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ButtonCancelEditIndividual(),
                        GapHelper.w8,
                        ButtonConfirmEditIndividual()
                      ],
                    ),
                  GapHelper.h24,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget sessionOneWidget() {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NameDefaultWidget(),
          AreaDefaultWidget(),
          SexDefaultWidget(),
          TypeDefaultWidget(),
          FamilyCodeDefaultWidget(),
          OriginDefaultWidget(),
          PriceDefaultWidget(),
        ],
      ),
    );
  }

  Widget sessionTwoWidget() {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AgeDefaultWidget(),
          ColorDefaultWidget(),
          DateDefaultWidget(),
          FoodDefaultWidget(),
          StyleDefaultWidget(),
          WeightDefaultWidget(),
          ReviewDefaultWidget(),
        ],
      ),
    );
  }

  Widget sessionThreeWidget() {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ParentDefaultWidget(),
          FieldInfoDefaultWidget(),
          ImageDefaultWidget(),
          VideoDefaultWidget(),
        ],
      ),
    );
  }

  Widget sessionOneWidget1() {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NameDefaultWidget(),
          AreaDefaultWidget(),
          SexDefaultWidget(),
          TypeDefaultWidget(),
          FamilyCodeDefaultWidget(),
          OriginDefaultWidget(),
          PriceDefaultWidget(),
          ImageDefaultWidget(),
          VideoDefaultWidget(),
        ],
      ),
    );
  }

  Widget sessionTwoWidget1() {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AgeDefaultWidget(),
          ColorDefaultWidget(),
          DateDefaultWidget(),
          FoodDefaultWidget(),
          StyleDefaultWidget(),
          WeightDefaultWidget(),
          ReviewDefaultWidget(),
          ParentDefaultWidget(),
          FieldInfoDefaultWidget(),
        ],
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
