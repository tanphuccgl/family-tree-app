import 'package:familytree/src/features/family_tree/logic/select_area_family_tree_bloc.dart';
import 'package:familytree/src/features/family_tree/widgets/item_area_family_tree.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoxAreaFamilyTree extends StatelessWidget {
  const BoxAreaFamilyTree({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => SelectAreaFamilyTreeBloc(context),
      child: BlocBuilder<SelectAreaFamilyTreeBloc, SelectAreaFamilyTreeState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Chọn khu vực",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 25),
                        ),
                      ],
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
                        Expanded(
                          flex: 2,
                          child: Center(
                              child: Text(
                                  size.width < 700 ? "Stt" : "Số thứ tự",
                                  maxLines: 1,
                                  style: style())),
                        ),
                        GapHelper.w4,
                        Expanded(
                          flex: 4,
                          child: GestureDetector(
                              onTap: () => context
                                  .read<SelectAreaFamilyTreeBloc>()
                                  .onTapTitleName(),
                              child: Text("Tên", maxLines: 1, style: style())),
                        ),
                        GapHelper.w4,
                        Expanded(
                          flex: 4,
                          child: GestureDetector(
                              onTap: () => context
                                  .read<SelectAreaFamilyTreeBloc>()
                                  .onTapTitleNameId(),
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
                        return ItemAreaFamilyTree(
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
      ),
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
