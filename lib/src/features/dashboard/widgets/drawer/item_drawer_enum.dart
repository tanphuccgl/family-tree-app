import 'package:familytree/src/config/constants/images.dart';

import 'package:familytree/src/features/area/wrapper_area_page.dart';
import 'package:familytree/src/features/copulate/pages/wrapper_copulate_page.dart';

import 'package:familytree/src/features/family_tree/pages/family_tree_page.dart';
import 'package:familytree/src/features/individual/list_cathe/pages/list_cathe_page.dart';
import 'package:familytree/src/features/origin/wrapper_origin_page.dart';

import 'package:flutter/material.dart';

enum ItemDrawerEnum {
  tree,
  list,
  copulate,
  area,
  origin;

  String get title {
    switch (this) {
      case tree:
        return "Family tree";
      case list:
        return "Danh sách cá thể";
      case copulate:
        return "Phối giống";
      case area:
        return "Khu vực";
      case origin:
        return "Xuất xứ";
    }
  }

  String get icon {
    switch (this) {
      case tree:
        return XImage.familyTree;
      case list:
        return XImage.individual;
      case area:
        return XImage.area;
      case copulate:
        return XImage.copulate;
      case origin:
        return XImage.origin;
    }
  }

  Widget get pages {
    switch (this) {
      case copulate:
        return WrapperCopulatePage();
      case tree:
        return TreeViewPage();
      case list:
        return ListCaThePage();
      case area:
        return WrapperAreaPage();
      case origin:
        return WrapperOriginPage();
    }
  }
}
