import 'package:familytree/src/features/individual/list_individual/logic/individual_bloc.dart';
import 'package:familytree/src/network/model/individual_model.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemIndividual extends StatelessWidget {
  final IndividualModel data;
  final int index;
  final bool isLastItem;
  const ItemIndividual(
      {super.key,
      required this.data,
      required this.index,
      required this.isLastItem});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndividualBloc, IndividualState>(
      builder: (context, state) {
        return Column(
          children: [
            GestureDetector(
              onTap: () => context
                  .read<IndividualBloc>()
                  .onShowDetailIndividual(context, data.id),
              child: Container(
                width: double.infinity,
                height: 70,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Center(
                      child: Checkbox(
                        onChanged: (value) => context
                            .read<IndividualBloc>()
                            .onCheckBoxItem(data.id),
                        value: state.listIndividualSelected.contains(data.id),
                      ),
                    ),
                    GapHelper.w4,
                    SizedBox(
                      width: 100,
                      child: Center(
                        child: Text((index + 1).toString(),
                            maxLines: 1, style: style()),
                      ),
                    ),
                    GapHelper.w4,
                    SizedBox(
                      width: 150,
                      child: Center(
                          child: Text(data.name, maxLines: 1, style: style())),
                    ),
                    GapHelper.w4,
                    SizedBox(
                      width: 150,
                      child: Center(
                          child: Text(data.id, maxLines: 1, style: style())),
                    ),
                    GapHelper.w4,
                    SizedBox(
                      width: 100,
                      child: Center(
                          child: Text(data.type.labelOf,
                              maxLines: 1, style: style())),
                    ),
                    GapHelper.w4,
                    SizedBox(
                      width: 100,
                      child: Center(
                          child: Text(data.isMale ? "Đực" : "Cái",
                              maxLines: 1, style: style())),
                    ),
                    GapHelper.w4,
                    SizedBox(
                      width: 150,
                      child: Center(
                          child: Text(data.origin?.name ?? "N/A",
                              maxLines: 1, style: style())),
                    ),
                    GapHelper.w4,
                    SizedBox(
                      width: 150,
                      child: Center(
                          child: Text(data.area?.name ?? "N/A",
                              maxLines: 1, style: style())),
                    ),
                    GapHelper.w4,
                    SizedBox(
                      width: 150,
                      child: Center(
                          child:
                              Text(data.fatherId, maxLines: 1, style: style())),
                    ),
                    GapHelper.w4,
                    SizedBox(
                      width: 150,
                      child: Center(
                          child:
                              Text(data.motherId, maxLines: 1, style: style())),
                    ),
                    GapHelper.w4,
                    SizedBox(
                      width: 100,
                      child: Center(
                          child: Text(data.date, maxLines: 1, style: style())),
                    ),
                    GapHelper.w4,
                    SizedBox(
                      width: 100,
                      child: Center(
                          child: Text(data.age.toString(),
                              maxLines: 1, style: style())),
                    ),
                    GapHelper.w4,
                    SizedBox(
                      width: 100,
                      child: Center(
                          child: Text(data.color, maxLines: 1, style: style())),
                    ),
                    GapHelper.w4,
                    SizedBox(
                      width: 100,
                      child: Center(
                          child: Text(data.food, maxLines: 1, style: style())),
                    ),
                    GapHelper.w4,
                    SizedBox(
                      width: 100,
                      child: Center(
                          child: Text(data.price.toString(),
                              maxLines: 1, style: style())),
                    ),
                    GapHelper.w4,
                    SizedBox(
                      width: 100,
                      child: Center(
                          child:
                              Text(data.review, maxLines: 1, style: style())),
                    ),
                    GapHelper.w4,
                    SizedBox(
                      width: 100,
                      child: Center(
                          child: Text(data.weight.toString(),
                              maxLines: 1, style: style())),
                    ),
                  ],
                ),
              ),
            ),
            if (!isLastItem) divider(),
          ],
        );
      },
    );
  }

  Widget divider() {
    return Divider(
      color: XColors.primary5,
      thickness: 0.05,
      height: 0,
    );
  }

  TextStyle style() {
    return TextStyle(
        overflow: TextOverflow.ellipsis,
        color: XColors.primary5,
        fontSize: 18,
        fontWeight: FontWeight.normal);
  }
}
