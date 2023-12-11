import 'package:familytree/src/features/origin/list_origin/logic/create_origin_bloc.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameOriginWidget extends StatelessWidget {
  const NameOriginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateOriginBloc, CreateOriginState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tên",
              style: TextStyle(
                  color: XColors.primary5,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
            GapHelper.h12,
            SizedBox(
              width: 300,
              height: 80,
              child: XInput(
                  value: state.name,
                  onChanged: (value) =>
                      context.read<CreateOriginBloc>().onChangedName(value)),
            ),
          ],
        );
      },
    );
  }
}
