import 'package:familytree/src/network/repositories/area/area_repository.dart';
import 'package:familytree/src/network/repositories/area/area_repository_impl.dart';
import 'package:familytree/src/network/repositories/product/product_repository.dart';

import 'repositories/product/product_repository_impl.dart';

class Domain {
  static Domain? _internal;
  factory Domain() {
    _internal ??= Domain._();

    return _internal!;
  }
  late ProductRepository product;
  late AreaRepository area;

  Domain._() {
    product = ProductRepositoryImpl();
    area = AreaRepositoryImpl();
  }
}
