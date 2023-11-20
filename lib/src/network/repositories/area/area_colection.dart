import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:familytree/src/network/data_sources/base_data_source.dart';
import 'package:familytree/src/network/model/area_model.dart';
import 'package:familytree/src/network/model/common/result.dart';

class AreaCollectionReference extends BaseCollectionReference<AreaModel> {
  AreaCollectionReference()
      : super(
          FirebaseFirestore.instance
              .collection("Areas")
              .withConverter<AreaModel>(
                fromFirestore: ((snapshot, _) =>
                    AreaModel.fromDocument(snapshot)),
                toFirestore: (model, _) => model.toMap(),
              ),
        );

  Future<XResult<AreaModel>> getAreaWithNameId(String id) async {
    try {
      var snapshot = await ref.where('nameId', isEqualTo: id).limit(1).get();

      var data = snapshot.docs.first.data();

      return XResult.success(data);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<AreaModel>> getAreaWithId(String id) async {
    try {
      var snapshot = await ref.where('id', isEqualTo: id).limit(1).get();

      var data = snapshot.docs.first.data();

      return XResult.success(data);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<List<AreaModel>>> getAllArea() async {
    try {
      var snapshot = await ref.get();

      var data = snapshot.docs.map((e) => e.data()).toList();

      return XResult.success(data);
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
