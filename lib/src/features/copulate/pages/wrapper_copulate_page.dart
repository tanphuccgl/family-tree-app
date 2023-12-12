import 'package:familytree/src/features/copulate/logic/copulate_bloc.dart';
import 'package:familytree/src/features/copulate/pages/tabview_copulate.dart';
import 'package:familytree/src/features/copulate/widgets/box_select_area.dart';
import 'package:familytree/src/features/copulate/widgets/button_select_area.dart';
import 'package:familytree/src/network/model/product_model.dart';

import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WrapperCopulatePage extends StatefulWidget {
  const WrapperCopulatePage({super.key});

  @override
  State<WrapperCopulatePage> createState() => _WrapperCopulatePageState();
}

class _WrapperCopulatePageState extends State<WrapperCopulatePage>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CopulateBloc(),
      child: BlocBuilder<CopulateBloc, CopulateState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: XColors.primary8,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Phối giống",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      GapHelper.w8,
                      ButtonSelectArea()
                    ],
                  ),
                  SizedBox(height: 40),
                  state.currnentArea == null
                      ? BoxSelectArea()
                      : Expanded(
                          child: Column(
                            children: [
                              TabBar(
                                onTap: (value) {
                                  context
                                      .read<CopulateBloc>()
                                      .onChangeGenerationSelected(
                                          ProductTypeEnum.values[value]);
                                },
                                controller: tabController,
                                tabs: [
                                  Tab(text: 'Thế hệ F0'),
                                  Tab(text: 'Thế hệ F1'),
                                  Tab(text: 'Thế hệ F2'),
                                  Tab(text: 'Thế hệ F3'),
                                ],
                              ),
                              SizedBox(height: 40),
                              Expanded(
                                child: TabBarView(
                                  controller: tabController,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: [
                                    TabViewCopulateWithGeneration(),
                                    TabViewCopulateWithGeneration(),
                                    TabViewCopulateWithGeneration(),
                                    TabViewCopulateWithGeneration(),
                                  ],
                                ),
                              )
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
