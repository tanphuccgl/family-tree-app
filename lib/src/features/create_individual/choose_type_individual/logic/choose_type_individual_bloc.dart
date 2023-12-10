import 'package:equatable/equatable.dart';
import 'package:familytree/src/features/create_individual/create_individual_default/pages/create_individual_default_page.dart';
import 'package:familytree/src/features/create_individual/create_individual_f0_female/pages/create_individual_f0_female_page.dart';
import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/area_model.dart';
import 'package:familytree/src/network/model/product_model.dart';
import 'package:familytree/src/router/coordinator.dart';
import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part "choose_type_individual_state.dart";

class ChooseTypeIndividualBloc extends Cubit<ChooseTypeIndividualState> {
  final AreaModel area;

  ChooseTypeIndividualBloc(this.area) : super(ChooseTypeIndividualState()) {
    init();
  }

  Domain get domain => GetIt.I<Domain>();

  void init() {
    getListIndividual();
  }

  void getListIndividual() async {
    final result = await domain.product.getAllProduct();
    if (result.isSuccess) {
      emit(state.copyWith(list: [...result.data!]));
    }
  }

  void navigateToCreateIndividual(ProductTypeEnum type) {
    ProductTypeEnum getParentType(ProductTypeEnum currentType) {
      switch (currentType) {
        case ProductTypeEnum.f1:
          return ProductTypeEnum.f0;
        case ProductTypeEnum.f2:
          return ProductTypeEnum.f1;
        case ProductTypeEnum.f3:
          return ProductTypeEnum.f2;

        default:
          return ProductTypeEnum.f0;
      }
    }

    bool hasParent(ProductTypeEnum parentType) {
      return state.list
          .where((e) =>
              e.isMale == true &&
              e.listCopulateId.isNotEmpty &&
              e.type == parentType)
          .toList()
          .isNotEmpty;
    }

    switch (type) {
      case ProductTypeEnum.f0:
        XCoordinator.push(CreateIndividualF0FemalePage(area: area));
        break;
      case ProductTypeEnum.f1:
      case ProductTypeEnum.f2:
      case ProductTypeEnum.f3:
        final parentType = getParentType(type);
        if (hasParent(parentType)) {
          XCoordinator.push(CreateIndividualDefaultPage(
            area: area,
            type: type,
          ));
        } else {
          XToast.error("Chưa có cha mẹ");
        }
        break;
    }
  }
}
