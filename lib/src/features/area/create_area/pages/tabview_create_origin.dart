import 'package:familytree/src/features/area/create_area/logic/create_area_bloc.dart';
import 'package:familytree/src/features/area/create_area/widgets/button_create_area.dart';
import 'package:familytree/src/features/area/create_area/widgets/name_area_widget.dart';
import 'package:familytree/src/features/area/create_area/widgets/name_id_area_widget.dart';

import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabViewCreateArea extends StatelessWidget {
  const TabViewCreateArea({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateAreaBloc(context),
      child: BlocBuilder<CreateAreaBloc, CreateAreaState>(
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
                          "Thêm tên và mã khu vực",
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
                        size.width < 750
                            ? Column(
                                children: [
                                  NameAreaWidget(),
                                  GapHelper.h8,
                                  NameIdAreaWidget(),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  NameAreaWidget(),
                                  GapHelper.w20,
                                  NameIdAreaWidget(),
                                ],
                              ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: ButtonCreateArea()),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
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
