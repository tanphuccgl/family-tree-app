import 'package:familytree/src/network/model/area_model.dart';
import 'package:familytree/src/network/model/common/result.dart';

abstract class AreaRepository {
  Future<XResult<AreaModel>> createArea(AreaModel data);

  Future<XResult<bool>> updateArea({
    required String productId,
    required Map<String, dynamic> item,
  });

  Future<XResult<AreaModel>> getAreaWithNameId(String id);

  Future<XResult<AreaModel>> getAreaWithId(String id);

  Future<XResult<String>> deleteArea(String id);

  Future<XResult<List<AreaModel>>> getAllArea();
}
