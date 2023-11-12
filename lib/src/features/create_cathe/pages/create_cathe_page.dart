import 'package:familytree/src/features/create_cathe/logic/create_cathe_bloc.dart';
import 'package:familytree/src/theme/colors.dart';
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
                                const Text("Video :"),
                                sizebox20,
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 2,
                                      side: const BorderSide(
                                          color: XColors.primary3,
                                          strokeAlign: 1),
                                      backgroundColor: XColors.primary2,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 12)),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(
                                        Icons.add_box_outlined,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Thêm Video Mới",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                sizebox20,
                                sizebox20,
                                const Text("Ảnh :"),
                                sizebox20,
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 2,
                                      side: const BorderSide(
                                          color: XColors.primary3,
                                          strokeAlign: 1),
                                      backgroundColor: XColors.primary2,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 12)),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(
                                        Icons.add_box_outlined,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Thêm Ảnh Mới",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(size.width, 50),
                            elevation: 2,
                            backgroundColor: XColors.primary2,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 12)),
                        onPressed: () =>
                            context.read<CreateCatheBloc>().createNewProduct(),
                        child: const Text(
                          "Tạo cá thể",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
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
