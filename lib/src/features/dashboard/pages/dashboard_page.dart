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
                                title: Text(
                                  "Tạo cá thể",
                                ),
                                onTap: () =>
                                    context.read<DashboardBloc>().changePage(0),
                              ),
                              ListTile(title: Text("Menu B")),
                              ListTile(title: Text("Menu C")),
                              ListTile(title: Text("Menu D")),
                              ListTile(title: Text("Menu E")),
                              ListTile(title: Text("Menu F")),
                              ListTile(title: Text("Menu G")),
                              ListTile(title: Text("Menu H")),
                              ListTile(title: Text("Menu I")),
                              ListTile(title: Text("Menu J")),
                              ListTile(title: Text("Menu K")),
                              ListTile(title: Text("Menu L")),
                              ListTile(title: Text("Menu M")),
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
