import 'package:familytree/src/features/dashboard/cubit/dashboard_bloc.dart';
import 'package:familytree/src/features/dashboard/widgets/drawer/collapse/drawer_collapse.dart';
import 'package:familytree/src/features/dashboard/widgets/drawer/expanded/drawer_expanded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerDashboad extends StatelessWidget {
  const DrawerDashboad({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return state.isExpandedDrawer ? DrawerExpanded() : DrawerCollapse();
      },
    );
  }
}
