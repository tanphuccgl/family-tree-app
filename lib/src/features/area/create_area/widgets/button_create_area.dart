import 'package:familytree/src/features/area/create_area/logic/create_area_bloc.dart';

import 'package:familytree/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonCreateArea extends StatelessWidget {
  const ButtonCreateArea({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: XColors.primary7,
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20)),
      onPressed: () => context.read<CreateAreaBloc>().createNewArea(),
      child: Text(
        "Tạo mới",
        style: const TextStyle(
          fontSize: 20,
          color: XColors.primary2,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
