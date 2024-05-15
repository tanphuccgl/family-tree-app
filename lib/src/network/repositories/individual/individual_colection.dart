import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:familytree/src/network/data_sources/base_data_source.dart';
import 'package:familytree/src/network/model/common/result.dart';
import 'package:familytree/src/network/model/individual_model.dart';

class IndividualCollectionReference
    extends BaseCollectionReference<IndividualModel> {
  IndividualCollectionReference()
      : super(
          FirebaseFirestore.instance
              .collection("Individuals")
              .withConverter<IndividualModel>(
                fromFirestore: ((snapshot, _) =>
                    IndividualModel.fromDocument(snapshot)),
                toFirestore: (model, _) => model.toMap(),
              ),
        );

  Future<XResult<IndividualModel>> getIndividual(String id) async {
    try {
      var snapshot = await ref.where('id', isEqualTo: id).limit(1).get();

      var data = snapshot.docs.first.data();

      return XResult.success(data);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<List<IndividualModel>>> getAllIndividual() async {
    try {
      var snapshot = await ref.get();

      var data = snapshot.docs.map((e) => e.data()).toList();

      return XResult.success(data);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Stream<List<IndividualModel>> getAllIndividualStream() {
    return ref.snapshots().asyncMap<List<IndividualModel>>((event) async {
      try {
        return event.docs.toList().map((e) => e.data()).toList();
      } catch (e) {
        return [];
      }
    });
  }

  Future<XResult<List<IndividualModel>>> getIndividualWithType(
      GenerationEnum value) async {
    try {
      var snapshot = await ref.where('type', isEqualTo: value.nameOf).get();

      var data = snapshot.docs.map((e) => e.data()).toList();

      return XResult.success(data);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<List<IndividualModel>>> getListIndividualWithFather(
      GenerationEnum value) async {
    try {
      var snapshot = await ref
          .where('type', isEqualTo: value.nameOf)
          .where('isMale', isEqualTo: true)
          .get();

      var data = snapshot.docs.map((e) => e.data()).toList();

      return XResult.success(data);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<List<IndividualModel>>> getListIndividualWithMother(
      GenerationEnum value) async {
    try {
      var snapshot = await ref
          .where('type', isEqualTo: value.nameOf)
          .where('isMale', isEqualTo: false)
          .get();

      var data = snapshot.docs.map((e) => e.data()).toList();

      return XResult.success(data);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<List<IndividualModel>>> getIndividualsWithArea(
      String areaId) async {
    try {
      var snapshot = await ref.where('area.id', isEqualTo: areaId).get();

      var data = snapshot.docs.map((e) => e.data()).toList();

      return XResult.success(data);
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
