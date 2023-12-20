import 'package:familytree/src/features/origin/create_origin/logic/create_origin_bloc.dart';

import 'package:familytree/src/features/origin/create_origin/widgets/button_create_origin.dart';
import 'package:familytree/src/features/origin/create_origin/widgets/name_id_origin_widget.dart';
import 'package:familytree/src/features/origin/create_origin/widgets/name_origin_widget.dart';

import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateOriginPage extends StatelessWidget {
  const CreateOriginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateOriginBloc(context),
      child: BlocBuilder<CreateOriginBloc, CreateOriginState>(
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
                          "Thêm tên và mã xuất xứ",
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
                                  NameOriginWidget(),
                                  GapHelper.h8,
                                  NameIdOriginWidget(),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  NameOriginWidget(),
                                  GapHelper.w20,
                                  NameIdOriginWidget(),
                                ],
                              ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: ButtonCreateOrigin()),
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
