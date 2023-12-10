// import 'package:familytree/src/features/create_individual/create_individual_default/logic/create_individual_default_bloc.dart';

// import 'package:familytree/src/features/create_individual/widgets/text_rich.dart';
// import 'package:familytree/src/utils/helper/gap.dart';
// import 'package:familytree/widgets/froms/input.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class PriceWidget extends StatelessWidget {
//   const PriceWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CreateIndividualDefaultBloc,
//         CreateIndividualDefaultState>(
//       builder: (context, state) {
//         return Column(
//           children: [
//             XTextRich(text: "Giá"),
//             GapHelper.h20,
//             XInput(
//                 value: state.price.toString(),
//                 inputFormatters: <TextInputFormatter>[
//                   FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
//                 ],
//                 keyboardType:
//                     const TextInputType.numberWithOptions(decimal: true),
//                 onChanged: (value) => context
//                     .read<CreateIndividualDefaultBloc>()
//                     .onChangedPrice(value)),
//           ],
//         );
//       },
//     );
//   }
// }
