import 'package:familytree/src/features/individual/list_individual/logic/individual_bloc.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonDeleteIndividual extends StatelessWidget {
  const ButtonDeleteIndividual({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: XColors.primary7,
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15)),
      onPressed: () => context.read<IndividualBloc>().deleteIndividual(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.restore_from_trash,
            color: XColors.primary2,
            size: 20,
          ),
          const SizedBox(
            width: 5,
          ),
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
