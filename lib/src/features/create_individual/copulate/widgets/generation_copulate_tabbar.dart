import 'package:familytree/src/features/create_individual/copulate/logic/copulate_bloc.dart';
import 'package:familytree/src/network/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenerationCopulateTabbar extends StatelessWidget {
  const GenerationCopulateTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CopulateBloc, CopulateState>(
      builder: (context, state) {
        return Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Thế hệ: ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(height: 20),
            Row(
              children: [
                item(ProductTypeEnum.f0),
                item(ProductTypeEnum.f1),
                item(ProductTypeEnum.f2),
                item(ProductTypeEnum.f3),
              ],
            )
          ],
        );
      },
    );
  }

  Widget item(ProductTypeEnum type) {
    return BlocBuilder<CopulateBloc, CopulateState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () =>
              context.read<CopulateBloc>().onChangeGenerationSelected(type),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text("Thế hệ ${type.labelOf}"),
          ),
        );
      },
    );
  }
}
