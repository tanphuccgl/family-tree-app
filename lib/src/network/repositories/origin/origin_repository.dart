import 'package:familytree/src/network/model/common/result.dart';
import 'package:familytree/src/network/model/origin_model.dart';

abstract class OriginRepository {
  Future<XResult<OriginModel>> createOrigin(OriginModel data);

  Future<XResult<bool>> updateOrigin({
    required String originId,
    required Map<String, dynamic> item,
  });

  Future<XResult<OriginModel>> getOriginWithNameId(String id);

  Future<XResult<OriginModel>> getOriginWithId(String id);

  Future<XResult<String>> deleteOrigin(String id);

  Future<XResult<List<OriginModel>>> getAllOrigin();
}
