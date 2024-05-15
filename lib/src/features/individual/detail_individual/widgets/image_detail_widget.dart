import 'package:familytree/src/features/individual/detail_individual/logic/detail_individual_bloc.dart';
import 'package:familytree/src/theme/colors.dart';

import 'package:familytree/src/utils/helper/gap.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageDetailWidget extends StatelessWidget {
  const ImageDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailIndividualBloc, DetailIndividualState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Ảnh",
                  style: TextStyle(
                      color: XColors.primary5,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                ),
                GapHelper.w4,
                GestureDetector(
                  onTap: state.isEdit
                      ? () => context
                          .read<DetailIndividualBloc>()
                          .onAddImage(context)
                      : () {},
                  child: Icon(
                    Icons.add_circle_outline_sharp,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            GapHelper.h12,
            ListView.builder(
              shrinkWrap: true,
              itemCount: state.image.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 200,
                  height: 200,
                  margin: EdgeInsets.only(bottom: 30),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border: Border.all(color: XColors.primary6, width: 0),
                      color: XColors.primary2,
                      borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      state.image[index],
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
