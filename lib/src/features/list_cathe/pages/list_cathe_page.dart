import 'package:familytree/src/features/detail_cathe/pages/detail_cathe_page.dart';
import 'package:familytree/src/features/list_cathe/logic/list_cathe_bloc.dart';
import 'package:familytree/src/network/model/product_model.dart';

import 'package:familytree/src/router/coordinator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCaThePage extends StatelessWidget {
  const ListCaThePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListCatheBloc(),
      child: BlocBuilder<ListCatheBloc, ListCatheState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      title(
                        "Số thứ tự",
                      ),
                      title(
                        "Family code",
                      ),
                      title(
                        "Tên",
                      ),
                      title(
                        "Nguồn thức ăn",
                      ),
                      title(
                        "Kiểu cách",
                      ),
                      title(
                        "xuất xứ",
                      ),
                      title(
                        "Cha",
                      ),
                      title(
                        "Mẹ",
                      ),
                      title("Giới tính"),
                      title("Ngày sinh"),
                      title("Cân nặng"),
                      title("Tuổi"),
                      title("Giá"),
                      title("Màu"),
                      title("Loại"),
                      title("Ảnh"),
                      title("Video"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.list.length,
                    itemBuilder: (context, index) {
                      return item(state.list[index], index);
                    },
                  ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget title(String title) {
    return Expanded(
      child: Text(
        title,
        maxLines: 2,
        textAlign: TextAlign.center,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget labelData(String title) {
    return Expanded(
      child: Text(
        title,
        maxLines: 2,
        textAlign: TextAlign.center,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
      ),
    );
  }

  Widget item(ProductModel value, int index) {
    return GestureDetector(
      onTap: () {
        XCoordinator.push(DetailCathePage(id: value.id));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: index % 2 == 0 ? Colors.grey.shade100 : Colors.grey.shade300,
        child: Row(
          children: [
            labelData(
              (index + 1).toString(),
            ),
            labelData(
              value.id,
            ),
            labelData(value.name),
            labelData(value.food),
            labelData(value.style),
            labelData(value.area?.nameId ?? ""),
            labelData(value.fatherId),
            labelData(value.motherId),
            labelData(
              value.isMale == true ? "Đực" : "Cái",
            ),
            labelData(value.date),
            labelData(value.weight.toString()),
            labelData(value.age.toString()),
            labelData(value.price.toString()),
            labelData(value.color),
            labelData(value.type.nameOf),
            value.image == ""
                ? const Expanded(
                    child: SizedBox(),
                  )
                : Expanded(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.network(
                        value.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
            value.videoLink == ""
                ? const Expanded(
                    child: SizedBox(),
                  )
                : const Expanded(
                    child: Text(
                      "Link",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
