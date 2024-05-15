import 'package:familytree/src/network/model/common/result.dart';
import 'package:familytree/src/network/model/individual_model.dart';

abstract class IndividualRepository {
  Future<XResult<IndividualModel>> createIndividual(IndividualModel data);

  Future<XResult<bool>> updateIndividual({
    required String individualId,
    required Map<String, dynamic> item,
  });

  Future<XResult<IndividualModel>> getIndividual(String id);

  Future<XResult<String>> deleteIndividual(String id);

  Future<XResult<List<IndividualModel>>> getAllIndividual();
  Stream<List<IndividualModel>> getAllIndividualStream();

  Future<XResult<List<IndividualModel>>> getIndividualWithType(
      GenerationEnum value);

  Future<XResult<List<IndividualModel>>> getIndividualsWithArea(String areaId);
}
