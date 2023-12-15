import 'package:familytree/src/network/repositories/area/area_repository.dart';
import 'package:familytree/src/network/repositories/area/area_repository_impl.dart';
import 'package:familytree/src/network/repositories/origin/origin_repository.dart';
import 'package:familytree/src/network/repositories/origin/origin_repository_impl.dart';
import 'package:familytree/src/network/repositories/individual/individual_repository.dart';

import 'repositories/individual/individual_repository_impl.dart';

class Domain {
  static Domain? _internal;
  factory Domain() {
    _internal ??= Domain._();

    return _internal!;
  }
  late IndividualRepository individual;
  late AreaRepository area;
  late OriginRepository origin;

  Domain._() {
    individual = IndividualRepositoryImpl();
    area = AreaRepositoryImpl();
    origin = OriginRepositoryImpl();
  }
}
