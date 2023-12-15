import 'package:familytree/src/features/individual/list_individual/create_individual/pages/tabview_create_individual.dart';
import 'package:familytree/src/features/individual/list_individual/detail_individual/pages/detail_individual.dart';
import 'package:familytree/src/features/individual/list_individual/list_individual/logic/individual_bloc.dart';
import 'package:familytree/src/features/individual/list_individual/list_individual/pages/tabview_list_individual.dart';

import 'package:familytree/src/theme/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WrapperIndividualPage extends StatefulWidget {
  const WrapperIndividualPage({super.key});

  @override
  State<WrapperIndividualPage> createState() => _WrapperIndividualPageState();
}

class _WrapperIndividualPageState extends State<WrapperIndividualPage>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
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
                    DetailIndividual(
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
                    controller: tabController,
                    tabs: [
                      Tab(text: 'Danh sách'),
                      Tab(text: 'Tạo mới'),
                    ],
                  ),
                  SizedBox(height: 40),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        TabViewListIndividual(),
                        TabViewCreateIndividual(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
