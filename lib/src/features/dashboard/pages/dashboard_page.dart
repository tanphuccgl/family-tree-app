import 'package:familytree/src/features/dashboard/cubit/dashboard_bloc.dart';
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
                            children: <Widget>[
                              ListTile(
                                title: const Text(
                                  "Tạo cá thể",
                                ),
                                minLeadingWidth: 20,
                                leading: state.currentIndex == 0
                                    ? const Icon(
                                        Icons.check_outlined,
                                        color: Colors.green,
                                      )
                                    : null,
                                onTap: () =>
                                    context.read<DashboardBloc>().changePage(0),
                              ),
                              ListTile(
                                minLeadingWidth: 20,
                                leading: state.currentIndex == 1
                                    ? const Icon(
                                        Icons.check_outlined,
                                        color: Colors.green,
                                      )
                                    : null,
                                title: const Text(
                                  "Family tree",
                                ),
                                onTap: () =>
                                    context.read<DashboardBloc>().changePage(1),
                              ),
                              ListTile(
                                minLeadingWidth: 20,
                                leading: state.currentIndex == 2
                                    ? const Icon(
                                        Icons.check_outlined,
                                        color: Colors.green,
                                      )
                                    : null,
                                title: const Text(
                                  "Danh sách cá thể",
                                ),
                                onTap: () =>
                                    context.read<DashboardBloc>().changePage(2),
                              ),
                            ],
                          ),
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
