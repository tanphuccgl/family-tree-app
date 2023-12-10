import 'package:familytree/src/features/create_individual/copulate/logic/copulate_bloc.dart';
import 'package:familytree/src/features/create_individual/copulate/widgets/generation_copulate_tabbar.dart';
import 'package:familytree/src/features/create_individual/copulate/widgets/generation_copulate_tabview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CopulatePage extends StatelessWidget {
  const CopulatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CopulateBloc(),
      child: BlocBuilder<CopulateBloc, CopulateState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Phối giống"),
            ),
            body: state.emptyListAll
                ? Text("không có dữ liệu")
                : Column(
                    children: [
                      GenerationCopulateTabbar(),
                      GenerationCopulateTabView(),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
