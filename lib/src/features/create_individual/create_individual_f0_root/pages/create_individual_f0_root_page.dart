import 'package:familytree/src/features/create_individual/create_individual_f0_root/logic/create_individual_f0_root_bloc.dart';
import 'package:familytree/src/features/create_individual/create_individual_f0_root/widgets/area_f0_root_widget.dart';
import 'package:familytree/src/features/create_individual/create_individual_f0_root/widgets/button_add_field_inforamtion_f0_root.dart';
import 'package:familytree/src/features/create_individual/create_individual_f0_root/widgets/family_code_f0_root_widget.dart';
import 'package:familytree/src/features/create_individual/create_individual_f0_root/widgets/origin_f0_root_widget.dart';
import 'package:familytree/src/features/create_individual/create_individual_f0_root/widgets/sex_f0_root_widget.dart';
import 'package:familytree/src/features/create_individual/create_individual_f0_root/widgets/name_f0_root_widget.dart';
import 'package:familytree/src/features/create_individual/create_individual_f0_root/widgets/type_f0_root_widget.dart';
import 'package:familytree/src/features/create_individual/widgets/divider_widget.dart';
import 'package:familytree/src/network/model/area_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/button_create_individual_f0_root.dart';

class CreateIndividualF0RootPage extends StatelessWidget {
  final AreaModel area;
  const CreateIndividualF0RootPage({
    super.key,
    required this.area,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateIndividualF0RootBloc(context, area: area),
      child:
          BlocBuilder<CreateIndividualF0RootBloc, CreateIndividualF0RootState>(
        builder: (context, state) {
          if (state.area == null) {
            return Text("Không tìm thấy khu vực");
          }

          return Scaffold(
              floatingActionButton: ButtonAddFieldInforamtionF0Root(),
              body: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                shrinkWrap: true,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    leftWidget(context),
                    DividerWidget(),
                    rightWidget(context),
                  ]),
                  const SizedBox(height: 50),
                  ButtonCreateIndividualF0Root(),
                  const SizedBox(height: 30),
                ],
              ));
        },
      ),
    );
  }

  Widget leftWidget(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width / 3,
      child: Column(
        children: [
          NameF0RootWidget(),
          AreaF0RootWidget(),
          SexF0RootWidget(),
          TypeF0RootWidget(),
          FamilyCodeF0RootWidget(),
          OriginF0RootWidget(),
        ],
      ),
    );
  }

  Widget rightWidget(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width / 3,
      child: Column(
        children: [],
      ),
    );
  }
}
