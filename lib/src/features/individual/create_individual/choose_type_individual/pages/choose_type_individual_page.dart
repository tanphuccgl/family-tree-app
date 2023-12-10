import 'package:familytree/src/features/individual/create_individual/choose_type_individual/logic/choose_type_individual_bloc.dart';
import 'package:familytree/src/network/model/area_model.dart';
import 'package:familytree/src/network/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseTypeIndividualPage extends StatelessWidget {
  final AreaModel area;

  const ChooseTypeIndividualPage({super.key, required this.area});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChooseTypeIndividualBloc(area),
      child: BlocBuilder<ChooseTypeIndividualBloc, ChooseTypeIndividualState>(
        builder: (context, state) {
          return Scaffold(
              body: state.list.isEmpty
                  ? Center(
                      child: Text("danh sách trống"),
                    )
                  : ListView(
                      shrinkWrap: true,
                      children: [
                        item(ProductTypeEnum.f0),
                        item(ProductTypeEnum.f1),
                        item(ProductTypeEnum.f2),
                        item(ProductTypeEnum.f3),
                      ],
                    ));
        },
      ),
    );
  }

  Widget item(ProductTypeEnum type) {
    return BlocBuilder<ChooseTypeIndividualBloc, ChooseTypeIndividualState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => context
              .read<ChooseTypeIndividualBloc>()
              .navigateToCreateIndividual(type),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 2),
            padding: const EdgeInsets.symmetric(vertical: 10),
            color: Colors.grey.shade300,
            child: Column(
              children: [
                Text(
                  "Tên Loại: " + type.labelOf,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
