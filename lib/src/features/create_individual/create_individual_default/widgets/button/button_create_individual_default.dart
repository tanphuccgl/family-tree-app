import 'package:familytree/src/features/create_individual/create_individual_default/logic/create_individual_default_bloc.dart';

import 'package:familytree/widgets/button/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonCreateIndividualDefault extends StatelessWidget {
  const ButtonCreateIndividualDefault({super.key});

  @override
  Widget build(BuildContext context) {
    return XButton(
      text: "Tạo cá thể",
      onPressed: () =>
          context.read<CreateIndividualDefaultBloc>().createNewProduct(),
    );
  }
}
