import 'package:familytree/widgets/button/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/create_individual_default_bloc.dart';

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
