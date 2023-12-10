import 'package:familytree/src/features/dashboard/cubit/dashboard_bloc.dart';
import 'package:familytree/src/features/dashboard/widgets/drawer/item_drawer.dart';
import 'package:familytree/src/features/dashboard/widgets/drawer/item_drawer_enum.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerCollapse extends StatelessWidget {
  const DrawerCollapse({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return Expanded(
          flex: 5,
          child: Container(
            color: XColors.primary1,
            padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
            child: Column(
              children: [
                ListView(
                    shrinkWrap: true,
                    children: ItemDrawerEnum.values
                        .map((e) => ItemDrawer(data: e))
                        .toList()),
                divider(),
                IconButton(
                  onPressed: () =>
                      context.read<DashboardBloc>().onDrawerButton(),
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: XColors.primary5,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget divider() {
    return Divider(
      color: XColors.primary5,
      thickness: 0.05,
      height: 30,
    );
  }
}
