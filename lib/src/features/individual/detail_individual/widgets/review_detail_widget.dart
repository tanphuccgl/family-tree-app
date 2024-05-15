import 'package:familytree/src/features/individual/detail_individual/logic/detail_individual_bloc.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:familytree/src/utils/utils.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewDetailWidget extends StatelessWidget {
  const ReviewDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailIndividualBloc, DetailIndividualState>(
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
            // SizedBox(
            //   width: 300,
            //   height: 80,
            //   child: XInput(
            //       readOnly: !state.isEdit,
            //       fillColor: state.isEdit ? null : XColors.primary7,
            //       value: state.review,
            //       onChanged: (value) => context
            //           .read<DetailIndividualBloc>()
            //           .onChangedReview(value)),
            // ),
          ],
        );
      },
    );
  }

  Widget dropdownListReviewSuggest() {
    return BlocBuilder<DetailIndividualBloc, DetailIndividualState>(
        builder: (context, state) {
      return IgnorePointer(
        ignoring: !state.isEdit,
        child: Container(
          width: 300,
          height: 50,
          margin: EdgeInsets.only(bottom: 30),
          padding: const EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
              color: state.isEdit ? XColors.primary2 : XColors.primary7,
              borderRadius: BorderRadius.circular(10)),
          child: DropdownButton<String>(
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 22,
            underline: const SizedBox(),
            value: state.review.isEmpty ? "0.0" : state.review,
            onChanged: (String? value) {
              if (value == null) {
                return;
              }
              context.read<DetailIndividualBloc>().onChangedReview(value);
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
        ),
      );
    });
  }
}
