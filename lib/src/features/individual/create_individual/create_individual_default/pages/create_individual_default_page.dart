import 'package:familytree/src/features/individual/create_individual/create_individual_default/logic/create_individual_default_bloc.dart';
import 'package:familytree/src/network/model/area_model.dart';
import 'package:familytree/src/network/model/product_model.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/button/button_create_individual_default.dart';
import '../widgets/components/area_default_widget.dart';
import '../widgets/components/family_code_default_widget.dart';
import '../widgets/components/name_default_widget.dart';
import '../widgets/components/origin_default_widget.dart';
import '../widgets/components/parent_default_widget.dart';
import '../widgets/components/sex_default_widget.dart';
import '../widgets/components/type_default_widget.dart';

class CreateIndividualDefaultPage extends StatelessWidget {
  final AreaModel area;
  final ProductTypeEnum type;
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
          //TODO
          // if (state.area == null || state.type == null) {
          //   return Text("Lỗi hệ thống");
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
                        if (size.width <= 1500 && size.width > 800)
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

  Widget leftWidget() {
    return BlocBuilder<CreateIndividualDefaultBloc,
        CreateIndividualDefaultState>(
      builder: (context, state) {
        return SizedBox(
          width: 300,
          child: Column(
            children: [
              NameDefaultWidget(),
              AreaDefaultWidget(),
              SexDefaultWidget(),
              TypeDefaultWidget(),
              FamilyCodeDefaultWidget(),
              ParentDefaultWidget(),
              if (!state.isMale) OriginDefaultWidget()
            ],
          ),
        );
      },
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
