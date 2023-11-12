import 'package:familytree/src/features/detail_cathe/pages/detail_cathe_page.dart';
import 'package:familytree/src/network/model/product_model.dart';
import 'package:familytree/src/router/coordinator.dart';
import 'package:flutter/material.dart';

class ItemElementWidget extends StatelessWidget {
  final ProductModel data;
  const ItemElementWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        XCoordinator.push(DetailCathePage(id: data.id));
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: "ID: ",
                  style: const TextStyle(
                    color: Colors.black, // Màu chữ của "Tên"
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: data.id,
                      style: const TextStyle(
                        color: Colors.red, // Màu chữ của "*"
                      ),
                    ),
                  ],
                ),
              ),
              data.isMale
                  ? const Icon(
                      Icons.male,
                      color: Colors.blue,
                    )
                  : const Icon(
                      Icons.female,
                      color: Colors.yellow,
                    )
            ],
          ),
          data.isMale
              ? Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.blue,
                  ),
                  child: Text(data.name))
              : Container(
                  padding: const EdgeInsets.all(30),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.yellow,
                  ),
                  child: Text(data.name)),
        ],
      ),
    );
  }
}
