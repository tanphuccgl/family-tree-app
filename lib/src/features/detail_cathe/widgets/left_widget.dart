import 'package:familytree/src/features/create_cathe/widgets/text_rich.dart';
import 'package:familytree/src/features/detail_cathe/logic/detail_cathe_bloc.dart';
import 'package:familytree/src/features/detail_cathe/logic/info_more_1_bloc.dart';
import 'package:familytree/widgets/button/button_2.dart';
import 'package:familytree/widgets/froms/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeftWidget extends StatelessWidget {
  const LeftWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const sizebox20 = SizedBox(height: 20);

    return BlocBuilder<DetailCatheBloc, DetailCatheState>(
      builder: (context, state) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Tên :"),
              sizebox20,
              XInput(
                value: state.name,
                readOnly: !state.isEdit,
                onChanged: !state.isEdit
                    ? (value) {}
                    : (value) =>
                        context.read<DetailCatheBloc>().onChangedName(value),
              ),
              XTextRich(text: "Khu vực"),
              sizebox20,
              XInput(
                value: (state.area?.name ?? "") + " ( ${state.area?.nameId} )",
                readOnly: true,
              ),
              const Text("Tuổi :"),
              sizebox20,
              XInput(
                value: state.age.toString(),
                readOnly: !state.isEdit,
                onChanged: !state.isEdit
                    ? (value) {}
                    : (value) =>
                        context.read<DetailCatheBloc>().onChangedAge(value),
              ),
              const Text("Cân nặng :"),
              sizebox20,
              XInput(
                value: state.weight.toString(),
                readOnly: !state.isEdit,
                onChanged: !state.isEdit
                    ? (value) {}
                    : (value) =>
                        context.read<DetailCatheBloc>().onChangedWeigth(value),
              ),
              const Text("Giá :"),
              sizebox20,
              XInput(
                value: state.price.toString(),
                readOnly: !state.isEdit,
                onChanged: !state.isEdit
                    ? (value) {}
                    : (value) =>
                        context.read<DetailCatheBloc>().onChangedPrice(value),
              ),
              const Text(
                "Giới tính",
              ),
              sizebox20,
              XInput(
                value: state.isMale == !state.isEdit ? "Đực" : "Cái",
                readOnly: true,
                onTap: !state.isEdit
                    ? () {}
                    : () => context
                        .read<DetailCatheBloc>()
                        .onChangedSex(!state.isMale),
              ),
              const Text("Video :"),
              sizebox20,
              if (state.isEdit)
                XButton2(
                  icon: Icons.add_box_outlined,
                  text: "Thêm Video Mới",
                  onPressed: () =>
                      context.read<DetailCatheBloc>().onAddVideo(context),
                ),
              if (state.isEdit) sizebox20,
              if (state.videoLink != "")
                GestureDetector(
                  onTap: () => context.read<DetailCatheBloc>().copy(),
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
                      create: (_) => InfoMore1Bloc(state.listInfoMore[i].name,
                          state.listInfoMore[i].description),
                      child: BlocBuilder<InfoMore1Bloc, InfoMore1State>(
                        builder: (context1, infoState) {
                          return Column(
                            key: ValueKey(state.listInfoMore[i].id),
                            children: [
                              Row(
                                children: [
                                  Text("thông tin ${i + 1} :"),
                                  SizedBox(width: 20),
                                  if (state.isEdit)
                                    XButton2(
                                        onPressed: !state.isEdit
                                            ? () {}
                                            : () => context
                                                .read<DetailCatheBloc>()
                                                .removeInfoMore(
                                                    state.listInfoMore[i]),
                                        text: "Xóa",
                                        icon: Icons.delete)
                                ],
                              ),
                              sizebox20,
                              XInput(
                                  value: infoState.name,
                                  hintText: "Tiêu đề",
                                  onChanged: !state.isEdit
                                      ? (value) {}
                                      : (value) {
                                          context1
                                              .read<InfoMore1Bloc>()
                                              .onChangeName(value);
                                          context
                                              .read<DetailCatheBloc>()
                                              .updateNameToListInfoMore(
                                                  state.listInfoMore[i], value);
                                        }),
                              sizebox20,
                              XInput(
                                hintText: "Nội dung",
                                value: infoState.description,
                                onChanged: !state.isEdit
                                    ? (value) {}
                                    : (value) {
                                        context1
                                            .read<InfoMore1Bloc>()
                                            .onChangeDescription(value);
                                        context
                                            .read<DetailCatheBloc>()
                                            .updateDataToListInfoMore(
                                                state.listInfoMore[i], value);
                                      },
                              ),
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
