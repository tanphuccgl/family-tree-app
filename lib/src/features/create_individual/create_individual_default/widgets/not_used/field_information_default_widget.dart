// import 'package:familytree/src/features/create_individual/create_individual_default/logic/create_individual_default_bloc.dart';
// import 'package:familytree/src/features/create_individual/create_individual_default/logic/info_more_bloc.dart';

// import 'package:familytree/src/utils/helper/gap.dart';
// import 'package:familytree/widgets/button/button_2.dart';
// import 'package:familytree/widgets/froms/input.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class FieldInformationWidget extends StatelessWidget {
//   const FieldInformationWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CreateIndividualDefaultBloc,
//         CreateIndividualDefaultState>(
//       builder: (context, state) {
//         return ListView.builder(
//             shrinkWrap: true,
//             itemCount: state.listInfoMore.length,
//             itemBuilder: (_, i) {
//               return BlocProvider(
//                 key: ValueKey(state.listInfoMore[i].id),
//                 create: (_) => InfoMoreBloc(),
//                 child: BlocBuilder<InfoMoreBloc, InfoMoreState>(
//                   builder: (context1, infoMoreState) {
//                     return Column(
//                       key: ValueKey(state.listInfoMore[i].id),
//                       children: [
//                         Row(
//                           children: [
//                             Text("thông tin ${i + 1} :"),
//                             SizedBox(width: 20),
//                             XButton2(
//                                 onPressed: () => context
//                                     .read<CreateIndividualDefaultBloc>()
//                                     .removeInfoMore(state.listInfoMore[i]),
//                                 text: "Xóa",
//                                 icon: Icons.delete)
//                           ],
//                         ),
//                         GapHelper.h20,
//                         XInput(
//                             value: infoMoreState.name,
//                             hintText: "Tiêu đề",
//                             onChanged: (value) {
//                               context1.read<InfoMoreBloc>().onChangeName(value);
//                               context
//                                   .read<CreateIndividualDefaultBloc>()
//                                   .updateNameToListInfoMore(
//                                       state.listInfoMore[i], value);
//                             }),
//                         GapHelper.h20,
//                         XInput(
//                             hintText: "Nội dung",
//                             value: infoMoreState.description,
//                             onChanged: (value) {
//                               context1
//                                   .read<InfoMoreBloc>()
//                                   .onChangeDescription(value);
//                               context
//                                   .read<CreateIndividualDefaultBloc>()
//                                   .updateDataToListInfoMore(
//                                       state.listInfoMore[i], value);
//                             }),
//                       ],
//                     );
//                   },
//                 ),
//               );
//             });
//       },
//     );
//   }
// }
