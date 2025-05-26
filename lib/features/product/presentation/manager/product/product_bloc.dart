import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) {
      if (event is ProductPlusEvent) {
        if (productCount == 10) return;
        productCount++;
        emit(ProductCountChange());
      }

      if (event is ProductMinusEvent) {
        if (productCount == 1) return;
        productCount--;
        emit(ProductCountChange());
      }
    });
  }

  int productCount = 1;
}
