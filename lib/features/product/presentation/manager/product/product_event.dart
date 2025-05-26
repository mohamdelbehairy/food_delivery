part of 'product_bloc.dart';

sealed class ProductEvent {}

final class ProductMinusEvent extends ProductEvent {}

final class ProductPlusEvent extends ProductEvent {}