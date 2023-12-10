import 'package:familytree/src/features/origin/list_origin/logic/origin_bloc.dart';
import 'package:familytree/src/network/model/origin_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemOrigin extends StatelessWidget {
  final OriginModel data;
  final int index;
  const ItemOrigin({super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<OriginBloc>().moveToDetailOrigin(data.id),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: index % 2 == 0 ? Colors.grey.shade100 : Colors.grey.shade300,
        child: Column(
          children: [
            Text(
              "Tên xuất xứ: " + data.name,
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "Mã xuất xứ: " + data.nameId,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
