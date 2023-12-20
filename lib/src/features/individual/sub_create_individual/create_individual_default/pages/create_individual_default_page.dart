import 'package:familytree/src/network/model/area_model.dart';
import 'package:familytree/src/network/model/individual_model.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/create_individual_default_bloc.dart';
import '../widgets/age_default_widget.dart';
import '../widgets/area_default_widget.dart';
import '../widgets/button_create_individual_default.dart';
import '../widgets/color_default_widget.dart';
import '../widgets/date_default_widget.dart';
import '../widgets/family_code_default_widget.dart';
import '../widgets/field_info_default_widget.dart';
import '../widgets/food_default_widget.dart';
import '../widgets/image_default_widget.dart';
import '../widgets/name_default_widget.dart';
import '../widgets/origin_default_widget.dart';
import '../widgets/parent_default_widget.dart';
import '../widgets/price_default_widget.dart';
import '../widgets/review_default_widget.dart';
import '../widgets/sex_default_widget.dart';
import '../widgets/style_default_widget.dart';
import '../widgets/type_default_widget.dart';
import '../widgets/video_default_widget.dart';
import '../widgets/weight_default_widget.dart';

class CreateIndividualDefaultPage extends StatelessWidget {
  final AreaModel area;
  final GenerationEnum type;
  const CreateIndividualDefaultPage({
    super.key,
    required this.area,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => CreateIndividualDefaultBloc(
        context,
        area: area,
        type: type,
      ),
      child: BlocBuilder<CreateIndividualDefaultBloc,
          CreateIndividualDefaultState>(
        builder: (context, state) {
          if (state.area == null || state.type == null) {
            return Text("Lỗi hệ thống");
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
                      child: ButtonCreateIndividualDefault()),
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

  Widget divider() {
    return Divider(
      color: XColors.primary5,
      thickness: 0.5,
      height: 0,
    );
  }
}
