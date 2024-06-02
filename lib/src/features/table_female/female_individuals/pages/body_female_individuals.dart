import 'package:familytree/src/features/table_female/female_individuals/logic/female_individuals_bloc.dart';
import 'package:familytree/src/features/table_female/female_individuals/widgets/button_refresh_individual.dart';
import 'package:familytree/src/features/table_female/female_individuals/widgets/item_female_individual.dart';
import 'package:familytree/src/features/table_female/female_individuals/widgets/tabbar_field_female_individual.dart';

import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyFemaleIndividuals extends StatelessWidget {
  const BodyFemaleIndividuals({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<FemaleIndividualsBloc, FemaleIndividualsState>(
      builder: (context, state) {
        final hasSelected = state.listIndividualSelected.isNotEmpty;
        return SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffeaf4ff),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: hasSelected ? Color(0xffeaf4ff) : Color(0xffeaf4ff),
                  ),
                  child: Row(
                    mainAxisAlignment: hasSelected
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    children: hasSelected
                        ? [
                            IconButton(
                                iconSize: 30,
                                onPressed: () => context
                                    .read<FemaleIndividualsBloc>()
                                    .onClearButton(),
                                icon: Icon(
                                  Icons.clear,
                                  color: XColors.primary2,
                                  size: 30,
                                )),
                            GapHelper.w8,
                            Text(
                              "${state.listIndividualSelected.length} item",
                              style: TextStyle(
                                color: XColors.primary6,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                          ]
                        : [
                            Container(
                              width: size.width * 0.5,
                              height: 50,
                              child: Center(
                                child: XInput(
                                    fillColor: Color(0xfff8f9fa),
                                    hintText: "Tìm kiếm với tên",
                                    onChanged: (value) => context
                                        .read<FemaleIndividualsBloc>()
                                        .onChangedSearchText(value),
                                    value: state.searchText,
                                    showArrowIcon: true,
                                    onSearchButton: () => context
                                        .read<FemaleIndividualsBloc>()
                                        .onSearchButton()),
                              ),
                            ),
                            Spacer(),
                            ButtonRefreshFemaleIndividuals()
                          ],
                  ),
                ),
                divider(),
                TabbarFieldFemaleIndividual(),
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
                        context.read<FemaleIndividualsBloc>().scrollController1,
                    child: SizedBox(
                      width: 2220,
                      child: ListView.builder(
                        itemCount: state.list.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final item = state.list[index];
                          return ItemFemaleIndividual(
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
