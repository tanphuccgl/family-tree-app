import 'package:familytree/src/features/individual/list_individual/detail_individual/logic/detail_individual_bloc.dart';
import 'package:familytree/src/features/individual/list_individual/detail_individual/widgets/button_cancel_edit_individual.dart';
import 'package:familytree/src/features/individual/list_individual/detail_individual/widgets/button_confirm_edit_individual.dart';
import 'package:familytree/src/features/individual/list_individual/detail_individual/widgets/button_edit_individual.dart';
import 'package:familytree/src/features/individual/list_individual/detail_individual/widgets/button_remove_individual.dart';
import 'package:familytree/src/features/individual/list_individual/detail_individual/widgets/name_detail_individual_widget.dart';
import 'package:familytree/src/features/individual/list_individual/detail_individual/widgets/name_id_detail_individual_widget.dart';
import 'package:familytree/src/features/individual/list_individual/list_individual/logic/individual_bloc.dart';

import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailIndividual extends StatelessWidget {
  final String individualId;
  const DetailIndividual({super.key, required this.individualId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailIndividualBloc(context, individualId),
      child: BlocBuilder<DetailIndividualBloc, DetailIndividualState>(
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
                          state.isEdit ? "Chỉnh sửa" : "Chi tiết cá thể",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 25),
                        ),
                        Spacer(),
                        if (!state.isEdit) ButtonEditIndividual(),
                        GapHelper.w4,
                        ButtonRemoveIndividual(),
                        GapHelper.w4,
                        IconButton(
                            iconSize: 30,
                            onPressed: () =>
                                context.read<IndividualBloc>().onCloseButton(),
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
                                  NameDetailIndividualWidget(),
                                  GapHelper.h8,
                                  NameIdDetailIndividualWidget(),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  NameDetailIndividualWidget(),
                                  GapHelper.w20,
                                  NameIdDetailIndividualWidget(),
                                ],
                              ),
                        if (state.isEdit)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ButtonCancelEditIndividual(),
                              GapHelper.w8,
                              ButtonConfirmEditIndividual()
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
