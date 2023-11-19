import 'package:familytree/src/features/detail_cathe/logic/detail_cathe_bloc.dart';
import 'package:familytree/src/features/detail_cathe/widgets/bottom_button.dart';
import 'package:familytree/src/features/detail_cathe/widgets/left_widget.dart';
import 'package:familytree/src/features/detail_cathe/widgets/right_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailCathePage extends StatelessWidget {
  final String id;
  const DetailCathePage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailCatheBloc(id),
      child: BlocBuilder<DetailCatheBloc, DetailCatheState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const LeftWidget(),
                          divider(),
                          const RightWidget()
                        ],
                      ),
                    ),
                    const BottomButton()
                  ]),
            ),
          );
        },
      ),
    );
  }

  Widget divider() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 100),
      child: VerticalDivider(
        thickness: 2,
        color: Colors.grey,
      ),
    );
  }
}
