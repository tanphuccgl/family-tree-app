import 'package:familytree/src/features/area/detail_area/logic/detail_area_bloc.dart';
import 'package:familytree/src/features/area/detail_area/widgets/button_cancel_edit_area.dart';
import 'package:familytree/src/features/area/detail_area/widgets/button_confirm_edit_area.dart';
import 'package:familytree/src/features/area/detail_area/widgets/button_edit_area.dart';
import 'package:familytree/src/features/area/detail_area/widgets/button_remove_area.dart';
import 'package:familytree/src/features/area/detail_area/widgets/name_detail_area_widget.dart';
import 'package:familytree/src/features/area/detail_area/widgets/name_id_detail_area_widget.dart';
import 'package:familytree/src/features/area/list_area/logic/area_bloc.dart';

import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailArea extends StatelessWidget {
  final String areaId;
  const DetailArea({super.key, required this.areaId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailAreaBloc(context, areaId),
      child: BlocBuilder<DetailAreaBloc, DetailAreaState>(
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
                          state.isEdit ? "Chỉnh sửa" : "Chi tiết khu vực",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 25),
                        ),
                        Spacer(),
                        if (!state.isEdit) ButtonEditArea(),
                        GapHelper.w4,
                        ButtonRemoveArea(),
                        GapHelper.w4,
                        IconButton(
                            iconSize: 30,
                            onPressed: () =>
                                context.read<AreaBloc>().onCloseButton(),
                            icon: Icon(
                              Icons.clear,
                              color: XColors.primary6,
                              size: 30,
                            )),
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
                                  NameDetailAreaWidget(),
                                  GapHelper.h8,
                                  NameIdDetailAreaWidget(),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  NameDetailAreaWidget(),
                                  GapHelper.w20,
                                  NameIdDetailAreaWidget(),
                                ],
                              ),
                        if (state.isEdit)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ButtonCancelEditArea(),
                              GapHelper.w8,
                              ButtonConfirmEditArea()
                            ],
                          )
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
