import 'package:familytree/src/features/individual/list_individual/detail_individual/logic/detail_individual_bloc.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonRemoveIndividual extends StatelessWidget {
  const ButtonRemoveIndividual({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: XColors.primary7,
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15)),
      onPressed: () => context.read<DetailIndividualBloc>().deleteOrigin(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.remove_circle_outline_rounded,
            color: XColors.primary2,
            size: 20,
          ),
          if (size.width > 600) const SizedBox(width: 5),
          if (size.width > 600)
            Text(
              "Xóa",
              style: const TextStyle(
                fontSize: 17,
                color: XColors.primary2,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }
}
