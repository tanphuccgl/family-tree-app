import 'package:familytree/src/network/model/area_model.dart';
import 'package:familytree/src/network/model/common/result.dart';
import 'package:familytree/src/network/repositories/area/area_colection.dart';
import 'package:familytree/src/network/repositories/area/area_repository.dart';

class AreaRepositoryImpl extends AreaRepository {
  final reference = AreaCollectionReference();

  @override
  Future<XResult<AreaModel>> createArea(AreaModel data) async {
    return reference.set(data);
  }

  @override
  Future<XResult<bool>> updateArea({
    required String productId,
    required Map<String, dynamic> item,
  }) async =>
      reference.update(productId, item);

  @override
  Future<XResult<AreaModel>> getAreaWithNameId(String id) async {
    return reference.getAreaWithNameId(id);
  }

  @override
  Future<XResult<AreaModel>> getAreaWithId(String id) async {
    return reference.getAreaWithId(id);
  }

  @override
  Future<XResult<String>> deleteArea(String id) async {
    return reference.remove(id);
  }

  @override
  Future<XResult<List<AreaModel>>> getAllArea() async {
    return reference.getAllArea();
  }
}
