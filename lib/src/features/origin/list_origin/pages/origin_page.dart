import 'package:familytree/src/features/origin/list_origin/logic/origin_bloc.dart';

import 'package:familytree/src/features/origin/list_origin/widgets/list_origin/tabview_list_origin.dart';
import 'package:familytree/src/theme/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OriginPage extends StatefulWidget {
  const OriginPage({super.key});

  @override
  State<OriginPage> createState() => _OriginPageState();
}

class _OriginPageState extends State<OriginPage> with TickerProviderStateMixin {
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
                        TabViewListOrigin(),
                        TabViewListOrigin(),
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
