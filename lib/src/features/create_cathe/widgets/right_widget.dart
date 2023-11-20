import 'package:familytree/src/features/create_cathe/logic/create_cathe_bloc.dart';
import 'package:familytree/src/features/create_cathe/widgets/text_rich.dart';
import 'package:familytree/src/network/model/product_model.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/widgets/button/button_2.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RightWidget extends StatelessWidget {
  const RightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const sizebox20 = SizedBox(height: 20);
    final size = MediaQuery.of(context).size;

    return BlocBuilder<CreateCatheBloc, CreateCatheState>(
      builder: (context, state) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              XTextRich(text: "Family code"),
              sizebox20,
              XInput(
                  value: state.familyCode,
                  errorText:
                      state.isFamilyCodeExist == true ? "Đã tồn tại" : "",
                  onChanged: (value) => context
                      .read<CreateCatheBloc>()
                      .onChangedFamilyCode(value)),
              XTextRich(
                text: "Loại",
              ),
              sizebox20,
              Container(
                width: 85,
                height: 50,
                padding: const EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                    color: XColors.primary2,
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButton<ProductTypeEnum>(
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 22,
                  underline: const SizedBox(),
                  value: state.type,
                  onChanged: (ProductTypeEnum? value) {
                    context.read<CreateCatheBloc>().onChangedType(value!);
                  },
                  items: ProductTypeEnum.values.map((ProductTypeEnum location) {
                    return DropdownMenuItem<ProductTypeEnum>(
                      value: location,
                      child: Text(location.labelOf),
                    );
                  }).toList(),
                ),
              ),
              if (state.type != ProductTypeEnum.f0 &&
                  state.type != ProductTypeEnum.f1) ...[
                if (state.listFather.isNotEmpty) ...[
                  sizebox20,
                  XTextRich(
                    text: "Cha",
                  ),
                  sizebox20,
                  Container(
                    width: size.width,
                    height: 50,
                    padding: const EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                        color: XColors.primary2,
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButton<ProductModel>(
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 22,
                      underline: const SizedBox(),
                      value: state.father,
                      onChanged: (ProductModel? value) {
                        context.read<CreateCatheBloc>().onChangedFather(value!);
                      },
                      items: state.listFather.map((ProductModel location) {
                        return DropdownMenuItem<ProductModel>(
                          value: location,
                          child: Tooltip(
                              message: 'Đây là tooltip',
                              child: Text(location.id)),
                        );
                      }).toList(),
                    ),
                  ),
                ],
                if (state.listMother.isNotEmpty) ...[
                  sizebox20,
                  XTextRich(
                    text: "Mẹ",
                  ),
                  sizebox20,
                  Container(
                    width: size.width,
                    height: 50,
                    padding: const EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                        color: XColors.primary2,
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButton<ProductModel>(
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 22,
                      underline: const SizedBox(),
                      value: state.mother,
                      onChanged: (ProductModel? value) {
                        context.read<CreateCatheBloc>().onChangedMother(value!);
                      },
                      items: state.listMother.map((ProductModel location) {
                        return DropdownMenuItem<ProductModel>(
                          value: location,
                          child: Text(location.id),
                        );
                      }).toList(),
                    ),
                  )
                ]
              ],
              sizebox20,
              const Text("Đánh giá :"),
              sizebox20,
              XInput(
                  value: state.review,
                  onChanged: (value) =>
                      context.read<CreateCatheBloc>().onChangedReview(value)),
              const Text("Màu :"),
              sizebox20,
              XInput(
                  value: state.color,
                  onChanged: (value) =>
                      context.read<CreateCatheBloc>().onChangedColor(value)),
              const Text("Nguồn thức ăn :"),
              sizebox20,
              XInput(
                  value: state.food,
                  onChanged: (value) =>
                      context.read<CreateCatheBloc>().onChangedFood(value)),
              const Text("Kiểu cách :"),
              sizebox20,
              XInput(
                  value: state.style,
                  onChanged: (value) =>
                      context.read<CreateCatheBloc>().onChangedStyle(value)),
              const Text("Ảnh :"),
              sizebox20,
              XButton2(
                icon: Icons.add_box_outlined,
                text: "Thêm Ảnh Mới",
                onPressed: () =>
                    context.read<CreateCatheBloc>().onAddImage(context),
              ),
              if (state.imageFile != null)
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.memory(
                    state.imageFile!.bytes!,
                    fit: BoxFit.contain,
                  ),
                ),
            ]);
      },
    );
  }
}
