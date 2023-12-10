// import 'package:familytree/src/features/create_individual/create_individual_default/logic/create_individual_default_bloc.dart';

// import 'package:familytree/src/utils/helper/gap.dart';
// import 'package:familytree/widgets/froms/input.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class StyleWidget extends StatelessWidget {
//   const StyleWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CreateIndividualDefaultBloc,
//         CreateIndividualDefaultState>(
//       builder: (context, state) {
//         return Column(
//           children: [
//             const Text("Kiểu cách :"),
//             GapHelper.h20,
//             XInput(
//                 value: state.style,
//                 onChanged: (value) => context
//                     .read<CreateIndividualDefaultBloc>()
//                     .onChangedStyle(value)),
//           ],
//         );
//       },
//     );
//   }
// }
