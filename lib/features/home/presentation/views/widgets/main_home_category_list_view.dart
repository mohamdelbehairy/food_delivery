import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/home/home_bloc.dart';
import 'main_home_category_item.dart';

class MainHomeCategoryListView extends StatelessWidget {
  const MainHomeCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    final home = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Align(
          alignment: AlignmentDirectional.centerStart,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                spacing: 30,
                children: home.categoryItems
                    .asMap()
                    .entries
                    .map((e) => MainHomeCategoryItem(
                        onTap: () => home.add(ChangeCategoryEvent(e.key)),
                        isSeclected: e.key == home.categoryIndex,
                        categoryItemModel: e.value))
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
