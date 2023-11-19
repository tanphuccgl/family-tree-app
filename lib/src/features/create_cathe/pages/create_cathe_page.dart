import 'package:familytree/src/features/create_cathe/logic/create_cathe_bloc.dart';
import 'package:familytree/src/features/create_cathe/widgets/left_widget.dart';
import 'package:familytree/src/features/create_cathe/widgets/right_widget.dart';
import 'package:familytree/widgets/button/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateCathePage extends StatelessWidget {
  const CreateCathePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => CreateCatheBloc(),
      child: BlocBuilder<CreateCatheBloc, CreateCatheState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    SizedBox(width: size.width / 3, child: const LeftWidget()),
                    divider(),
                    SizedBox(width: size.width / 3, child: const RightWidget()),
                  ]),
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
