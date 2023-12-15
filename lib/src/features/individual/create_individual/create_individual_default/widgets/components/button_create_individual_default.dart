import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/create_individual_default_bloc.dart';

import 'package:familytree/src/theme/colors.dart';

class ButtonCreateIndividualDefault extends StatelessWidget {
  const ButtonCreateIndividualDefault({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(right: size.width * 0.05),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: XColors.primary7,
              padding:
                  const EdgeInsets.symmetric(vertical: 25, horizontal: 20)),
          onPressed: () =>
              context.read<CreateIndividualDefaultBloc>().createNewProduct(),
          child: Text(
            "Tạo cá thể",
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
