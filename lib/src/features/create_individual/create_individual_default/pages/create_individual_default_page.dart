import 'package:familytree/src/features/create_individual/create_individual_default/logic/create_individual_default_bloc.dart';
import 'package:familytree/src/features/create_individual/create_individual_default/widgets/button/button_add_field_inforamtion_default.dart';
import 'package:familytree/src/features/create_individual/create_individual_default/widgets/button/button_create_individual_default.dart';
import 'package:familytree/src/features/create_individual/create_individual_default/widgets/components/area_default_widget.dart';
import 'package:familytree/src/features/create_individual/create_individual_default/widgets/components/family_code_default_widget.dart';
import 'package:familytree/src/features/create_individual/create_individual_default/widgets/components/name_default_widget.dart';
import 'package:familytree/src/features/create_individual/create_individual_default/widgets/components/origin_default_widget.dart';
import 'package:familytree/src/features/create_individual/create_individual_default/widgets/components/parent_default_widget.dart';
import 'package:familytree/src/features/create_individual/create_individual_default/widgets/components/sex_default_widget.dart';
import 'package:familytree/src/features/create_individual/create_individual_default/widgets/components/type_default_widget.dart';
import 'package:familytree/src/features/create_individual/widgets/divider_widget.dart';
import 'package:familytree/src/network/model/area_model.dart';
import 'package:familytree/src/network/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

          return Scaffold(
              floatingActionButton: ButtonAddFieldInforamtionDefault(),
              body: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                shrinkWrap: true,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    leftWidget(),
                    DividerWidget(),
                    rightWidget(context),
                  ]),
                  const SizedBox(height: 50),
                  ButtonCreateIndividualDefault(),
                  const SizedBox(height: 30),
                ],
              ));
        },
      ),
    );
  }

  Widget leftWidget() {
    return BlocBuilder<CreateIndividualDefaultBloc,
        CreateIndividualDefaultState>(
      builder: (context, state) {
        final size = MediaQuery.of(context).size;

        return SizedBox(
          width: size.width / 3,
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
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width / 3,
      child: Column(
        children: [],
      ),
    );
  }
}
