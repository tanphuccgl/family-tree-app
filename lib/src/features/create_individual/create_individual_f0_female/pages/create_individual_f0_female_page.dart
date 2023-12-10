import 'package:familytree/src/features/create_individual/create_individual_f0_female/logic/create_individual_f0_female_bloc.dart';
import 'package:familytree/src/features/create_individual/create_individual_f0_female/widgets/area_f0_female_widget.dart';
import 'package:familytree/src/features/create_individual/create_individual_f0_female/widgets/button/button_add_field_inforamtion_F0_female.dart';
import 'package:familytree/src/features/create_individual/create_individual_f0_female/widgets/button/button_create_individual_f0_female.dart';
import 'package:familytree/src/features/create_individual/create_individual_f0_female/widgets/family_code_f0_female_widget.dart';
import 'package:familytree/src/features/create_individual/create_individual_f0_female/widgets/female_F0_sex_widget.dart';
import 'package:familytree/src/features/create_individual/create_individual_f0_female/widgets/name_f0_female_widget.dart';
import 'package:familytree/src/features/create_individual/create_individual_f0_female/widgets/origin_f0_female_widget.dart';
import 'package:familytree/src/features/create_individual/create_individual_f0_female/widgets/type_f0_female_widget.dart';
import 'package:familytree/src/features/create_individual/widgets/divider_widget.dart';
import 'package:familytree/src/network/model/area_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateIndividualF0FemalePage extends StatelessWidget {
  final AreaModel area;
  const CreateIndividualF0FemalePage({
    super.key,
    required this.area,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateIndividualF0FemaleBloc(context, area: area),
      child: BlocBuilder<CreateIndividualF0FemaleBloc,
          CreateIndividualF0FemaleState>(
        builder: (context, state) {
          if (state.area == null) {
            return Text("Không tìm thấy khu vực");
          }

          return Scaffold(
              floatingActionButton: ButtonAddFieldInforamtionF0Female(),
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
                  ButtonCreateIndividualF0Female(),
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
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width / 3,
      child: Column(
        children: [],
      ),
    );
  }
}
