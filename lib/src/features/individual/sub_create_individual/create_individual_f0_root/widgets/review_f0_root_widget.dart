import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/src/utils/utils.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/create_individual_f0_root_bloc.dart';

class ReviewF0RootWidget extends StatelessWidget {
  const ReviewF0RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateIndividualF0RootBloc, CreateIndividualF0RootState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Đánh giá",
              style: TextStyle(
                  color: XColors.primary5,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
            GapHelper.h12,
            dropdownListReviewSuggest()
          ],
        );
      },
    );
  }

   Widget dropdownListReviewSuggest() {
    return BlocBuilder<CreateIndividualF0RootBloc,
        CreateIndividualF0RootState>(builder: (context, state) {
      return Container(
        width: 300,
        height: 50,
        margin: EdgeInsets.only(bottom: 30),
        padding: const EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
            color: XColors.primary2, borderRadius: BorderRadius.circular(10)),
        child: DropdownButton<String>(
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 22,
          underline: const SizedBox(),
          value: state.review.isEmpty ? "0.0" : state.review,
          onChanged: (String? value) {
            if (value == null) {
              return;
            }
            context.read<CreateIndividualF0RootBloc>().onChangedReview(value);
          },
          items: Utils.generateListNumberRating().map((String data) {
            return DropdownMenuItem<String>(
              value: data,
              child: Text(
                data,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            );
          }).toList(),
        ),
      );
    });
  }
}
