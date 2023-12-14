import 'package:familytree/src/features/individual/list_individual/list_individual/logic/individual_bloc.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabbarFieldIndividual extends StatelessWidget {
  const TabbarFieldIndividual({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<IndividualBloc, IndividualState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: 50,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            color: XColors.primary9,
          ),
          child: ListView(
            controller: context.read<IndividualBloc>().scrollController2,
            scrollDirection: Axis.horizontal,
            //   physics: NeverScrollableScrollPhysics(),
            children: [
              Center(
                child: Checkbox(
                  onChanged: (value) =>
                      context.read<IndividualBloc>().onCheckBoxAll(value!),
                  value: state.listIndividualSelected.length ==
                          state.list.length &&
                      state.list.isNotEmpty,
                ),
              ),
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
                    onTap: () =>
                        context.read<IndividualBloc>().onTapTitleName(),
                    child: Center(
                        child: Text("Tên", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 150,
                child: GestureDetector(
                    onTap: () =>
                        context.read<IndividualBloc>().onTapTitleNameId(),
                    child: Center(
                        child:
                            Text("Family code", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 100,
                child: GestureDetector(
                    onTap: () =>
                        context.read<IndividualBloc>().onTapTitleNameId(),
                    child: Center(
                        child: Text("Thế hệ", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 100,
                child: GestureDetector(
                    onTap: () =>
                        context.read<IndividualBloc>().onTapTitleNameId(),
                    child: Center(
                        child: Text("Giới tính", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 150,
                child: GestureDetector(
                    onTap: () =>
                        context.read<IndividualBloc>().onTapTitleNameId(),
                    child: Center(
                        child: Text("Xuất xứ", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 150,
                child: GestureDetector(
                    onTap: () =>
                        context.read<IndividualBloc>().onTapTitleNameId(),
                    child: Center(
                        child: Text("Khu vực", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 150,
                child: GestureDetector(
                    onTap: () =>
                        context.read<IndividualBloc>().onTapTitleNameId(),
                    child: Center(
                        child: Text("Cha", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 150,
                child: GestureDetector(
                    onTap: () =>
                        context.read<IndividualBloc>().onTapTitleNameId(),
                    child:
                        Center(child: Text("Mẹ", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 100,
                child: GestureDetector(
                    onTap: () =>
                        context.read<IndividualBloc>().onTapTitleNameId(),
                    child: Center(
                        child: Text("Ngày", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 100,
                child: GestureDetector(
                    onTap: () =>
                        context.read<IndividualBloc>().onTapTitleNameId(),
                    child: Center(
                        child: Text("Tuổi", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 100,
                child: GestureDetector(
                    onTap: () =>
                        context.read<IndividualBloc>().onTapTitleNameId(),
                    child: Center(
                        child: Text("Màu", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 100,
                child: GestureDetector(
                    onTap: () =>
                        context.read<IndividualBloc>().onTapTitleNameId(),
                    child: Center(
                        child: Text("Thức ăn", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 100,
                child: GestureDetector(
                    onTap: () =>
                        context.read<IndividualBloc>().onTapTitleNameId(),
                    child: Center(
                        child: Text("Giá", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 100,
                child: GestureDetector(
                    onTap: () =>
                        context.read<IndividualBloc>().onTapTitleNameId(),
                    child: Center(
                        child: Text("Đánh giá", maxLines: 1, style: style()))),
              ),
              GapHelper.w4,
              SizedBox(
                width: 100,
                child: GestureDetector(
                    onTap: () =>
                        context.read<IndividualBloc>().onTapTitleNameId(),
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
