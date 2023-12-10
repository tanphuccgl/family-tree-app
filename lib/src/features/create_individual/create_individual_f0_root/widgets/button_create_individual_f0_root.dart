import 'package:familytree/src/features/create_individual/create_individual_f0_root/logic/create_individual_f0_root_bloc.dart';
import 'package:familytree/widgets/button/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonCreateIndividualF0Root extends StatelessWidget {
  const ButtonCreateIndividualF0Root({super.key});

  @override
  Widget build(BuildContext context) {
    return XButton(
      text: "Tạo cá thể",
      onPressed: () =>
          context.read<CreateIndividualF0RootBloc>().createNewProduct(),
    );
  }
}
