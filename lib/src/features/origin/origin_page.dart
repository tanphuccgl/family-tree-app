import 'package:auto_route/auto_route.dart';
import 'package:familytree/src/features/origin/list_origin/logic/origin_bloc.dart';

import 'package:familytree/src/router/app_router.gr.dart';
import 'package:familytree/src/theme/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OriginPage extends StatelessWidget {
  const OriginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      physics: NeverScrollableScrollPhysics(),
      routes: [
        ListOriginTab(),
        CreateOriginTab(),
      ],
      builder: (context, child, controller) {
        return BlocProvider(
          create: (context) => OriginBloc(context),
          child: BlocBuilder<OriginBloc, OriginState>(
            builder: (context, state) {
              return Scaffold(
                backgroundColor: XColors.primary8,
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Xuất xứ",
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
