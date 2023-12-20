import 'package:familytree/src/features/family_tree/overlay_info_individual/widgets/area_overlay_widget.dart';
import 'package:familytree/src/features/family_tree/overlay_info_individual/widgets/family_code_overlay_widget.dart';
import 'package:familytree/src/features/family_tree/overlay_info_individual/widgets/name_overlay_widget.dart';
import 'package:familytree/src/features/family_tree/overlay_info_individual/widgets/origin_overlay_widget.dart';
import 'package:familytree/src/features/family_tree/overlay_info_individual/widgets/sex_overlay_widget.dart';
import 'package:familytree/src/features/family_tree/overlay_info_individual/widgets/type_overlay_widget.dart';
import 'package:familytree/src/network/model/individual_model.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:familytree/src/utils/helper/gap.dart';
import 'package:flutter/material.dart';

class OverlayInfoIndividual extends StatelessWidget {
  final Offset position;
  final IndividualModel individual;
  const OverlayInfoIndividual(
      {super.key, required this.position, required this.individual});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: position.dx,
      height: position.dy,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          constraints: BoxConstraints(maxHeight: 300, maxWidth: 400),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: XColors.primary10,
          ),
          child: Column(
            children: [
              GapHelper.h8,
              Text(
                "Thông tin",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              GapHelper.h8,
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sessionOneWidget(),
                      GapHelper.w8,
                      sessionTwoWidget(),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle style() {
    return TextStyle(
        color: XColors.primary5,
        fontWeight: FontWeight.w500,
        fontSize: 13,
        overflow: TextOverflow.ellipsis);
  }

  Widget divider() {
    return Divider(
      color: XColors.primary5,
      thickness: 0.5,
      height: 0,
    );
  }

  Widget sessionOneWidget() {
    return SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NameOverlayWidget(individual: individual),
          GapHelper.h4,
          AreaOvelayWidget(
            individual: individual,
          ),
          GapHelper.h4,
          SexOverlayWidget(
            individual: individual,
          ),
        ],
      ),
    );
  }

  Widget sessionTwoWidget() {
    return SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TypeOverlayWidget(
            individual: individual,
          ),
          GapHelper.h4,
          FamilyCodeOverlayWidget(
            individual: individual,
          ),
          GapHelper.h4,
          OriginOverlayWidget(
            individual: individual,
          ),
        ],
      ),
    );
  }
}
