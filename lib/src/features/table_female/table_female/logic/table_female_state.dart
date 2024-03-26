// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:familytree/src/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:familytree/src/network/domain.dart';
import 'package:familytree/src/network/model/individual_model.dart';
import 'package:familytree/src/utils/utils.dart';
import 'package:familytree/widgets/dialogs/toast_wrapper.dart';

part "table_female_bloc.dart";

class TableFemaleState extends Equatable {
  final List<IndividualModel> list;

  TableFemaleState({this.list = const []});
  @override
  List<Object?> get props => [
        list,
      ];

  TableFemaleState copyWith({
    List<IndividualModel>? list,
  }) {
    return TableFemaleState(
      list: list ?? this.list,
    );
  }
}
