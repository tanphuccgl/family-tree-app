import 'package:familytree/src/features/individual/create_individual/widgets/text_rich.dart';
import 'package:familytree/src/features/origin/detail_origin/logic/detail_origin_bloc.dart';

import 'package:familytree/widgets/button/button.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailOriginPage extends StatelessWidget {
  final String id;
  const DetailOriginPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailOriginBloc(context, id),
      child: BlocBuilder<DetailOriginBloc, DetailOriginState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Column(
                children: [
                  XTextRich(text: "Tên xuất xứ"),
                  SizedBox(height: 20),
                  XInput(
                      value: state.name,
                      readOnly: !state.isEdit,
                      onChanged: (value) => context
                          .read<DetailOriginBloc>()
                          .onChangedName(value)),
                  XTextRich(text: "Mã xuất xứ"),
                  SizedBox(height: 20),
                  XInput(
                      value: state.nameId,
                      readOnly: !state.isEdit,
                      errorText:
                          state.isNameIdExist == true ? "Đã tồn tại" : "",
                      onChanged: (value) => context
                          .read<DetailOriginBloc>()
                          .onChangedNameId(value)),
                  SizedBox(height: 20),
                  if (state.isEdit)
                    XButton(
                        onPressed: () =>
                            context.read<DetailOriginBloc>().createNewProduct(),
                        text: "Xác nhận")
                  else ...[
                    XButton(
                        onPressed: () =>
                            context.read<DetailOriginBloc>().onChangeEdit(),
                        text: "Chỉnh sửa"),
                    SizedBox(height: 20),
                    XButton(
                        onPressed: () => context
                            .read<DetailOriginBloc>()
                            .deleteOrigin(context),
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
