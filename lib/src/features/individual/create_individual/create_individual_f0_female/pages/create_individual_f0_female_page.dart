import 'package:familytree/src/features/individual/create_individual/create_individual_f0_female/logic/create_individual_f0_female_bloc.dart';
import 'package:familytree/src/network/model/area_model.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/area_f0_female_widget.dart';
import '../widgets/button/button_create_individual_f0_female.dart';
import '../widgets/family_code_f0_female_widget.dart';
import '../widgets/female_F0_sex_widget.dart';
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
          //TODO
          // if (state.area == null) {
          //   return Text("Không tìm thấy khu vực");
          // }

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
                        if (size.width <= 1600 && size.width > 800)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              leftWidget(),
                              GapHelper.w20,
                              leftWidget(),
                            ],
                          )
                        else if (size.width < 800)
                          Column(
                            children: [
                              leftWidget(),
                              leftWidget(),
                              leftWidget(),
                            ],
                          )
                        else
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              leftWidget(),
                              GapHelper.w20,
                              leftWidget(),
                              GapHelper.w20,
                              leftWidget(),
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

  Widget leftWidget() {
    return SizedBox(
      width: 300,
      child: Column(
        children: [
          NameF0FemaleWidget(),
          AreaF0FemaleWidget(),
          FemaleF0SexWidget(),
          TypeF0FemaleWidget(),
          FamilyCodeF0FemaleWidget(),
          OriginF0FemaleWidget()
        ],
      ),
    );
  }

  Widget rightWidget(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        children: [],
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
