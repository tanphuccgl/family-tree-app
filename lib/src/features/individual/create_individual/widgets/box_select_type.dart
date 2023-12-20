import 'package:familytree/src/features/individual/create_individual/logic/create_individual_bloc.dart';
import 'package:familytree/src/network/model/individual_model.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoxSelectType extends StatelessWidget {
  const BoxSelectType({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<CreateIndividualBloc, CreateIndividualState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Chọn Thế hệ",
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
                if (size.width < 900) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      item(GenerationEnum.f0),
                      item(GenerationEnum.f1),
                    ],
                  ),
                  GapHelper.h12,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      item(GenerationEnum.f2),
                      item(GenerationEnum.f3),
                    ],
                  ),
                ] else ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      item(GenerationEnum.f0),
                      item(GenerationEnum.f1),
                      item(GenerationEnum.f2),
                      item(GenerationEnum.f3),
                    ],
                  ),
                ],
                GapHelper.h24,
              ],
            ),
          ),
        );
      },
    );
  }

  Widget item(GenerationEnum type) {
    return BlocBuilder<CreateIndividualBloc, CreateIndividualState>(
      builder: (context, state) {
        final size = MediaQuery.of(context).size;
        return GestureDetector(
          onTap: () =>
              context.read<CreateIndividualBloc>().onChangeCurrentType(type),
          child: Column(
            children: [
              Checkbox(
                onChanged: (value) => context
                    .read<CreateIndividualBloc>()
                    .onChangeCurrentType(type),
                value: state.type == type,
              ),
              GapHelper.h12,
              Container(
                width: size.width < 1100 ? 150 : size.width * 0.1,
                height: size.width < 1100 ? 150 : 200,
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: state.type == type
                        ? XColors.primary7
                        : XColors.primary3,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 3,
                        offset: Offset(0, 2),
                        spreadRadius: 1,
                      )
                    ]),
                child: Center(
                  child: Text(
                    "Thế hệ ${type.labelOf}",
                    style: TextStyle(
                        color: state.type == type
                            ? Colors.white
                            : XColors.primary5,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
