import 'package:auto_route/auto_route.dart';
import 'package:familytree/src/features/area/list_area/logic/area_bloc.dart';
import 'package:familytree/src/router/app_router.gr.dart';

import 'package:familytree/src/theme/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaPage extends StatelessWidget {
  const AreaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      physics: NeverScrollableScrollPhysics(),
      routes: [
        ListAreaTab(),
        CreateAreaTab(),
      ],
      builder: (context, child, controller) {
        return BlocProvider(
          create: (context) => AreaBloc(context),
          child: BlocBuilder<AreaBloc, AreaState>(
            builder: (context, state) {
              return Scaffold(
                backgroundColor: XColors.primary8,
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Khu vực",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      SizedBox(height: 40),
                      TabBar(
                        controller: controller,
                        tabs: [
                          Tab(text: 'Danh sách'),
                          Tab(text: 'Tạo mới'),
                        ],
                      ),
                      SizedBox(height: 40),
                      Expanded(child: child)
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
