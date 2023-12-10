import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/detail_cathe_bloc.dart';
import '../widgets/bottom_button.dart';
import '../widgets/left_widget.dart';
import '../widgets/right_widget.dart';

class DetailCathePage extends StatelessWidget {
  final String id;

  const DetailCathePage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => DetailCatheBloc(context, id),
      child: BlocBuilder<DetailCatheBloc, DetailCatheState>(
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: !state.isEdit
                ? SizedBox()
                : FloatingActionButton(
                    onPressed: () =>
                        context.read<DetailCatheBloc>().addInfoMore(),
                    child: const Icon(Icons.add),
                  ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: ListView(shrinkWrap: true, children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: size.width / 3, child: LeftWidget()),
                    divider(),
                    SizedBox(width: size.width / 3, child: const RightWidget()),
                  ],
                ),
                SizedBox(
                  height: 50,
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
    return const VerticalDivider(
      thickness: 2,
      color: Colors.grey,
    );
  }
}
