//TODO
// class RightWidget extends StatelessWidget {
//   const RightWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const sizebox20 = SizedBox(height: 20);
//     final size = MediaQuery.of(context).size;

//     return BlocBuilder<CreateCatheBloc, CreateCatheState>(
//       builder: (context, state) {
//         return Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [

//               if (state.type == ProductTypeEnum.f0) ...[

//               ],
//               if (state.type != ProductTypeEnum.f0 &&
//                   state.type != ProductTypeEnum.f1) ...[
//                 if (state.listFather.isNotEmpty) ...[
//                   sizebox20,
//                   XTextRich(
//                     text: "Cha",
//                   ),
//                   sizebox20,
//                   Container(
//                     width: size.width,
//                     height: 50,
//                     padding: const EdgeInsets.only(left: 5),
//                     decoration: BoxDecoration(
//                         color: XColors.primary2,
//                         borderRadius: BorderRadius.circular(10)),
//                     child: DropdownButton<ProductModel>(
//                       icon: const Icon(Icons.arrow_drop_down),
//                       iconSize: 22,
//                       underline: const SizedBox(),
//                       value: state.father,
//                       onChanged: (ProductModel? value) {
//                         context.read<CreateCatheBloc>().onChangedFather(value!);
//                       },
//                       items: state.listFather.map((ProductModel location) {
//                         return DropdownMenuItem<ProductModel>(
//                           value: location,
//                           child: Tooltip(
//                               message: 'Đây là tooltip',
//                               child: Text(location.id)),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 ],
//                 if (state.listMother.isNotEmpty) ...[
//                   sizebox20,
//                   XTextRich(
//                     text: "Mẹ",
//                   ),
//                   sizebox20,
//                   Container(
//                     width: size.width,
//                     height: 50,
//                     padding: const EdgeInsets.only(left: 5),
//                     decoration: BoxDecoration(
//                         color: XColors.primary2,
//                         borderRadius: BorderRadius.circular(10)),
//                     child: DropdownButton<ProductModel>(
//                       icon: const Icon(Icons.arrow_drop_down),
//                       iconSize: 22,
//                       underline: const SizedBox(),
//                       value: state.mother,
//                       onChanged: (ProductModel? value) {
//                         context.read<CreateCatheBloc>().onChangedMother(value!);
//                       },
//                       items: state.listMother.map((ProductModel location) {
//                         return DropdownMenuItem<ProductModel>(
//                           value: location,
//                           child: Text(location.id),
//                         );
//                       }).toList(),
//                     ),
//                   )
//                 ]
//               ],
//               sizebox20,

//             ]);
//       },
//     );
//   }
// }
