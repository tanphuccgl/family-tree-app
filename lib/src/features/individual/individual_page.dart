import 'package:auto_route/auto_route.dart';
import 'package:familytree/src/router/app_router.gr.dart';

import 'package:familytree/src/theme/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'detail_individual/pages/detail_individual_page.dart';
import 'list_individual/logic/individual_bloc.dart';

class IndividualPage extends StatelessWidget {
  const IndividualPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      physics: NeverScrollableScrollPhysics(),
      routes: [
        ListIndividualTab(),
        CreateIndividualTab(),
      ],
      builder: (context, child, controller) {
        return BlocProvider(
          create: (context) => IndividualBloc(context),
          child: BlocBuilder<IndividualBloc, IndividualState>(
            builder: (context, state) {
              if (state.detailIndividualSelectedId.isNotEmpty) {
                return Scaffold(
                  backgroundColor: XColors.primary8,
                  body: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Text(
                          "Cá thể",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        SizedBox(height: 40),
                        DetailIndividualPage(
                            individualId: state.detailIndividualSelectedId)
                      ],
                    ),
                  ),
                );
              }

              return Scaffold(
                backgroundColor: XColors.primary8,
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cá thể",
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
