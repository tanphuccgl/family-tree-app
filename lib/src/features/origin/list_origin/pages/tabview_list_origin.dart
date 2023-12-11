import 'package:familytree/src/features/origin/list_origin/logic/origin_bloc.dart';
import 'package:familytree/src/features/origin/list_origin/widgets/button_delete_origin.dart';
import 'package:familytree/src/features/origin/list_origin/widgets/button_refresh_origin.dart';
import 'package:familytree/src/features/origin/list_origin/widgets/item_origin.dart';

import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabViewListOrigin extends StatelessWidget {
  const TabViewListOrigin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OriginBloc, OriginState>(
      builder: (context, state) {
        final size = MediaQuery.of(context).size;
        final hasSelected = state.listOriginSelected.isNotEmpty;
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
                                onPressed: () =>
                                    context.read<OriginBloc>().onClearButton(),
                                icon: Icon(
                                  Icons.clear,
                                  color: XColors.primary2,
                                  size: 30,
                                )),
                            GapHelper.w8,
                            Text(
                              "${state.listOriginSelected.length} item",
                              style: TextStyle(
                                color: XColors.primary6,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            ButtonDeleteOrigin(),
                          ]
                        : [ButtonRefreshOrigin()],
                  ),
                ),
                divider(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    color: XColors.primary9,
                  ),
                  child: Row(
                    children: [
                      Center(
                        child: Checkbox(
                          onChanged: (value) =>
                              context.read<OriginBloc>().onCheckBoxAll(value!),
                          value: state.listOriginSelected.length ==
                                  state.list.length &&
                              state.list.isNotEmpty,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                            child: Text(size.width < 700 ? "Stt" : "Số thứ tự",
                                maxLines: 1, style: style())),
                      ),
                      GapHelper.w4,
                      Expanded(
                        flex: 4,
                        child: GestureDetector(
                            onTap: () =>
                                context.read<OriginBloc>().onTapTitleName(),
                            child: Text("Tên", maxLines: 1, style: style())),
                      ),
                      GapHelper.w4,
                      Expanded(
                        flex: 4,
                        child: GestureDetector(
                            onTap: () =>
                                context.read<OriginBloc>().onTapTitleNameId(),
                            child: Text("Mã", maxLines: 1, style: style())),
                      ),
                    ],
                  ),
                ),
                divider(),
                if (state.list.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Text("Chưa có dữ liệu", style: style()),
                  )
                else
                  ListView.builder(
                    itemCount: state.list.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final item = state.list[index];
                      return ItemOrigin(
                          data: item,
                          index: index,
                          isLastItem: index == state.list.length - 1);
                    },
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
