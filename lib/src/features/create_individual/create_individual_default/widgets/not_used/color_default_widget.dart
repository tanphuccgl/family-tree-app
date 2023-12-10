// import 'package:familytree/src/features/create_individual/create_individual_default/logic/create_individual_default_bloc.dart';

// import 'package:familytree/src/utils/helper/gap.dart';
// import 'package:familytree/widgets/froms/input.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ColorWidget extends StatelessWidget {
//   const ColorWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CreateIndividualDefaultBloc,
//         CreateIndividualDefaultState>(
//       builder: (context, state) {
//         return Column(
//           children: [
//             const Text("Màu :"),
//             GapHelper.h20,
//             XInput(
//                 value: state.color,
//                 onChanged: (value) => context
//                     .read<CreateIndividualDefaultBloc>()
//                     .onChangedColor(value)),
//           ],
//         );
//       },
//     );
//   }
// }
