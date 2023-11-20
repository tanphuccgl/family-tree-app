import 'package:familytree/src/features/create_cathe/logic/create_cathe_bloc.dart';
import 'package:familytree/src/features/create_cathe/widgets/left_widget.dart';
import 'package:familytree/src/features/create_cathe/widgets/right_widget.dart';
import 'package:familytree/src/network/model/area_model.dart';
import 'package:familytree/widgets/button/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateCathePage extends StatelessWidget {
  final AreaModel area;
  final bool hasF0;
  const CreateCathePage({
    super.key,
    required this.area,
    required this.hasF0,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => CreateCatheBloc(context, area: area, hasF0: hasF0),
      child: BlocBuilder<CreateCatheBloc, CreateCatheState>(
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () => context.read<CreateCatheBloc>().addInfoMore(),
              child: const Icon(Icons.add),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    SizedBox(
                        width: size.width / 3, child: LeftWidget(area: area)),
                    divider(),
                    SizedBox(width: size.width / 3, child: const RightWidget()),
                  ]),
                  const SizedBox(height: 50),
                  XButton(
                    text: "Tạo cá thể",
                    onPressed: () =>
                        context.read<CreateCatheBloc>().createNewProduct(),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "* Bắt buộc điền",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.red,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
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
