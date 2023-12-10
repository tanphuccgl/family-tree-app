import 'package:familytree/src/features/dashboard/cubit/dashboard_bloc.dart';
import 'package:familytree/src/features/dashboard/widgets/drawer/drawer_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(),
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return Scaffold(
            body: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                DrawerDashboad(),
                Expanded(
                  flex: state.isExpandedDrawer ? 80 : 95,
                  child: PageView(
                    controller: context.read<DashboardBloc>().pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: state.pages,
                    onPageChanged: (index) {},
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
