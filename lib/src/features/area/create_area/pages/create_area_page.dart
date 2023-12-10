import 'package:familytree/src/features/area/create_area/logic/create_area_bloc.dart';

import 'package:familytree/src/features/create_individual/widgets/text_rich.dart';
import 'package:familytree/widgets/button/button.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAreaPage extends StatelessWidget {
  const CreateAreaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateAreaBloc(context),
      child: BlocBuilder<CreateAreaBloc, CreateAreaState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Column(
                children: [
                  XTextRich(text: "Tên Khu vực"),
                  SizedBox(height: 20),
                  XInput(
                      value: state.name,
                      onChanged: (value) =>
                          context.read<CreateAreaBloc>().onChangedName(value)),
                  XTextRich(text: "Mã khu vực"),
                  SizedBox(height: 20),
                  XInput(
                      value: state.nameId,
                      errorText:
                          state.isNameIdExist == true ? "Đã tồn tại" : "",
                      onChanged: (value) => context
                          .read<CreateAreaBloc>()
                          .onChangedNameId(value)),
                  SizedBox(height: 20),
                  XButton(
                      onPressed: () =>
                          context.read<CreateAreaBloc>().createNewProduct(),
                      text: "Xác nhận"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
