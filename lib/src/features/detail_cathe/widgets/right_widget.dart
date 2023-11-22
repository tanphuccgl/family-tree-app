import 'package:familytree/src/features/create_cathe/widgets/text_rich.dart';
import 'package:familytree/src/features/detail_cathe/logic/detail_cathe_bloc.dart';
import 'package:familytree/src/network/model/product_model.dart';
import 'package:familytree/widgets/button/button_2.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RightWidget extends StatelessWidget {
  const RightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const sizebox20 = SizedBox(height: 20);

    return BlocBuilder<DetailCatheBloc, DetailCatheState>(
      builder: (context, state) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Family code"),
              sizebox20,
              XInput(
                value: state.familyCode,
                readOnly: true,
                onChanged: (value) => context,
              ),
              const Text("Đánh giá :"),
              sizebox20,
              XInput(
                value: state.review,
                readOnly: !state.isEdit,
                onChanged: !state.isEdit
                    ? (value) {}
                    : (value) =>
                        context.read<DetailCatheBloc>().onChangedReview(value),
              ),
              const Text("Màu :"),
              sizebox20,
              XInput(
                value: state.color,
                readOnly: !state.isEdit,
                onChanged: !state.isEdit
                    ? (value) {}
                    : (value) =>
                        context.read<DetailCatheBloc>().onChangedColor(value),
              ),
              const Text("Loại :"),
              sizebox20,
              XInput(
                value: state.type.labelOf,
                readOnly: true,
              ),
              if (state.type == ProductTypeEnum.f0) ...[
                XTextRich(text: "Cha"),
                sizebox20,
                XInput(
                  value: state.fatherNote,
                  readOnly: true,
                ),
                XTextRich(text: "Mẹ"),
                sizebox20,
                XInput(
                  value: state.motherNote,
                  readOnly: true,
                ),
              ],
              if (state.type != ProductTypeEnum.f0 &&
                  state.type != ProductTypeEnum.f1) ...[
                const Text("Cha :"),
                sizebox20,
                XInput(
                  value: state.father,
                  readOnly: true,
                ),
                const Text("Mẹ :"),
                sizebox20,
                XInput(
                  value: state.mother,
                  readOnly: true,
                ),
              ],
              const Text("Nguồn thức ăn :"),
              sizebox20,
              XInput(
                value: state.food,
                readOnly: !state.isEdit,
                onChanged: !state.isEdit
                    ? (value) {}
                    : (value) =>
                        context.read<DetailCatheBloc>().onChangedFood(value),
              ),
              const Text("Kiểu cách :"),
              sizebox20,
              XInput(
                value: state.style,
                readOnly: !state.isEdit,
                onChanged: !state.isEdit
                    ? (value) {}
                    : (value) =>
                        context.read<DetailCatheBloc>().onChangedStyle(value),
              ),
              const Text("Ảnh :"),
              sizebox20,
              if (state.isEdit)
                XButton2(
                  icon: Icons.add_box_outlined,
                  text: "Thêm Ảnh Mới",
                  onPressed: () =>
                      context.read<DetailCatheBloc>().onAddImage(context),
                ),
              if (state.isEdit) sizebox20,
              if (state.imageNetwork != "")
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.network(
                    state.imageNetwork,
                    fit: BoxFit.contain,
                  ),
                ),
            ]);
      },
    );
  }
}
