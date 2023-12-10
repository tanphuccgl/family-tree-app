// import 'package:familytree/src/features/create_individual/create_individual_default/logic/create_individual_default_bloc.dart';

// import 'package:familytree/src/features/create_individual/widgets/text_rich.dart';
// import 'package:familytree/src/utils/helper/gap.dart';
// import 'package:familytree/widgets/button/button_2.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class VideoWidget extends StatelessWidget {
//   const VideoWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CreateIndividualDefaultBloc,
//         CreateIndividualDefaultState>(
//       builder: (context, state) {
//         return Column(
//           children: [
//             XTextRich(text: "Video"),
//             GapHelper.h20,
//             XButton2(
//               icon: Icons.add_box_outlined,
//               text: "Thêm Video Mới",
//               onPressed: () => context
//                   .read<CreateIndividualDefaultBloc>()
//                   .onAddVideo(context),
//             ),
//             GapHelper.h20,
//             if (state.video != "")
//               GestureDetector(
//                 onTap: () => context.read<CreateIndividualDefaultBloc>().copy(),
//                 child: const Text(
//                   "Link",
//                   style: TextStyle(color: Colors.blue),
//                 ),
//               ),
//           ],
//         );
//       },
//     );
//   }
// }
