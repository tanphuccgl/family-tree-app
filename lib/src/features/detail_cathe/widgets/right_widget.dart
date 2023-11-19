import 'package:familytree/src/features/detail_cathe/logic/detail_cathe_bloc.dart';
import 'package:familytree/src/network/model/product_model.dart';
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
        return Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Family code"),
                sizebox20,
                XInput(
                  value: state.data.id,
                  readOnly: !state.isEdit,
                  onChanged: (value) => context,
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
                    visible: state.data.type != ProductTypeEnum.f0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
        );
      },
    );
  }
}
