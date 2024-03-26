import 'package:familytree/src/features/table_female/table_female/logic/table_female_state.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabbarFieldTableFemale extends StatelessWidget {
  const TabbarFieldTableFemale({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<TableFemaleBloc, TableFemaleState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: 50,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            color: XColors.primary9,
          ),
          child: ListView(
            controller: context.read<TableFemaleBloc>().scrollController2,
            scrollDirection: Axis.horizontal,
            children: [
              GapHelper.w4,
              SizedBox(
                width: 100,
                child: Center(
                    child: Text(size.width < 700 ? "Stt" : "Số thứ tự",
                        maxLines: 1, style: style())),
              ),
              GapHelper.w4,
              SizedBox(
                width: 150,
                child: GestureDetector(
                    // onTap: () =>
                    //     context.read<TableFemaleBloc>().onTapTitleName(),
                    child: Center(
                        child: Text("Tên", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 150,
                child: GestureDetector(
                    // onTap: () =>
                    //     context.read<TableFemaleBloc>().onTapTitleId(),
                    child: Center(
                        child:
                            Text("Family code", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 100,
                child: GestureDetector(
                    // onTap: () =>
                    //     context.read<TableFemaleBloc>().onTapTitleType(),
                    child: Center(
                        child: Text("Thế hệ", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 100,
                child: GestureDetector(
                    // onTap: () =>
                    //     context.read<TableFemaleBloc>().onTapTitleSex(),
                    child: Center(
                        child: Text("Giới tính", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 150,
                child: GestureDetector(
                    // onTap: () => context
                    //     .read<TableFemaleBloc>()
                    //     .onTapTitleOrigin(),
                    child: Center(
                        child: Text("Xuất xứ", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 150,
                child: GestureDetector(
                    // onTap: () =>
                    //     context.read<TableFemaleBloc>().onTapTitleArea(),
                    child: Center(
                        child: Text("Khu vực", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 150,
                child: GestureDetector(
                    // onTap: () => context
                    //     .read<TableFemaleBloc>()
                    //     .onTapTitleFatherId(),
                    child: Center(
                        child: Text("ID Cha", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 150,
                child: GestureDetector(
                    // onTap: () => context
                    //     .read<TableFemaleBloc>()
                    //     .onTapTitleMotherId(),
                    child: Center(
                        child: Text("ID Mẹ", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 100,
                child: GestureDetector(
                    // onTap: () =>
                    //     context.read<TableFemaleBloc>().onTapTitleDate(),
                    child: Center(
                        child: Text("Ngày", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 100,
                child: GestureDetector(
                    // onTap: () =>
                    //     context.read<TableFemaleBloc>().onTapTitleAge(),
                    child: Center(
                        child: Text("Tuổi", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 100,
                child: GestureDetector(
                    // onTap: () =>
                    //     context.read<TableFemaleBloc>().onTapTitleColor(),
                    child: Center(
                        child: Text("Màu", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 100,
                child: GestureDetector(
                    // onTap: () =>
                    //     context.read<TableFemaleBloc>().onTapTitleFood(),
                    child: Center(
                        child: Text("Thức ăn", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 100,
                child: GestureDetector(
                    // onTap: () =>
                    //     context.read<TableFemaleBloc>().onTapTitlePrice(),
                    child: Center(
                        child: Text("Giá", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 100,
                child: GestureDetector(
                    // onTap: () => context
                    //     .read<TableFemaleBloc>()
                    //     .onTapTitleReview(),
                    child: Center(
                        child: Text("Đánh giá", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 100,
                child: GestureDetector(
                    // onTap: () => context
                    //     .read<TableFemaleBloc>()
                    //     .onTapTitleWeight(),
                    child: Center(
                        child: Text("Cân nặng", maxLines: 1, style: style()))),
              ),
            ],
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
}
