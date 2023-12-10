import 'package:familytree/src/features/area/detail_area/logic/detail_area_bloc.dart';
import 'package:familytree/src/features/create_individual/widgets/text_rich.dart';

import 'package:familytree/widgets/button/button.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailAreaPage extends StatelessWidget {
  final String id;
  const DetailAreaPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailAreaBloc(context, id),
      child: BlocBuilder<DetailAreaBloc, DetailAreaState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Column(
                children: [
                  XTextRich(text: "Tên khu vực"),
                  SizedBox(height: 20),
                  XInput(
                      value: state.name,
                      readOnly: !state.isEdit,
                      onChanged: (value) =>
                          context.read<DetailAreaBloc>().onChangedName(value)),
                  XTextRich(text: "Mã khu vực"),
                  SizedBox(height: 20),
                  XInput(
                      value: state.nameId,
                      readOnly: !state.isEdit,
                      errorText:
                          state.isNameIdExist == true ? "Đã tồn tại" : "",
                      onChanged: (value) => context
                          .read<DetailAreaBloc>()
                          .onChangedNameId(value)),
                  SizedBox(height: 20),
                  if (state.isEdit)
                    XButton(
                        onPressed: () =>
                            context.read<DetailAreaBloc>().createNewProduct(),
                        text: "Xác nhận")
                  else ...[
                    XButton(
                        onPressed: () =>
                            context.read<DetailAreaBloc>().onChangeEdit(),
                        text: "Chỉnh sửa"),
                    SizedBox(height: 20),
                    XButton(
                        onPressed: () =>
                            context.read<DetailAreaBloc>().deleteArea(context),
                        text: "Xóa ")
                  ]
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
