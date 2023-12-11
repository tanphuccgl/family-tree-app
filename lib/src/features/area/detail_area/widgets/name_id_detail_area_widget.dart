import 'package:familytree/src/features/area/detail_area/logic/detail_area_bloc.dart';

import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameIdDetailAreaWidget extends StatelessWidget {
  const NameIdDetailAreaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailAreaBloc, DetailAreaState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mã",
              style: TextStyle(
                  color: XColors.primary5,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
            GapHelper.h12,
            SizedBox(
              width: 300,
              height: 80,
              child: XInput(
                  value: state.nameId,
                  readOnly: !state.isEdit,
                  errorText: state.isNameIdExist == true ? "Đã tồn tại" : "",
                  onChanged: (value) =>
                      context.read<DetailAreaBloc>().onChangedNameId(value)),
            ),
          ],
        );
      },
    );
  }
}
