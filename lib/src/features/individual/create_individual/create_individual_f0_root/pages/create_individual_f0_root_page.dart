import 'package:familytree/src/features/individual/create_individual/create_individual_f0_root/widgets/age_f0_root_widget.dart';
import 'package:familytree/src/features/individual/create_individual/create_individual_f0_root/widgets/color_f0_root_widget.dart';
import 'package:familytree/src/features/individual/create_individual/create_individual_f0_root/widgets/date_f0_root_widget.dart';
import 'package:familytree/src/features/individual/create_individual/create_individual_f0_root/widgets/field_info_f0_root_widget.dart';
import 'package:familytree/src/features/individual/create_individual/create_individual_f0_root/widgets/food_f0_root_widget.dart';
import 'package:familytree/src/features/individual/create_individual/create_individual_f0_root/widgets/image_f0_root_widget.dart';
import 'package:familytree/src/features/individual/create_individual/create_individual_f0_root/widgets/price_f0_root_widget.dart';
import 'package:familytree/src/features/individual/create_individual/create_individual_f0_root/widgets/review_f0_root_widget.dart';
import 'package:familytree/src/features/individual/create_individual/create_individual_f0_root/widgets/style_f0_root_widget.dart';
import 'package:familytree/src/features/individual/create_individual/create_individual_f0_root/widgets/video_f0_root_widget.dart';
import 'package:familytree/src/features/individual/create_individual/create_individual_f0_root/widgets/weight_f0_root_widget.dart';
import 'package:familytree/src/network/model/area_model.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/create_individual_f0_root_bloc.dart';
import '../widgets/area_f0_root_widget.dart';
import '../widgets/button_create_individual_f0_root.dart';
import '../widgets/family_code_f0_root_widget.dart';
import '../widgets/name_f0_root_widget.dart';
import '../widgets/origin_f0_root_widget.dart';
import '../widgets/sex_f0_root_widget.dart';
import '../widgets/type_f0_root_widget.dart';

class CreateIndividualF0RootPage extends StatelessWidget {
  final AreaModel area;
  const CreateIndividualF0RootPage({
    super.key,
    required this.area,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => CreateIndividualF0RootBloc(context, area: area),
      child:
          BlocBuilder<CreateIndividualF0RootBloc, CreateIndividualF0RootState>(
        builder: (context, state) {
          //TODO
          // if (state.area == null) {
          //   return Text("Không tìm thấy khu vực");
          // }
          print(size.width);
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
                  Align(
                      alignment: Alignment.centerRight,
                      child: ButtonCreateIndividualF0Root()),
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
          NameF0RootWidget(),
          AreaF0RootWidget(),
          SexF0RootWidget(),
          TypeF0RootWidget(),
          FamilyCodeF0RootWidget(),
          OriginF0RootWidget(),
          PriceF0RootWidget(),
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
          AgeF0RootWidget(),
          ColorF0RootWidget(),
          DateF0RootWidget(),
          FoodF0RootWidget(),
          StyleF0RootWidget(),
          WeightF0RootWidget(),
          ReviewF0RootWidget(),
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
          FieldInfoF0RootWidget(),
          ImageF0RootWidget(),
          VideoF0RootWidget(),
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
          NameF0RootWidget(),
          AreaF0RootWidget(),
          SexF0RootWidget(),
          TypeF0RootWidget(),
          FamilyCodeF0RootWidget(),
          OriginF0RootWidget(),
          PriceF0RootWidget(),
          ImageF0RootWidget(),
          VideoF0RootWidget(),
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
          AgeF0RootWidget(),
          ColorF0RootWidget(),
          DateF0RootWidget(),
          FoodF0RootWidget(),
          StyleF0RootWidget(),
          WeightF0RootWidget(),
          ReviewF0RootWidget(),
          FieldInfoF0RootWidget(),
        ],
      ),
    );
  }

  Widget divider() {
    return Divider(
      color: XColors.primary5,
      thickness: 0.5,
      height: 0,
    );
  }
}
