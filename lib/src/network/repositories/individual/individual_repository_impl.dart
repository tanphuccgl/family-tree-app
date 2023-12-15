import 'package:familytree/src/network/model/common/result.dart';
import 'package:familytree/src/network/model/individual_model.dart';

import 'package:familytree/src/network/repositories/individual/individual_colection.dart';
import 'package:familytree/src/network/repositories/individual/individual_repository.dart';

class IndividualRepositoryImpl extends IndividualRepository {
  final reference = IndividualCollectionReference();

  @override
  Future<XResult<IndividualModel>> createIndividual(
      IndividualModel data) async {
    return reference.set(data);
  }

  @override
  Future<XResult<bool>> updateIndividual({
    required String individualId,
    required Map<String, dynamic> item,
  }) async =>
      reference.update(individualId, item);

  @override
  Future<XResult<IndividualModel>> getIndividual(String id) async {
    return reference.getIndividual(id);
  }

  @override
  Future<XResult<String>> deleteIndividual(String id) async {
    return reference.remove(id);
  }

  @override
  Future<XResult<List<IndividualModel>>> getAllIndividual() async {
    return reference.getAllIndividual();
  }

  @override
  Future<XResult<List<IndividualModel>>> getIndividualWithType(
      GenerationEnum value) async {
    return reference.getIndividualWithType(value);
  }

  @override
  Future<XResult<List<IndividualModel>>> getIndividualsWithArea(
      String areaId) async {
    return reference.getIndividualsWithArea(areaId);
  }
}
