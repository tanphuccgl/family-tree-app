import 'package:familytree/src/network/model/product_model.dart';
import 'package:flutter/material.dart';

class IndividualItemWidget extends StatelessWidget {
  final ProductModel data;
  const IndividualItemWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text("Tên: ${data.name}"),
    );
  }
}
