import 'package:familytree/src/features/detail_cathe/logic/detail_cathe_bloc.dart';
import 'package:familytree/widgets/button/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailCatheBloc, DetailCatheState>(
      builder: (context, state) {
        if (!state.isEdit) {
          return Column(
            children: [
              XButton(
                text: "Chỉnh sửa",
                onPressed: () =>
                    context.read<DetailCatheBloc>().updateProduct(),
              ),
              const SizedBox(height: 20),
              XButton(
                text: "Xóa",
                onPressed: () =>
                    context.read<DetailCatheBloc>().deleteProduct(context),
              ),
            ],
          );
        }

        return XButton(
          text: "Xác nhận",
          onPressed: () => context.read<DetailCatheBloc>().onConfirmButton(),
        );
      },
    );
  }
}
