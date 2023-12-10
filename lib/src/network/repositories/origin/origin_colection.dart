import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:familytree/src/network/data_sources/base_data_source.dart';
import 'package:familytree/src/network/model/common/result.dart';
import 'package:familytree/src/network/model/origin_model.dart';

class OriginCollectionReference extends BaseCollectionReference<OriginModel> {
  OriginCollectionReference()
      : super(
          FirebaseFirestore.instance
              .collection("Origins")
              .withConverter<OriginModel>(
                fromFirestore: ((snapshot, _) =>
                    OriginModel.fromDocument(snapshot)),
                toFirestore: (model, _) => model.toMap(),
              ),
        );

  Future<XResult<OriginModel>> getOriginWithNameId(String id) async {
    try {
      var snapshot = await ref.where('nameId', isEqualTo: id).limit(1).get();

      var data = snapshot.docs.first.data();

      return XResult.success(data);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<OriginModel>> getOriginWithId(String id) async {
    try {
      var snapshot = await ref.where('id', isEqualTo: id).limit(1).get();

      var data = snapshot.docs.first.data();

      return XResult.success(data);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<List<OriginModel>>> getAllOrigin() async {
    try {
      var snapshot = await ref.get();

      var data = snapshot.docs.map((e) => e.data()).toList();

      return XResult.success(data);
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
