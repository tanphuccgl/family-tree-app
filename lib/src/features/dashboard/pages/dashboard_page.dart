import 'package:auto_route/auto_route.dart';
import 'package:familytree/src/features/dashboard/cubit/dashboard_bloc.dart';
import 'package:familytree/src/features/dashboard/widgets/drawer/drawer_dashboard.dart';
import 'package:familytree/src/features/dashboard/widgets/drawer/expanded/drawer_expanded.dart';
import 'package:familytree/src/router/app_router.gr.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return AutoTabsRouter.pageView(
      physics: NeverScrollableScrollPhysics(),
      routes: [
        TreeViewPageView(),
        IndividualWrapperRoute(),
        WrapperCopulatePageView(),
        AreaWrapperRoute(),
        OriginWrapperRoute(),
      ],
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);

        return BlocProvider(
          create: (context) => DashboardBloc(context, tabsRouter),
          child: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              if (isMobile || size.width < 1120) {
                return Scaffold(
                    key: context.read<DashboardBloc>().scaffoldKeyDrawer,
                    drawer: Drawer(
                      child: DrawerExpanded(isPopUp: true),
                    ),
                    appBar: AppBar(
                      elevation: 0,
                      backgroundColor: XColors.primary2,
                      leading: IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () =>
                            context.read<DashboardBloc>().openDrawer(),
                      ),
                    ),
                    body: child);
              }

              return Scaffold(
                body: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    DrawerDashboad(),
                    Expanded(child: child),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
