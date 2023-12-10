import 'package:familytree/src/network/model/common/result.dart';
import 'package:familytree/src/network/model/origin_model.dart';
import 'package:familytree/src/network/repositories/origin/origin_colection.dart';

import 'package:familytree/src/network/repositories/origin/origin_repository.dart';

class OriginRepositoryImpl extends OriginRepository {
  final reference = OriginCollectionReference();

  @override
  Future<XResult<OriginModel>> createOrigin(OriginModel data) async {
    return reference.set(data);
  }

  @override
  Future<XResult<bool>> updateOrigin({
    required String productId,
    required Map<String, dynamic> item,
  }) async =>
      reference.update(productId, item);

  @override
  Future<XResult<OriginModel>> getOriginWithNameId(String id) async {
    return reference.getOriginWithNameId(id);
  }

  @override
  Future<XResult<OriginModel>> getOriginWithId(String id) async {
    return reference.getOriginWithId(id);
  }

  @override
  Future<XResult<String>> deleteOrigin(String id) async {
    return reference.remove(id);
  }

  @override
  Future<XResult<List<OriginModel>>> getAllOrigin() async {
    return reference.getAllOrigin();
  }
}
