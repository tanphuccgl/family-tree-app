// import 'package:familytree/src/features/create_individual/create_individual_default/logic/create_individual_default_bloc.dart';

// import 'package:familytree/src/features/create_individual/widgets/text_rich.dart';
// import 'package:familytree/src/utils/helper/gap.dart';
// import 'package:familytree/widgets/froms/input.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class MotherWidget extends StatelessWidget {
//   const MotherWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CreateIndividualDefaultBloc,
//         CreateIndividualDefaultState>(
//       builder: (context, state) {
//         return Column(
//           children: [
//             XTextRich(text: "Mẹ"),
//             GapHelper.h20,
//             XInput(
//                 value: state.motherNote,
//                 onChanged: (value) => context
//                     .read<CreateIndividualDefaultBloc>()
//                     .onChangedMotherNote(value)),
//           ],
//         );
//       },
//     );
//   }
// }
