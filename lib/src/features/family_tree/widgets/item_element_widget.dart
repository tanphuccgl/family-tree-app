import 'package:familytree/src/features/family_tree/logic/family_tree_bloc.dart';
import 'package:familytree/src/network/model/individual_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemElementWidget extends StatelessWidget {
  final IndividualModel data;
  const ItemElementWidget({super.key, required this.data});

  String getFirstImage(List<String> image) {
    if (image.isNotEmpty) {
      return image.first;
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.read<FamilyTreeBloc>().onSelectIndividual(context, data.id),
      onLongPressStart: (details) =>
          context.read<FamilyTreeBloc>().onEnterHover(
                context,
                individual: data,
                position: details.localPosition,
              ),
      onLongPressEnd: (_) => context.read<FamilyTreeBloc>().onExitHover(),
      child: MouseRegion(
        onEnter: (details) => context.read<FamilyTreeBloc>().onEnterHover(
              context,
              individual: data,
              position: details.position,
            ),
        onExit: (_) => context.read<FamilyTreeBloc>().onExitHover(),
        child: Column(
          key: ValueKey(data.id),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: data.type.labelOf,
                    style: const TextStyle(
                      color: Color(0xff000000),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: " - ",
                        style: const TextStyle(
                          color: Color(0xff000000),
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
                    ? Icon(Icons.male, color: Colors.blue)
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
                        color: data.type == GenerationEnum.f0
                            ? Color(0xfffff6e3)
                            : (data.type == GenerationEnum.f1
                                ? Color(0xffE8f2fc)
                                : Color(0xffafc4f8)),
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                        image: DecorationImage(
                          image: NetworkImage(getFirstImage(data.image)),
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
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ))
                : Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: data.type == GenerationEnum.f0
                            ? Color(0xfffff6e3)
                            : (data.type == GenerationEnum.f1
                                ? Color(0xffE8f2fc)
                                : Color(0xffafc4f8)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                        image: DecorationImage(
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(0.5),
                                BlendMode.dstATop),
                            image: NetworkImage(getFirstImage(data.image)))),
                    child: Center(
                      child: Text(
                        data.name,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}
