import 'package:familytree/src/features/dashboard/cubit/dashboard_bloc.dart';
import 'package:familytree/src/features/dashboard/widgets/item_drawer_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDrawer extends StatelessWidget {
  final ItemDrawerEnum data;
  const ItemDrawer({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return ListTile(
          title: Text(
            data.title,
          ),
          minLeadingWidth: 20,
          leading: state.currentIndex == data.index
              ? const Icon(
                  Icons.check_outlined,
                  color: Colors.green,
                )
              : null,
          onTap: () => context.read<DashboardBloc>().changePage(data.index),
        );
      },
    );
  }
}
