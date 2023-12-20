import 'package:familytree/src/features/family_tree/logic/family_tree_bloc.dart';
import 'package:familytree/src/network/model/individual_model.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemElementWidget extends StatelessWidget {
  final IndividualModel data;
  const ItemElementWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.read<FamilyTreeBloc>().onSelectIndividual(context, data.id),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: data.type.labelOf,
                  style: const TextStyle(
                    color: XColors.primary4,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: " - ",
                      style: const TextStyle(
                        color: XColors.primary5,
                      ),
                    ),
                    TextSpan(
                      text: data.id,
                      style: const TextStyle(
                        color: Colors.red,
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
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.blue,
                      image: DecorationImage(
                        image: NetworkImage(data.image),
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.dstATop),
                      )),
                  child: Center(
                    child: Text(
                      data.name,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        color: XColors.primary8,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ))
              : Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                      image: DecorationImage(
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.5), BlendMode.dstATop),
                          image: NetworkImage(data.image))),
                  child: Center(
                    child: Text(
                      data.name,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        color: XColors.primary8,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )),
        ],
      ),
    );
  }
}
