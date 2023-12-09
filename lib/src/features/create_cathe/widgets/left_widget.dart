import 'package:familytree/src/features/create_cathe/logic/create_cathe_bloc.dart';
import 'package:familytree/src/features/create_cathe/logic/info_more_bloc.dart';
import 'package:familytree/src/features/create_cathe/widgets/text_rich.dart';
import 'package:familytree/widgets/button/button_2.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../network/model/area_model.dart';

class LeftWidget extends StatelessWidget {
  final AreaModel area;
  const LeftWidget({super.key, required this.area});

  @override
  Widget build(BuildContext context) {
    const sizebox20 = SizedBox(height: 20);

    return BlocBuilder<CreateCatheBloc, CreateCatheState>(
      builder: (context, state) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              XTextRich(text: "Tên"),
              sizebox20,
              XInput(
                  value: state.name,
                  onChanged: (value) =>
                      context.read<CreateCatheBloc>().onChangedName(value)),
              XTextRich(text: "xuất xứ"),
              sizebox20,
              XInput(
                value: area.name + " ( ${area.nameId} )",
                readOnly: true,
              ),
              XTextRich(
                text: "Giới tính",
              ),
              sizebox20,
              XInput(
                value: state.isMale == true ? "Đực" : "Cái",
                readOnly: true,
                onTap: () =>
                    context.read<CreateCatheBloc>().onChangedSex(!state.isMale),
              ),
              const Text("Tuổi :"),
              sizebox20,
              XInput(
                  value: state.age.toString(),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  keyboardType: TextInputType.number,
                  onChanged: (value) =>
                      context.read<CreateCatheBloc>().onChangedAge(value)),
              const Text("Cân nặng :"),
              sizebox20,
              XInput(
                  value: state.weight.toString(),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,2}')),
                  ],
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value) =>
                      context.read<CreateCatheBloc>().onChangedWeigth(value)),
              const Text("Giá :"),
              sizebox20,
              XInput(
                  value: state.price.toString(),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,2}')),
                  ],
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value) =>
                      context.read<CreateCatheBloc>().onChangedPrice(value)),
              const Text("Video :"),
              sizebox20,
              XButton2(
                icon: Icons.add_box_outlined,
                text: "Thêm Video Mới",
                onPressed: () =>
                    context.read<CreateCatheBloc>().onAddVideo(context),
              ),
              sizebox20,
              if (state.video != "")
                GestureDetector(
                  onTap: () => context.read<CreateCatheBloc>().copy(),
                  child: const Text(
                    "Link",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.listInfoMore.length,
                  itemBuilder: (_, i) {
                    return BlocProvider(
                      key: ValueKey(state.listInfoMore[i].id),
                      create: (_) => InfoMoreBloc(),
                      child: BlocBuilder<InfoMoreBloc, InfoMoreState>(
                        builder: (context1, infoMoreState) {
                          return Column(
                            key: ValueKey(state.listInfoMore[i].id),
                            children: [
                              Row(
                                children: [
                                  Text("thông tin ${i + 1} :"),
                                  SizedBox(width: 20),
                                  XButton2(
                                      onPressed: () => context
                                          .read<CreateCatheBloc>()
                                          .removeInfoMore(
                                              state.listInfoMore[i]),
                                      text: "Xóa",
                                      icon: Icons.delete)
                                ],
                              ),
                              sizebox20,
                              XInput(
                                  value: infoMoreState.name,
                                  hintText: "Tiêu đề",
                                  onChanged: (value) {
                                    context1
                                        .read<InfoMoreBloc>()
                                        .onChangeName(value);
                                    context
                                        .read<CreateCatheBloc>()
                                        .updateNameToListInfoMore(
                                            state.listInfoMore[i], value);
                                  }),
                              sizebox20,
                              XInput(
                                  hintText: "Nội dung",
                                  value: infoMoreState.description,
                                  onChanged: (value) {
                                    context1
                                        .read<InfoMoreBloc>()
                                        .onChangeDescription(value);
                                    context
                                        .read<CreateCatheBloc>()
                                        .updateDataToListInfoMore(
                                            state.listInfoMore[i], value);
                                  }),
                            ],
                          );
                        },
                      ),
                    );
                  })
            ]);
      },
    );
  }
}
