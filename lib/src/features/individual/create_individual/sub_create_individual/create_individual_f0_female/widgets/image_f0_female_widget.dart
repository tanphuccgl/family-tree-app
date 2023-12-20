import 'package:familytree/src/theme/colors.dart';

import 'package:familytree/src/utils/helper/gap.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/create_individual_f0_female_bloc.dart';

class ImageF0FemaleWidget extends StatelessWidget {
  const ImageF0FemaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateIndividualF0FemaleBloc,
        CreateIndividualF0FemaleState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ảnh",
              style: TextStyle(
                  color: XColors.primary5,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
            GapHelper.h12,
            GestureDetector(
              onTap: () => context
                  .read<CreateIndividualF0FemaleBloc>()
                  .onAddImage(context),
              child: Container(
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
                    state.image,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
