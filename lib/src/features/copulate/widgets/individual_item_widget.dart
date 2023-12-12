import 'package:familytree/src/features/copulate/logic/copulate_bloc.dart';
import 'package:familytree/src/network/model/product_model.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndividualItemWidget extends StatelessWidget {
  final ProductModel data;
  final bool isLastItem;
  const IndividualItemWidget(
      {super.key, required this.data, required this.isLastItem});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CopulateBloc, CopulateState>(
      builder: (context, state) {
        bool isSelected = data.id == state.femaleSelected?.id ||
            data.id == state.maleSelected?.id;
        return Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: isSelected ? BorderRadius.circular(3) : null,
                color: isSelected ? XColors.primary7 : null,
              ),
              child: Center(
                child: Text(
                  data.name,
                  maxLines: 1,
                  style: style(isSelected),
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

  TextStyle style(bool isSelected) {
    return TextStyle(
        overflow: TextOverflow.ellipsis,
        color: isSelected ? Colors.white : XColors.primary5,
        fontSize: 18,
        fontWeight: FontWeight.normal);
  }
}
