// import 'package:familytree/src/features/create_individual/create_individual_default/logic/create_individual_default_bloc.dart';

// import 'package:familytree/src/utils/helper/gap.dart';
// import 'package:familytree/widgets/button/button_2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ImageWidget extends StatelessWidget {
//   const ImageWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CreateIndividualDefaultBloc,
//         CreateIndividualDefaultState>(
//       builder: (context, state) {
//         return Column(
//           children: [
//             const Text("Ảnh :"),
//             GapHelper.h20,
//             XButton2(
//               icon: Icons.add_box_outlined,
//               text: "Thêm Ảnh Mới",
//               onPressed: () => context
//                   .read<CreateIndividualDefaultBloc>()
//                   .onAddImage(context),
//             ),
//             if (state.imageFile != null)
//               SizedBox(
//                 width: 100,
//                 height: 100,
//                 child: Image.memory(
//                   state.imageFile!.bytes!,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//           ],
//         );
//       },
//     );
//   }
// }
