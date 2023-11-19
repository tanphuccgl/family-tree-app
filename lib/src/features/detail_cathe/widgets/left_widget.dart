import 'package:familytree/src/features/detail_cathe/logic/detail_cathe_bloc.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeftWidget extends StatelessWidget {
  const LeftWidget({super.key});

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
                  value: state.data.isMale == true ? "Đực" : "Cái",
                  readOnly: true,
                ),
                const Text("Video :"),
                sizebox20,
                if (state.data.videoLink != "")
                  GestureDetector(
                    onTap: () => context.read<DetailCatheBloc>().copy(),
                    child: const Text(
                      "Link",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
              ]),
        );
      },
    );
  }
}
