import 'package:familytree/src/features/table_female/table_female/logic/table_female_state.dart';
import 'package:familytree/src/features/table_female/table_female/widgets/button_back_table_female.dart';
import 'package:familytree/src/features/table_female/table_female/widgets/item_table_female.dart';
import 'package:familytree/src/features/table_female/table_female/widgets/tabbar_field_table_female.dart';

import 'package:familytree/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyTableFemale extends StatelessWidget {
  const BodyTableFemale({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableFemaleBloc, TableFemaleState>(
      builder: (context, state) {
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ButtonBackTableFemale(),
                      Spacer(),
                    ],
                  ),
                ),
                divider(),
                TabbarFieldTableFemale(),
                divider(),
                if (state.list.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Text("Chưa có dữ liệu", style: style()),
                  )
                else
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller:
                        context.read<TableFemaleBloc>().scrollController1,
                    child: SizedBox(
                      width: 2220,
                      child: ListView.builder(
                        itemCount: state.list.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final item = state.list[index];
                          return ItemTableFemale(
                              data: item,
                              index: index,
                              isLastItem: index == state.list.length - 1);
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
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
