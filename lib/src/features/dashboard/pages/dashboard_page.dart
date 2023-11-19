import 'package:familytree/src/features/dashboard/cubit/dashboard_bloc.dart';
import 'package:familytree/src/features/dashboard/widgets/item_drawer.dart';
import 'package:familytree/src/features/dashboard/widgets/item_drawer_enum.dart';
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
            body: Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.black26,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Flexible(
                          child: ListView(
                              children: ItemDrawerEnum.values
                                  .map((e) => ItemDrawer(data: e))
                                  .toList()),
                        ),
                        Expanded(
                          flex: 7,
                          child: PageView(
                            controller:
                                context.read<DashboardBloc>().pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: state.pages,
                            onPageChanged: (index) {},
                          ),
                        ),
                      ],
                    ),
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
