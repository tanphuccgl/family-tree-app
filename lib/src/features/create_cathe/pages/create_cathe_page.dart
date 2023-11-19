import 'package:familytree/src/features/create_cathe/logic/create_cathe_bloc.dart';
import 'package:familytree/src/network/model/product_model.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/widgets/button/button.dart';
import 'package:familytree/widgets/button/button_2.dart';
import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateCathePage extends StatelessWidget {
  const CreateCathePage({super.key});

  @override
  Widget build(BuildContext context) {
    const sizebox20 = SizedBox(height: 20);
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => CreateCatheBloc(),
      child: BlocBuilder<CreateCatheBloc, CreateCatheState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text.rich(
                                  TextSpan(
                                    text: "Tên",
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
                                    value: state.name,
                                    onChanged: (value) => context
                                        .read<CreateCatheBloc>()
                                        .onChangedName(value)),
                                const Text("Tuổi :"),
                                sizebox20,
                                XInput(
                                    value: state.age.toString(),
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                    ],
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) => context
                                        .read<CreateCatheBloc>()
                                        .onChangedAge(value)),
                                const Text("Cân nặng :"),
                                sizebox20,
                                XInput(
                                    value: state.weight.toString(),
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'^\d+\.?\d{0,2}')),
                                    ],
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    onChanged: (value) => context
                                        .read<CreateCatheBloc>()
                                        .onChangedWeigth(value)),
                                const Text("Giá :"),
                                sizebox20,
                                XInput(
                                    value: state.price.toString(),
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'^\d+\.?\d{0,2}')),
                                    ],
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    onChanged: (value) => context
                                        .read<CreateCatheBloc>()
                                        .onChangedPrice(value)),
                                const Text.rich(
                                  TextSpan(
                                    text: "Giới tính",
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
                                  value: state.isMale == true ? "Đực" : "Cái",
                                  readOnly: true,
                                  onTap: () => context
                                      .read<CreateCatheBloc>()
                                      .onChangedSex(!state.isMale),
                                ),
                                const Text("Video :"),
                                sizebox20,
                                XButton2(
                                  icon: Icons.add_box_outlined,
                                  text: "Thêm Video Mới",
                                  onPressed: () => context
                                      .read<CreateCatheBloc>()
                                      .onAddVideo(context),
                                ),
                                sizebox20,
                                if (state.video != "")
                                  GestureDetector(
                                    onTap: () {
                                      Clipboard.setData(
                                          ClipboardData(text: state.video));

                                      XToast.show("Sao chép");
                                    },
                                    child: const Text(
                                      "Link",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                              ]),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 100),
                          child: VerticalDivider(
                            thickness: 2,
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          child: Column(
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
                                    errorText: state.isFamilyCodeExist == true
                                        ? "Đã tồn tại"
                                        : "",
                                    onChanged: (value) => context
                                        .read<CreateCatheBloc>()
                                        .onChangedFamilyCode(value)),
                                const Text("Đánh giá :"),
                                sizebox20,
                                XInput(
                                    value: state.review,
                                    onChanged: (value) => context
                                        .read<CreateCatheBloc>()
                                        .onChangedReview(value)),
                                const Text("Màu :"),
                                sizebox20,
                                XInput(
                                    value: state.color,
                                    onChanged: (value) => context
                                        .read<CreateCatheBloc>()
                                        .onChangedColor(value)),
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
                                      context
                                          .read<CreateCatheBloc>()
                                          .onChangedType(value!);
                                    },
                                    items: ProductTypeEnum.values
                                        .map((ProductTypeEnum location) {
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text.rich(
                                          TextSpan(
                                            text: "Từ family code",
                                            style: TextStyle(
                                              color: Colors
                                                  .black, // Màu chữ của "Tên"
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: " *",
                                                style: TextStyle(
                                                  color: Colors
                                                      .red, // Màu chữ của "*"
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        sizebox20,
                                        if (state
                                            .productSuggest.isNotEmpty) ...[
                                          Container(
                                            width: size.width,
                                            height: 50,
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            decoration: BoxDecoration(
                                                color: XColors.primary2,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: DropdownButton<ProductModel>(
                                              icon: const Icon(
                                                  Icons.arrow_drop_down),
                                              iconSize: 22,
                                              underline: const SizedBox(),
                                              value: state.fromFamilyCode,
                                              onChanged: (ProductModel? value) {
                                                context
                                                    .read<CreateCatheBloc>()
                                                    .onChangedFromFamilyCode(
                                                        value!);
                                              },
                                              items: state.productSuggest
                                                  .map((ProductModel location) {
                                                return DropdownMenuItem<
                                                    ProductModel>(
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
                                  onPressed: () => context
                                      .read<CreateCatheBloc>()
                                      .onAddImage(context),
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
                              ]),
                        ),
                      ],
                    ),
                  ),
                  XButton(
                    text: "Tạo cá thể",
                    onPressed: () =>
                        context.read<CreateCatheBloc>().createNewProduct(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "* Bắt buộc điền",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.red,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
