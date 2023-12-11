import 'package:familytree/src/features/dashboard/cubit/dashboard_bloc.dart';
import 'package:familytree/src/features/dashboard/widgets/drawer/item_drawer_enum.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDrawer extends StatelessWidget {
  final ItemDrawerEnum data;
  const ItemDrawer({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        final isSelected = state.currentIndex == data.index;
        if (!state.isExpandedDrawer) {
          return GestureDetector(
            onTap: () => context.read<DashboardBloc>().changePage(data.index),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  color: isSelected ? XColors.primary4 : null,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset(
                data.icon,
                color: isSelected ? XColors.primary6 : XColors.primary5,
                width: 30,
                height: 30,
              ),
            ),
          );
        }
        return GestureDetector(
          onTap: () => context.read<DashboardBloc>().changePage(data.index),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
                color: isSelected ? XColors.primary4 : null,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Image.asset(
                  data.icon,
                  color: isSelected ? XColors.primary6 : XColors.primary5,
                  width: 30,
                  height: 30,
                ),
                GapHelper.w4,
                Text(
                  data.title,
                  style: TextStyle(
                    color: isSelected ? XColors.primary6 : XColors.primary5,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
