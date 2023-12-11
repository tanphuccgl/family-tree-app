import 'package:familytree/src/features/dashboard/cubit/dashboard_bloc.dart';
import 'package:familytree/src/features/dashboard/widgets/drawer/item_drawer.dart';
import 'package:familytree/src/features/dashboard/widgets/drawer/item_drawer_enum.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerExpanded extends StatelessWidget {
  final bool isPopUp;
  const DrawerExpanded({super.key, this.isPopUp = false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return Container(
          width: 300,
          height: size.height,
          color: XColors.primary1,
          padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                    shrinkWrap: true,
                    children: ItemDrawerEnum.values
                        .map((e) => ItemDrawer(data: e))
                        .toList()),
              ),
              divider(),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: IconButton(
                      onPressed: isPopUp
                          ? () => context.read<DashboardBloc>().closeDrawer()
                          : () =>
                              context.read<DashboardBloc>().onDrawerButton(),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: XColors.primary5,
                      ),
                    )),
              )
            ],
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
