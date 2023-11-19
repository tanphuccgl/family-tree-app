import 'package:familytree/src/features/create_cathe/logic/create_cathe_bloc.dart';
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
              const Text.rich(
                TextSpan(
                  text: "Family code",
                  style: TextStyle(
                    color: Colors.black, // Màu chữ của "Tên"
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: " *",
                      style: TextStyle(
                        color: Colors.red, // Màu chữ của "*"
                      ),
                    ),
                  ],
                ),
              ),
              sizebox20,
              XInput(
                  value: state.familyCode,
                  errorText:
                      state.isFamilyCodeExist == true ? "Đã tồn tại" : "",
                  onChanged: (value) => context
                      .read<CreateCatheBloc>()
                      .onChangedFamilyCode(value)),
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
              const Text.rich(
                TextSpan(
                  text: "Loại",
                  style: TextStyle(
                    color: Colors.black, // Màu chữ của "Tên"
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: " *",
                      style: TextStyle(
                        color: Colors.red, // Màu chữ của "*"
                      ),
                    ),
                  ],
                ),
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
              sizebox20,
              Visibility(
                  visible: state.type != ProductTypeEnum.f0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text.rich(
                        TextSpan(
                          text: "Từ family code",
                          style: TextStyle(
                            color: Colors.black, // Màu chữ của "Tên"
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: " *",
                              style: TextStyle(
                                color: Colors.red, // Màu chữ của "*"
                              ),
                            ),
                          ],
                        ),
                      ),
                      sizebox20,
                      if (state.productSuggest.isNotEmpty) ...[
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
                            value: state.fromFamilyCode,
                            onChanged: (ProductModel? value) {
                              context
                                  .read<CreateCatheBloc>()
                                  .onChangedFromFamilyCode(value!);
                            },
                            items: state.productSuggest
                                .map((ProductModel location) {
                              return DropdownMenuItem<ProductModel>(
                                value: location,
                                child: Text(location.id),
                              );
                            }).toList(),
                          ),
                        ),
                        sizebox20,
                      ]
                    ],
                  )),
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
