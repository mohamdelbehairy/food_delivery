import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/model/app_bar_model.dart';
import '../../data/model/product_data_model.dart';
import '../manager/product/product_bloc.dart';
import 'widgets/product_view_body.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.productData});
  final ProductDataModel productData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(AppBarModel(
            context: context,
            isProduct: true,
            title: "About This Menu",
            backgroundColor: Colors.white)),
        body: ProductViewBody(productData: productData),
      ),
    );
  }
}
