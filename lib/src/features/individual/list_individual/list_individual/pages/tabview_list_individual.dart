import 'package:familytree/src/features/individual/list_individual/list_individual/logic/individual_bloc.dart';
import 'package:familytree/src/features/individual/list_individual/list_individual/widgets/button_delete_individual.dart';
import 'package:familytree/src/features/individual/list_individual/list_individual/widgets/button_refresh_individual.dart';
import 'package:familytree/src/features/individual/list_individual/list_individual/widgets/item_individual.dart';
import 'package:familytree/src/features/individual/list_individual/list_individual/widgets/tabbar_field_individual.dart';

import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabViewListIndividual extends StatelessWidget {
  const TabViewListIndividual({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<IndividualBloc, IndividualState>(
      builder: (context, state) {
        final hasSelected = state.listIndividualSelected.isNotEmpty;
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
                    color: hasSelected ? XColors.primary7 : XColors.primary9,
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
                                    .read<IndividualBloc>()
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
                            ButtonDeleteIndividual(),
                          ]
                        : [
                            Container(
                              width: size.width * 0.5,
                              height: 50,
                              child: Center(
                                child: XInput(
                                    hintText: "Tìm kiếm với family code",
                                    onChanged: (value) => context
                                        .read<IndividualBloc>()
                                        .onChangedSearchText(value),
                                    value: state.searchText,
                                    showArrowIcon: true,
                                    onSearchButton: () => context
                                        .read<IndividualBloc>()
                                        .onSearchButton()),
                              ),
                            ),
                            Spacer(),
                            ButtonRefreshIndividual()
                          ],
                  ),
                ),
                divider(),
                TabbarFieldIndividual(),
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
                        context.read<IndividualBloc>().scrollController1,
                    child: SizedBox(
                      width: 2220,
                      child: ListView.builder(
                        itemCount: state.list.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final item = state.list[index];
                          return ItemIndividual(
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
