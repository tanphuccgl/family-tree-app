import 'package:familytree/src/features/area/list_area/logic/area_bloc.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonRefreshArea extends StatelessWidget {
  const ButtonRefreshArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: XColors.primary7,
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15)),
      onPressed: () => context.read<AreaBloc>().onRefreshButton(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.refresh,
            color: XColors.primary2,
            size: 20,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "Làm mới",
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
