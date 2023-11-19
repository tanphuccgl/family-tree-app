import 'package:familytree/src/features/area/pages/area_page.dart';
import 'package:familytree/src/features/create_cathe/pages/create_cathe_page.dart';
import 'package:familytree/src/features/family_tree/pages/family_tree_page.dart';
import 'package:familytree/src/features/list_cathe/pages/list_cathe_page.dart';
import 'package:flutter/material.dart';

enum ItemDrawerEnum {
  create,
  tree,
  list,
  area;

  String get title {
    switch (this) {
      case create:
        return "Tạo cá thể";
      case tree:
        return "Family tree";
      case list:
        return "Danh sách cá thể";
      case area:
        return "Khu vực";
    }
  }

  Widget get pages {
    switch (this) {
      case create:
        return CreateCathePage();
      case tree:
        return TreeViewPage();
      case list:
        return ListCaThePage();
      case area:
        return AreaPage();
    }
  }
}
