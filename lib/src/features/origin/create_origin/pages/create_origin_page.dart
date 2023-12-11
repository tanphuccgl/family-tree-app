import 'package:familytree/src/features/individual/create_individual/widgets/text_rich.dart';
import 'package:familytree/src/features/origin/create_origin/logic/create_origin_bloc.dart';
import 'package:familytree/widgets/button/button.dart';
import 'package:familytree/widgets/froms/input.dart';
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
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              children: [
                XTextRich(text: "Tên xuất xứ"),
                SizedBox(height: 20),
                XInput(
                    value: state.name,
                    onChanged: (value) =>
                        context.read<CreateOriginBloc>().onChangedName(value)),
                XTextRich(text: "Mã xuất xứ"),
                SizedBox(height: 20),
                XInput(
                    value: state.nameId,
                    errorText: state.isNameIdExist == true ? "Đã tồn tại" : "",
                    onChanged: (value) => context
                        .read<CreateOriginBloc>()
                        .onChangedNameId(value)),
                SizedBox(height: 20),
                XButton(
                    onPressed: () =>
                        context.read<CreateOriginBloc>().createNewProduct(),
                    text: "Xác nhận"),
              ],
            ),
          );
        },
      ),
    );
  }
}
