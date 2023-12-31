import 'package:familytree/src/features/individual/detail_individual/logic/detail_individual_bloc.dart';
import 'package:familytree/src/theme/colors.dart';

import 'package:familytree/src/utils/helper/gap.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoDetailWidget extends StatelessWidget {
  const VideoDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailIndividualBloc, DetailIndividualState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Video",
                  style: TextStyle(
                      color: XColors.primary5,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                ),
                GapHelper.w4,
                if (state.video.isNotEmpty && state.isEdit)
                  iconAddVideo(context)
              ],
            ),
            GapHelper.h12,
            Container(
                width: 200,
                height: 100,
                margin: EdgeInsets.only(bottom: 30),
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    border: Border.all(color: XColors.primary6, width: 0),
                    color: XColors.primary2,
                    borderRadius: BorderRadius.circular(10)),
                child: state.video.isNotEmpty
                    ? GestureDetector(
                        onTap: () =>
                            context.read<DetailIndividualBloc>().copy(),
                        child: Center(
                          child: Text(
                            state.video,
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    : iconAddVideo(context)),
          ],
        );
      },
    );
  }

  Widget iconAddVideo(BuildContext context) {
    return BlocBuilder<DetailIndividualBloc, DetailIndividualState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: state.isEdit
              ? () => context.read<DetailIndividualBloc>().onAddVideo(context)
              : () {},
          child: Icon(
            Icons.video_call_rounded,
            color: Colors.white,
          ),
        );
      },
    );
  }
}
