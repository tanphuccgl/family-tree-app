import 'package:familytree/src/features/family_tree/logic/family_tree_bloc.dart';
import 'package:familytree/src/network/model/individual_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemElementWidget extends StatelessWidget {
  final IndividualModel data;
  const ItemElementWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<FamilyTreeBloc>().moveToItem(data.id),
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
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.blue,
                      image: DecorationImage(
                        image: NetworkImage(data.image),
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.dstATop),
                      )),
                  child: Text(data.name))
              : Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                      image: DecorationImage(
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.5), BlendMode.dstATop),
                          image: NetworkImage(data.image))),
                  child: Text(data.name)),
        ],
      ),
    );
  }
}
