import 'package:familytree/src/features/origin/list_origin/logic/origin_bloc.dart';
import 'package:familytree/src/features/origin/list_origin/widgets/item_origin.dart';
import 'package:familytree/widgets/button/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OriginPage extends StatelessWidget {
  const OriginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OriginBloc(),
      child: BlocBuilder<OriginBloc, OriginState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Column(
                children: [
                  XButton(
                      onPressed: () =>
                          context.read<OriginBloc>().moveTocreateOrigin(),
                      text: "Tạo xuất xứ"),
                  SizedBox(
                    height: 30,
                  ),
                  if (state.list.isEmpty)
                    Text("Chưa có dữ liệu")
                  else
                    Expanded(
                        child: ListView.builder(
                      itemCount: state.list.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final item = state.list[index];
                        return ItemOrigin(data: item, index: index);
                      },
                    )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
