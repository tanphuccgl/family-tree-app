import 'package:familytree/src/features/copulate/logic/copulate_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonSelectArea extends StatelessWidget {
  const ButtonSelectArea({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CopulateBloc, CopulateState>(
      builder: (context, state) {
        if (state.currnentArea == null) {
          return SizedBox.shrink();
        }
        return GestureDetector(
          onTap: () => context.read<CopulateBloc>().onTapTitleArea(),
          child: Row(
            children: [
              Text(
                "Khu vực: ${state.currnentArea?.name}",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Icon(
                Icons.arrow_drop_down_sharp,
                color: Colors.white,
              )
            ],
          ),
        );
      },
    );
  }
}
