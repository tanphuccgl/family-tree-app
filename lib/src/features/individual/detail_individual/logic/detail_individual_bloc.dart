import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/area_model.dart';
import 'package:familytree/src/network/model/info_more_model.dart';
import 'package:familytree/src/network/model/origin_model.dart';
import 'package:familytree/src/network/model/individual_model.dart';
import 'package:familytree/src/router/app_router.gr.dart';

import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

part 'detail_individual_state.dart';

class DetailIndividualBloc extends Cubit<DetailIndividualState> {
  final BuildContext context;
  final String individualId;
  DetailIndividualBloc(this.context, this.individualId)
      : super(DetailIndividualState()) {
    init();
  }

  Domain get domain => GetIt.I<Domain>();

  void init() async {
    await getIndividual();
  }

  Future<void> getIndividual() async {
    XToast.showLoading();
    final result = await domain.individual.getIndividual(individualId);
    if (result.isSuccess) {
      final data = result.data!;
      emit(state.copyWith(
        name: data.name,
        age: data.age.toString(),
        area: data.area,
        color: data.color,
        date: data.date,
        familyCode: data.id,
        food: data.food,
        image: data.image,
        isMale: data.isMale,
        type: data.type,
        origin: data.origin,
        price: data.price.toString(),
        review: data.review,
        style: data.style,
        video: data.videoLink,
        weight: data.weight.toString(),
        listFieldInfo: data.listInfoMore,
        listCopulateId: data.listCopulateId,
      ));
      final resultFather = await domain.individual.getIndividual(data.fatherId);
      if (resultFather.isSuccess) {
        emit(state.copyWith(father: resultFather.data));
      }
      final resultMother = await domain.individual.getIndividual(data.motherId);
      if (resultMother.isSuccess) {
        emit(state.copyWith(mother: resultMother.data));
      }
      XToast.hideLoading();
      return;
    }

    XToast.error("Không thể lấy dữ liệu");

    XToast.hideLoading();
    onCloseButton();
  }

  void onCancelButton() {
    emit(DetailIndividualState());
    getIndividual();
  }

  void createNewIndividual() async {
    if (state.name.isEmpty) {
      XToast.error("Vui lòng nhập tên");
      return;
    }

    if (state.familyCode.isEmpty) {
      XToast.error("Vui lòng nhập family code");
      return;
    }

    if (state.origin == null) {
      XToast.error("Vui lòng chọn xuất xứ");
      return;
    }

    bool hasMissingData = state.listFieldInfo
        .any((person) => person.name == "" || person.description == "");
    if (hasMissingData) {
      XToast.error("Vui lòng nhập đầy đủ thông tin thêm");
      return;
    }

    if (state.isFamilyCodeExist) {
      XToast.error("Mã đã tồn tại");
      return;
    }

    XToast.showLoading();

    final model = IndividualModel(
      isMale: state.isMale,
      name: state.name,
      id: state.familyCode,
      type: state.type!,
      area: state.area,
      fatherId: state.father?.id ?? "",
      motherId: state.mother?.id ?? "",
      updateAt: Timestamp.now(),
      createAt: Timestamp.now(),
      age: int.tryParse(state.age) ?? 0,
      color: state.color,
      date: state.date,
      listInfoMore: state.listFieldInfo,
      food: state.food,
      image: state.image,
      price: double.tryParse(state.price) ?? 0,
      review: state.review,
      style: state.style,
      videoLink: state.video,
      weight: double.tryParse(state.weight) ?? 0,
      origin: state.origin,
      listCopulateId: state.listCopulateId,
    );

    final result = await domain.individual.createIndividual(model);
    if (result.isSuccess) {
      emit(DetailIndividualState());
      XToast.success("Chỉnh sửa thành công");
      XToast.hideLoading();
      onCloseButton();
      return;
    }
    emit(DetailIndividualState());
    XToast.error("Chỉnh sửa thất bại");
    XToast.hideLoading();
    onCloseButton();
  }

  Future<void> deleteIndividual() async {
    XToast.showLoading();
    final result = await domain.individual.deleteIndividual(individualId);
    if (result.isSuccess) {
      emit(DetailIndividualState());
      XToast.success("Xóa thành công");
      XToast.hideLoading();
      onCloseButton();
      return;
    }
    emit(DetailIndividualState());
    XToast.error("Xóa thất bại");
    XToast.hideLoading();
    onCloseButton();
  }

  void onCloseButton() {
    context.router.canPop()
        ? context.router.pop()
        : context.router
            .pushAndPopUntil(IndividualRoute(), predicate: (_) => false);
  }

  void onChangeEdit() {
    emit(state.copyWith(isEdit: true));
  }

  void addInfoMore() {
    emit(state.copyWith(listFieldInfo: [
      ...state.listFieldInfo,
      InfoMoreModel(id: Uuid().v4())
    ]));
  }

  void removeInfoMore(InfoMoreModel data) {
    final list = [...state.listFieldInfo];
    list.remove(data);

    emit(state.copyWith(listFieldInfo: list));
  }

  void updateNameTolistFieldInfo(InfoMoreModel data, String name) {
    state.listFieldInfo.forEach((person) {
      if (person.id == data.id) {
        person.name = name;
      }
    });

    emit(state.copyWith(listFieldInfo: [
      ...state.listFieldInfo,
    ]));
  }

  void updateDataTolistFieldInfo(InfoMoreModel data, String noidung) {
    state.listFieldInfo.forEach((person) {
      if (person.id == data.id) {
        person.description = noidung;
      }
    });

    emit(state.copyWith(listFieldInfo: [
      ...state.listFieldInfo,
    ]));
  }

  Future<void> onAddVideo(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
          allowMultiple: false,
          type: FileType.custom,
          allowedExtensions: [
            'mp4',
            'mov',
            'MOV',
          ]);
      if (result == null) return;

      final storageRef = FirebaseStorage.instance.ref();

      final Reference groupsRef = storageRef;
      final file = result.files.first;

      final metadata = SettableMetadata(
        contentType: 'video/mp4',
        customMetadata: {'picked-file-path': file.hashCode.toString()},
      );
      final uploadTask = await groupsRef
          .child(file.name.toString())
          .putData(file.bytes!, metadata);
      final url = await uploadTask.ref.getDownloadURL();

      emit(state.copyWith(video: url));
    } catch (error) {
      emit(state.copyWith(video: ""));
      return;
    }
  }

  Future<void> onAddImage(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
          allowMultiple: false,
          type: FileType.custom,
          allowedExtensions: [
            'png',
            'jpg',
            'jpeg',
          ]);
      if (result == null) return;
      final file = result.files.first;
      final storageRef = FirebaseStorage.instance.ref();
      final Reference groupsRef = storageRef;

      final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': file.hashCode.toString()},
      );
      final uploadTask = await groupsRef
          .child(file.name.toString())
          .putData(file.bytes!, metadata);

      final image = await uploadTask.ref.getDownloadURL();
      emit(state.copyWith(image: image));
    } catch (error) {
      emit(state.copyWith(image: ""));
      return;
    }
  }

  Future<String?> _pickDate() async {
    try {
      final result = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000, 1, 1),
          lastDate: DateTime(2050, 1, 1));
      if (result != null) {
        String formattedDate = DateFormat('yyyy-MM-dd').format(result);

        return formattedDate;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  void onChangedAge(String value) {
    emit(state.copyWith(age: value));
  }

  void onChangedColor(String value) {
    emit(state.copyWith(color: value));
  }

  void onChangedDate() async {
    String? value = await _pickDate();
    if (value != null) {
      emit(state.copyWith(date: value));
    } else {
      emit(state.copyWith(date: ""));
    }
  }

  void onChangedFood(String value) {
    emit(state.copyWith(food: value));
  }

  void onChangedPrice(String value) {
    emit(state.copyWith(price: value));
  }

  void onChangedReview(String value) {
    emit(state.copyWith(review: value));
  }

  void onChangedStyle(String value) {
    emit(state.copyWith(style: value));
  }

  void onChangedWeight(String value) {
    emit(state.copyWith(weight: value));
  }

  void copy() {
    Clipboard.setData(ClipboardData(text: state.video));

    XToast.show("Sao chép");
  }

  void _checkIdExist() async {
    final result = await domain.individual.getIndividual(state.familyCode);
    if (result.isSuccess) {
      emit(state.copyWith(isFamilyCodeExist: true));
      return;
    }
    emit(state.copyWith(isFamilyCodeExist: false));
  }

  void onChangedName(String value) {
    emit(state.copyWith(name: value));
  }

  void onChangedFamilyCode(String value) {
    emit(state.copyWith(familyCode: value));
    _checkIdExist();
  }

  @override
  Future<void> close() {
    XToast.hideLoading();
    return super.close();
  }
}
