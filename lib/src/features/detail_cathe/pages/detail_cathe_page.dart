import 'package:familytree/src/features/detail_cathe/logic/detail_cathe_bloc.dart';
import 'package:familytree/src/network/model/product_model.dart';
import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailCathePage extends StatelessWidget {
  final String id;
  const DetailCathePage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    const sizebox20 = SizedBox(height: 20);

    return BlocProvider(
      create: (context) => DetailCatheBloc(id),
      child: BlocBuilder<DetailCatheBloc, DetailCatheState>(
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
                                const Text("Tên :"),
                                sizebox20,
                                XInput(
                                  value: state.data.name,
                                  readOnly: true,
                                ),
                                const Text("Tuổi :"),
                                sizebox20,
                                XInput(
                                  value: state.data.age.toString(),
                                  readOnly: true,
                                ),
                                const Text("Cân nặng :"),
                                sizebox20,
                                XInput(
                                  value: state.data.weight.toString(),
                                  readOnly: true,
                                ),
                                const Text("Giá :"),
                                sizebox20,
                                XInput(
                                  value: state.data.price.toString(),
                                  readOnly: true,
                                ),
                                const Text(
                                  "Giới tính",
                                ),
                                sizebox20,
                                XInput(
                                  value:
                                      state.data.isMale == true ? "Đực" : "Cái",
                                  readOnly: true,
                                ),
                                const Text("Video :"),
                                sizebox20,
                                if (state.data.videoLink != "")
                                  GestureDetector(
                                    onTap: () {
                                      Clipboard.setData(ClipboardData(
                                          text: state.data.videoLink));

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
                                const Text("Family code"),
                                sizebox20,
                                XInput(
                                  value: state.data.id,
                                  readOnly: true,
                                ),
                                const Text("Đánh giá :"),
                                sizebox20,
                                XInput(
                                  value: state.data.review,
                                  readOnly: true,
                                ),
                                const Text("Màu :"),
                                sizebox20,
                                XInput(
                                  value: state.data.color,
                                  readOnly: true,
                                ),
                                const Text("Loại :"),
                                sizebox20,
                                XInput(
                                  value: state.data.type.labelOf,
                                  readOnly: true,
                                ),
                                sizebox20,
                                Visibility(
                                    visible:
                                        state.data.type != ProductTypeEnum.f0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Từ family code",
                                        ),
                                        sizebox20,
                                        XInput(
                                          value: state.data.fromId,
                                          readOnly: true,
                                        ),
                                        sizebox20,
                                      ],
                                    )),
                                const Text("Ảnh :"),
                                sizebox20,
                                if (state.data.image != "")
                                  SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Image.network(
                                      state.data.image,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                              ]),
                        ),
                      ],
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
