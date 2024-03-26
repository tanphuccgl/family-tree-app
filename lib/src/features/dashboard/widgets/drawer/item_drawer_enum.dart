import 'package:familytree/src/config/constants/images.dart';

enum ItemDrawerEnum {
  tree,
  list,
  copulate,
  area,
  origin,
  female;

  String get title {
    switch (this) {
      case tree:
        return "Family tree";
      case list:
        return "Cá thể";
      case copulate:
        return "Phối giống";
      case area:
        return "Khu vực";
      case origin:
        return "Xuất xứ";
      case female:
        return "Lứa cái";
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
      case female:
        return XImage.femenine;
    }
  }
}
