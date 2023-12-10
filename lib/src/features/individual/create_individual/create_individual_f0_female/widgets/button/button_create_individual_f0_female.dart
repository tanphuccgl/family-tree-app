import 'package:familytree/widgets/button/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/create_individual_f0_female_bloc.dart';

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
