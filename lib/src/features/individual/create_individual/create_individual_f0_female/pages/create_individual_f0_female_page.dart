import 'package:familytree/src/features/individual/create_individual/create_individual_f0_female/logic/create_individual_f0_female_bloc.dart';
import 'package:familytree/src/features/individual/create_individual/create_individual_f0_female/widgets/age_f0_female_widget.dart';
import 'package:familytree/src/features/individual/create_individual/create_individual_f0_female/widgets/color_f0_female_widget.dart';
import 'package:familytree/src/features/individual/create_individual/create_individual_f0_female/widgets/date_f0_female_widget.dart';
import 'package:familytree/src/features/individual/create_individual/create_individual_f0_female/widgets/field_info_f0_female_widget.dart';
import 'package:familytree/src/features/individual/create_individual/create_individual_f0_female/widgets/food_f0_female_widget.dart';
import 'package:familytree/src/features/individual/create_individual/create_individual_f0_female/widgets/image_f0_female_widget.dart';
import 'package:familytree/src/features/individual/create_individual/create_individual_f0_female/widgets/price_f0_female_widget.dart';
import 'package:familytree/src/features/individual/create_individual/create_individual_f0_female/widgets/review_f0_female_widget.dart';
import 'package:familytree/src/features/individual/create_individual/create_individual_f0_female/widgets/style_f0_female_widget.dart';
import 'package:familytree/src/features/individual/create_individual/create_individual_f0_female/widgets/video_f0_female_widget.dart';
import 'package:familytree/src/features/individual/create_individual/create_individual_f0_female/widgets/weight_f0_female_widget.dart';
import 'package:familytree/src/network/model/area_model.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/area_f0_female_widget.dart';
import '../widgets/button_create_individual_f0_female.dart';
import '../widgets/family_code_f0_female_widget.dart';
import '../widgets/sex_f0_female_widget.dart';
import '../widgets/name_f0_female_widget.dart';
import '../widgets/origin_f0_female_widget.dart';
import '../widgets/type_f0_female_widget.dart';

class CreateIndividualF0FemalePage extends StatelessWidget {
  final AreaModel area;
  const CreateIndividualF0FemalePage({
    super.key,
    required this.area,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => CreateIndividualF0FemaleBloc(context, area: area),
      child: BlocBuilder<CreateIndividualF0FemaleBloc,
          CreateIndividualF0FemaleState>(
        builder: (context, state) {
          if (state.area == null) {
            return Text("Không tìm thấy khu vực");
          }

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
                      child: ButtonCreateIndividualF0Female()),
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
          NameF0FemaleWidget(),
          AreaF0FemaleWidget(),
          SexF0FemaleWidget(),
          TypeF0FemaleWidget(),
          FamilyCodeF0FemaleWidget(),
          OriginF0FemaleWidget(),
          PriceF0FemaleWidget(),
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
          AgeF0FemaleWidget(),
          ColorF0FemaleWidget(),
          DateF0FemaleWidget(),
          FoodF0FemaleWidget(),
          StyleF0FemaleWidget(),
          WeightF0FemaleWidget(),
          ReviewF0FemaleWidget(),
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
          FieldInfoF0FemaleWidget(),
          ImageF0FemaleWidget(),
          VideoF0FemaleWidget(),
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
          NameF0FemaleWidget(),
          AreaF0FemaleWidget(),
          SexF0FemaleWidget(),
          TypeF0FemaleWidget(),
          FamilyCodeF0FemaleWidget(),
          OriginF0FemaleWidget(),
          PriceF0FemaleWidget(),
          ImageF0FemaleWidget(),
          VideoF0FemaleWidget(),
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
          AgeF0FemaleWidget(),
          ColorF0FemaleWidget(),
          DateF0FemaleWidget(),
          FoodF0FemaleWidget(),
          StyleF0FemaleWidget(),
          WeightF0FemaleWidget(),
          ReviewF0FemaleWidget(),
          FieldInfoF0FemaleWidget(),
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
