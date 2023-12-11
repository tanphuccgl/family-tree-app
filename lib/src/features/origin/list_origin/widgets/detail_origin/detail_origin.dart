import 'package:familytree/src/features/origin/detail_origin/logic/detail_origin_bloc.dart';
import 'package:familytree/src/features/origin/list_origin/logic/origin_bloc.dart';
import 'package:familytree/src/features/origin/list_origin/widgets/detail_origin/components/button_cancel_edit_origin.dart';
import 'package:familytree/src/features/origin/list_origin/widgets/detail_origin/components/button_edit_origin.dart';
import 'package:familytree/src/features/origin/list_origin/widgets/detail_origin/components/button_confirm_edit_origin.dart';
import 'package:familytree/src/features/origin/list_origin/widgets/detail_origin/components/button_remove_origin.dart';
import 'package:familytree/src/features/origin/list_origin/widgets/detail_origin/components/name_detail_origin_widget.dart';
import 'package:familytree/src/features/origin/list_origin/widgets/detail_origin/components/name_id_detail_origin_widget.dart';

import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailOrigin extends StatelessWidget {
  final String originId;
  const DetailOrigin({super.key, required this.originId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailOriginBloc(context, originId),
      child: BlocBuilder<DetailOriginBloc, DetailOriginState>(
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
                          state.isEdit ? "Chỉnh sửa" : "Chi tiết xuất xứ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 25),
                        ),
                        Spacer(),
                        if (!state.isEdit) ButtonEditOrigin(),
                        GapHelper.w4,
                        ButtonRemoveOrigin(),
                        GapHelper.w4,
                        IconButton(
                            iconSize: 30,
                            onPressed: () =>
                                context.read<OriginBloc>().onCloseButton(),
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
                                  NameDetailOriginWidget(),
                                  GapHelper.h8,
                                  NameIdDetailOriginWidget(),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  NameDetailOriginWidget(),
                                  GapHelper.w20,
                                  NameIdDetailOriginWidget(),
                                ],
                              ),
                        if (state.isEdit)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ButtonCancelEditOrigin(),
                              GapHelper.w8,
                              ButtonConfirmEditOrigin()
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
