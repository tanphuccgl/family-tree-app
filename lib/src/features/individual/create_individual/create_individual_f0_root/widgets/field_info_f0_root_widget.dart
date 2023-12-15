import 'package:familytree/src/features/individual/create_individual/create_individual_default/logic/info_more_bloc.dart';
import 'package:familytree/src/features/individual/create_individual/create_individual_f0_root/logic/create_individual_f0_root_bloc.dart';
import 'package:familytree/src/theme/colors.dart';

import 'package:familytree/src/utils/helper/gap.dart';

import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FieldInfoF0RootWidget extends StatelessWidget {
  const FieldInfoF0RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateIndividualF0RootBloc, CreateIndividualF0RootState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Text(
                  "Thêm thông tin",
                  style: TextStyle(
                      color: XColors.primary5,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                ),
                GapHelper.w4,
                GestureDetector(
                  onTap: () =>
                      context.read<CreateIndividualF0RootBloc>().addInfoMore(),
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
                itemCount: state.listFieldInfo.length,
                itemBuilder: (_, i) {
                  return BlocProvider(
                    key: ValueKey(state.listFieldInfo[i].id),
                    create: (_) => InfoMoreBloc(),
                    child: BlocBuilder<InfoMoreBloc, InfoMoreState>(
                      builder: (context1, infoMoreState) {
                        return Column(
                          key: ValueKey(state.listFieldInfo[i].id),
                          children: [
                            Row(
                              children: [
                                Text(
                                  "thông tin ${i + 1} :",
                                  style: TextStyle(
                                      color: XColors.primary5,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                ),
                                GapHelper.w4,
                                GestureDetector(
                                    onTap: () => context
                                        .read<CreateIndividualF0RootBloc>()
                                        .removeInfoMore(state.listFieldInfo[i]),
                                    child: Icon(
                                      Icons.delete_outlined,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            GapHelper.h20,
                            SizedBox(
                              width: 300,
                              height: 80,
                              child: XInput(
                                  value: infoMoreState.name,
                                  hintText: "Tiêu đề",
                                  onChanged: (value) {
                                    context1
                                        .read<InfoMoreBloc>()
                                        .onChangeName(value);
                                    context
                                        .read<CreateIndividualF0RootBloc>()
                                        .updateNameTolistFieldInfo(
                                            state.listFieldInfo[i], value);
                                  }),
                            ),
                            SizedBox(
                              width: 300,
                              height: 80,
                              child: XInput(
                                  hintText: "Nội dung",
                                  value: infoMoreState.description,
                                  onChanged: (value) {
                                    context1
                                        .read<InfoMoreBloc>()
                                        .onChangeDescription(value);
                                    context
                                        .read<CreateIndividualF0RootBloc>()
                                        .updateDataTolistFieldInfo(
                                            state.listFieldInfo[i], value);
                                  }),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }),
          ],
        );
      },
    );
  }
}
