// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/area_model.dart';
import 'package:familytree/src/network/model/info_more_model.dart';
import 'package:familytree/src/network/model/product_model.dart';
import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

part 'detail_cathe_state.dart';

class DetailCatheBloc extends Cubit<DetailCatheState> {
  final BuildContext context;
  final String id;
  DetailCatheBloc(this.context, this.id) : super(DetailCatheState.ds()) {
    init();
  }

  Domain get domain => GetIt.I<Domain>();

  void init() async {
    await getProduct();
  }

  Future<void> getProduct() async {
    XToast.showLoading();
    final result = await domain.product.getProduct(id);
    if (result.isSuccess) {
      final data = result.data!;
      emit(state.copyWith(
        age: data.age,
        color: data.color,
        date: data.date,
        familyCode: data.id,
        father: data.fatherId,
        mother: data.motherId,
        food: data.food,
        isMale: data.isMale,
        listInfoMore: data.listInfoMore,
        weight: data.weight,
        name: data.name,
        price: data.price,
        review: data.review,
        videoLink: data.videoLink,
        style: data.style,
        type: data.type,
        area: data.area,
        imageNetwork: data.image,
      ));
      XToast.hideLoading();
      return;
    }
    XToast.hideLoading();
  }

  Future<void> deleteProduct(BuildContext context) async {
    XToast.showLoading();
    final result = await domain.product.deleteProduct(id);
    if (result.isSuccess) {
      XToast.success("Xóa thành công");
      XToast.hideLoading();

      Navigator.pop(context, ProductModel(id: ""));
      return;
    }
    XToast.error("Xóa thất bại");
    XToast.hideLoading();
  }

  Future<void> updateProduct() async {
    emit(state.copyWith(isEdit: true));
  }

  void copy() {
    Clipboard.setData(ClipboardData(text: state.videoLink));

    XToast.show("Sao chép");
  }

  void onChangedName(String value) {
    emit(state.copyWith(name: value));
  }

  void onChangedStyle(String value) {
    emit(state.copyWith(style: value));
  }

  void onChangedFood(String value) {
    emit(state.copyWith(food: value));
  }

  void onChangedAge(String value) {
    emit(state.copyWith(age: int.tryParse(value) ?? 0));
  }

  void onChangedWeigth(String value) {
    emit(state.copyWith(weight: double.tryParse(value) ?? 0));
  }

  void onChangedPrice(String value) {
    emit(state.copyWith(price: double.tryParse(value) ?? 0));
  }

  void onChangedReview(String value) {
    emit(state.copyWith(review: value));
  }

  void onChangedColor(String value) {
    emit(state.copyWith(color: value));
  }

  void onChangedSex(bool value) {
    emit(state.copyWith(isMale: value));
  }

  void onConfirmButton() async {
    if (state.name.isEmpty) {
      XToast.error("Vui lòng nhập thông tin bắt buộc");
      return;
    }

    bool hasMissingData = state.listInfoMore
        .any((person) => person.name == "" || person.description == "");
    if (hasMissingData) {
      XToast.error("Vui lòng nhập thông tin thêm");
      return;
    }

    XToast.showLoading();

    final product = ProductModel(
      age: state.age,
      color: state.color,
      date: state.date,
      isMale: state.isMale,
      name: state.name,
      price: state.price,
      review: state.review,
      videoLink: state.videoLink,
      weight: state.weight,
      id: state.familyCode,
      type: state.type,
      image: state.imageNetwork,
      area: state.area,
      motherId: state.mother,
      fatherId: state.father,
      food: state.food,
      style: state.style,
      updateAt: Timestamp.now(),
      listInfoMore: state.listInfoMore,
    );

    final result = await domain.product.createProduct(product);
    if (result.isSuccess) {
      XToast.success("Cập nhật cá thể thành công");
      XToast.hideLoading();
      Navigator.pop(context, ProductModel(id: ""));
      return;
    }

    XToast.error("Cập nhật cá thể thất bại");
    XToast.hideLoading();
    Navigator.pop(context);
  }

  Future<void> onAddImage(BuildContext context) async {
    XToast.showLoading();
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: [
          'png',
          'jpg',
          'jpeg',
        ]);
    if (result == null) {
      XToast.hideLoading();
      return;
    }

    final url = await uploadImage(result.files.first) ?? "";
    if (url != "") {
      emit(state.copyWith(imageNetwork: url));
      XToast.hideLoading();
      return;
    }
    XToast.hideLoading();
  }

  Future<void> onAddVideo(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: [
          'mp4',
          'mov',
          'MOV',
        ]);
    if (result == null) return;
    XToast.showLoading();
    final url = await uploadVideo(result.files.first);
    XToast.hideLoading();
    emit(state.copyWith(videoLink: url));
  }

  static Future<String?> uploadImage(PlatformFile file) async {
    final storageRef = FirebaseStorage.instance.ref();

    final Reference groupsRef = storageRef;

    try {
      final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': file.hashCode.toString()},
      );
      final uploadTask = await groupsRef
          .child(file.name.toString())
          .putData(file.bytes!, metadata);

      return uploadTask.ref.getDownloadURL();
    } catch (error) {
      debugPrint(error.toString());
      return null;
    }
  }

  static Future<String?> uploadVideo(PlatformFile file) async {
    final storageRef = FirebaseStorage.instance.ref();

    final Reference groupsRef = storageRef;

    try {
      final metadata = SettableMetadata(
        contentType: 'video/mp4',
        customMetadata: {'picked-file-path': file.hashCode.toString()},
      );
      final uploadTask = await groupsRef
          .child(file.name.toString())
          .putData(file.bytes!, metadata);

      return uploadTask.ref.getDownloadURL();
    } catch (error) {
      debugPrint(error.toString());
      return null;
    }
  }

  void addInfoMore() {
    emit(state.copyWith(
        listInfoMore: [...state.listInfoMore, InfoMoreModel(id: Uuid().v4())]));
    print(state.listInfoMore);
  }

  void removeInfoMore(InfoMoreModel data) {
    final list = [...state.listInfoMore];
    list.remove(data);

    emit(state.copyWith(listInfoMore: list));
  }

  void updateNameToListInfoMore(InfoMoreModel data, String name) {
    state.listInfoMore.forEach((person) {
      if (person.id == data.id) {
        person.name = name;
      }
    });

    emit(state.copyWith(listInfoMore: [
      ...state.listInfoMore,
    ]));
  }

  void updateDataToListInfoMore(InfoMoreModel data, String noidung) {
    state.listInfoMore.forEach((person) {
      if (person.id == data.id) {
        person.description = noidung;
      }
    });

    emit(state.copyWith(listInfoMore: [
      ...state.listInfoMore,
    ]));
  }

  @override
  Future<void> close() {
    XToast.hideLoading();
    return super.close();
  }
}
