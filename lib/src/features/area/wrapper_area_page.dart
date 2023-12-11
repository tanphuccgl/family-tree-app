import 'package:familytree/src/features/area/create_area/pages/tabview_create_origin.dart';
import 'package:familytree/src/features/area/detail_area/pages/detail_area.dart';
import 'package:familytree/src/features/area/list_area/logic/area_bloc.dart';
import 'package:familytree/src/features/area/list_area/pages/tabview_list_area.dart';

import 'package:familytree/src/theme/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WrapperAreaPage extends StatefulWidget {
  const WrapperAreaPage({super.key});

  @override
  State<WrapperAreaPage> createState() => _WrapperAreaPageState();
}

class _WrapperAreaPageState extends State<WrapperAreaPage>
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
      create: (context) => AreaBloc(context),
      child: BlocBuilder<AreaBloc, AreaState>(
        builder: (context, state) {
          if (state.detailAreaSelectedId.isNotEmpty) {
            return Scaffold(
              backgroundColor: XColors.primary8,
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      "Khu vực",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    SizedBox(height: 40),
                    DetailArea(areaId: state.detailAreaSelectedId)
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
                    "Khu vực",
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
                        TabViewListArea(),
                        TabViewCreateArea(),
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
