import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:familytree/src/network/data_sources/base_data_source.dart';
import 'package:familytree/src/network/model/common/result.dart';
import 'package:familytree/src/network/model/product_model.dart';

class ProductCollectionReference extends BaseCollectionReference<ProductModel> {
  ProductCollectionReference()
      : super(
          FirebaseFirestore.instance
              .collection("Products")
              .withConverter<ProductModel>(
                fromFirestore: ((snapshot, _) =>
                    ProductModel.fromDocument(snapshot)),
                toFirestore: (model, _) => model.toMap(),
              ),
        );

  Future<XResult<ProductModel>> getProduct(String id) async {
    try {
      var snapshot = await ref.where('id', isEqualTo: id).limit(1).get();

      var data = snapshot.docs.first.data();

      return XResult.success(data);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<List<ProductModel>>> getAllProduct() async {
    try {
      var snapshot = await ref.get();

      var data = snapshot.docs.map((e) => e.data()).toList();

      return XResult.success(data);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<List<ProductModel>>> getProductWithType(
      ProductTypeEnum value) async {
    try {
      var snapshot = await ref.where('type', isEqualTo: value.nameOf).get();

      var data = snapshot.docs.map((e) => e.data()).toList();

      return XResult.success(data);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<List<ProductModel>>> getListProductWithFather(
      ProductTypeEnum value) async {
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

  Future<XResult<List<ProductModel>>> getListProductWithMother(
      ProductTypeEnum value) async {
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

  Future<XResult<List<ProductModel>>> getProductsWithArea(String areaId) async {
    try {
      var snapshot = await ref.where('area.id', isEqualTo: areaId).get();

      var data = snapshot.docs.map((e) => e.data()).toList();

      return XResult.success(data);
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
