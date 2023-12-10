import 'package:familytree/src/features/area/list_area/logic/area_bloc.dart';
import 'package:familytree/src/features/area/list_area/widgets/item_area.dart';
import 'package:familytree/widgets/button/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaPage extends StatelessWidget {
  const AreaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AreaBloc(),
      child: BlocBuilder<AreaBloc, AreaState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Column(
                children: [
                  XButton(
                      onPressed: () =>
                          context.read<AreaBloc>().moveTocreateArea(),
                      text: "Tạo khu vực"),
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
                        return ItemArea(data: item, index: index);
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
