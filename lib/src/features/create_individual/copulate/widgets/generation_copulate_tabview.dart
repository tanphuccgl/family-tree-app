import 'package:familytree/src/features/create_individual/copulate/logic/copulate_bloc.dart';
import 'package:familytree/src/features/create_individual/copulate/widgets/individual_item_widget.dart';
import 'package:familytree/widgets/button/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenerationCopulateTabView extends StatelessWidget {
  const GenerationCopulateTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CopulateBloc, CopulateState>(
      builder: (context, state) {
        return state.listIndividualCurrent.isEmpty
            ? Text("không có dữ liệu")
            : Expanded(
                child: Column(
                  children: [
                    individualList(),
                    resultCopulate(),
                  ],
                ),
              );
      },
    );
  }

  Widget resultCopulate() {
    return BlocBuilder<CopulateBloc, CopulateState>(
      builder: (context, state) {
        return Column(
          children: [
            Text("Kết quả chọn"),
            Row(
              children: [
                if (state.maleSelected != null)
                  Text("Đực : ${state.maleSelected!.name}"),
                Icon(Icons.favorite),
                if (state.femaleSelected != null)
                  Text("Cái : ${state.femaleSelected!.name}"),
              ],
            ),
            XButton(
                onPressed: () =>
                    context.read<CopulateBloc>().onButtonCopulate(),
                text: "Xác nhận phối")
          ],
        );
      },
    );
  }

  Widget individualList() {
    return Expanded(
      child: Row(
        children: [
          maleList(),
          femaleList(),
        ],
      ),
    );
  }

  Widget femaleList() {
    return BlocBuilder<CopulateBloc, CopulateState>(
      builder: (context, state) {
        final list = state.listFemaleIndividual;
        final size = MediaQuery.of(context).size;
        return SizedBox(
          width: size.width / 3,
          height: 300,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () => context
                      .read<CopulateBloc>()
                      .onSelectFemaleIndividual(list[index]),
                  child: IndividualItemWidget(data: list[index]));
            },
          ),
        );
      },
    );
  }

  Widget maleList() {
    return BlocBuilder<CopulateBloc, CopulateState>(
      builder: (context, state) {
        final list = state.listMaleIndividual;
        final size = MediaQuery.of(context).size;
        return SizedBox(
          width: size.width / 3,
          height: 300,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () => context
                      .read<CopulateBloc>()
                      .onSelectMaleIndividual(list[index]),
                  child: IndividualItemWidget(data: list[index]));
            },
          ),
        );
      },
    );
  }
}
