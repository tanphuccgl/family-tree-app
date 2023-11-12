import 'package:equatable/equatable.dart';
import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/product_model.dart';
import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'create_cathe_state.dart';

class CreateCatheBloc extends Cubit<CreateCatheState> {
  CreateCatheBloc() : super(CreateCatheState.ds());

  Domain get domain => GetIt.I<Domain>();

  void init() {
    getProductWithType();
  }

  void getProductWithType() async {
    ProductTypeEnum? typeQuery;
    switch (state.type) {
      case ProductTypeEnum.f0:
        break;
      case ProductTypeEnum.f1:
        typeQuery = ProductTypeEnum.f0;
        break;
      case ProductTypeEnum.f2:
        typeQuery = ProductTypeEnum.f1;
        break;
      case ProductTypeEnum.f3:
        typeQuery = ProductTypeEnum.f2;
        break;
    }
    if (typeQuery == null) {
      return;
    }

    final result = await domain.product.getProductWithType(typeQuery);
    if (result.isSuccess) {
      emit(state.copyWith(
        productSuggest: result.data,
        fromFamilyCode: result.data!.first,
      ));
    }
  }

  void checkIdExist() async {
    final result = await domain.product.getProduct(state.familyCode);
    if (result.isSuccess) {
      emit(state.copyWith(isFamilyCodeExist: true));
      return;
    }
    emit(state.copyWith(isFamilyCodeExist: false));
  }

  void onChangedName(String value) {
    emit(state.copyWith(name: value));
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

  void onChangedFamilyCode(String value) {
    emit(state.copyWith(familyCode: value));
    checkIdExist();
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

  void onChangedFromFamilyCode(ProductModel value) {
    emit(state.copyWith(fromFamilyCode: value));
  }

  void onChangedType(ProductTypeEnum value) {
    emit(state.copyWith(type: value));

    emit(state.copyWith(productSuggest: []));
    getProductWithType();
  }

  void createNewProduct() async {
    if (state.isFamilyCodeExist) {
      XToast.error("Mã đã tồn tại");
      return;
    }

    if (state.name.isEmpty || state.familyCode.isEmpty) {
      XToast.error("Vui lòng nhập thông tin bắt buộc");
      return;
    }

    XToast.showLoading();

    String url = "";
    if (state.imageFile != null) {
      url = await uploadImage(state.imageFile!) ?? "";
    }

    final product = ProductModel(
      age: state.age,
      color: state.color,
      date: state.date,
      fromId: state.fromFamilyCode.id,
      isMale: state.isMale,
      name: state.name,
      price: state.price,
      review: state.review,
      videoLink: state.video,
      weight: state.weight,
      id: state.familyCode,
      type: state.type,
      image: url,
    );

    final result = await domain.product.createProduct(product);
    if (result.isSuccess) {
      emit(CreateCatheState.ds());
      XToast.success("Tạo mới cá thể thành công");
      XToast.hideLoading();
      return;
    }
    emit(CreateCatheState.ds());
    XToast.error("Tạo cá thể thất bại");
    XToast.hideLoading();
  }

  Future<void> onAddImage(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: [
          'png',
          'jpg',
          'jpeg',
        ]);
    if (result == null) return;

    emit(state.copyWith(imageFile: result.files.first));
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
    emit(state.copyWith(video: url));
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

  @override
  Future<void> close() {
    XToast.hideLoading();
    return super.close();
  }
}
