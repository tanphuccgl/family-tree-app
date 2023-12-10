import 'package:familytree/src/features/create_individual/create_individual_f0_female/logic/create_individual_f0_female_bloc.dart';

import 'package:familytree/widgets/button/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonCreateIndividualF0Female extends StatelessWidget {
  const ButtonCreateIndividualF0Female({super.key});

  @override
  Widget build(BuildContext context) {
    return XButton(
      text: "Tạo cá thể",
      onPressed: () =>
          context.read<CreateIndividualF0FemaleBloc>().createNewProduct(),
    );
  }
}
