import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/product/data/model/product_data_model.dart';
import 'package:food_delivery/core/utils/assets.dart';
import 'package:food_delivery/core/utils/constants.dart';
import 'package:food_delivery/core/utils/helper.dart';
import 'package:food_delivery/core/utils/navigation.dart';

import '../../../../../core/utils/services/firebase_firestore_service.dart';
import '../../../../help_center/presentation/views/help_center_view.dart';
import '../../../../profile/data/model/gender_item_model.dart';
import '../../../../profile/data/model/profile_item_model.dart';
import '../../../../profile/presentation/views/personal_data_view.dart';
import '../../../../profile/presentation/views/profile_view.dart';
import '../../../../profile/presentation/views/setting_view.dart';
import '../../../../profile/presentation/views/widgets/delete_account_show_dialog.dart';
import '../../../../profile/data/model/user_data_model.dart';
import '../../../data/model/bottom_nav_model.dart';
import '../../../data/model/category_item_model.dart';
import '../../views/main_home_view.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FirebaseFirestoreService _firebaseFirestoreService;
  HomeBloc(this._firebaseFirestoreService) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is ChangeBottomNavEvent) {
        if (event.index == currentIndex) return;
        currentIndex = event.index;
        emit(ChangeBottomNavState());
      }

      if (event is ChangeCategoryEvent) {
        if (categoryIndex == event.index) return;
        categoryIndex = event.index;
        productsList = _getProducts();
        emit(ChangeCategory());
      }

      if (event is GetProductDateEvent) {
        allProductsList = event.productsList;
        productsList = _getProducts();
        emit(GetProductDataSuccess());
      }

      if (event is UserDataUpdatedEvent) {
        userDataModel = event.userDataModel;
        emit(GetUserDataSuccess());
      }

      if (event is GenderEvent) {
        if (event.index == genderCurrentIndex) return;
        genderCurrentIndex = event.index;
        emit(ChangeGenderIndex());
      }
    });

    _firebaseFirestoreService.getData(
        collectionName: Constants.productCollection,
        onData: (snapshot) {
          allProductsList.clear();
          _burgerList.clear();
          _tacoList.clear();
          _drinkList.clear();
          _pizzaList.clear();

          for (var element in snapshot.docs) {
            var product = ProductDataModel.fromJson(element.data());
            allProductsList.add(product);

            if (product.productCategory == "Burger") {
              _burgerList.add(product);
            }
            if (product.productCategory == "Taco") {
              _tacoList.add(product);
            }
            if (product.productCategory == "Drink") {
              _drinkList.add(product);
            }
            if (product.productCategory == "Pizza") {
              _pizzaList.add(product);
            }
          }
          add(GetProductDateEvent(allProductsList));
        });

    _firebaseFirestoreService.getData(
        collectionName: Constants.userCollection,
        onData: (snapshot) {
          if (snapshot.docs.isEmpty) return;

          final users = snapshot.docs
              .map((doc) => UserDataModel.fromJson(doc.data()))
              .toList();

          final user = users.firstWhere((e) =>
              e.userID == Helper.getIt.get<FirebaseAuth>().currentUser!.uid);

          if (user.userID.isNotEmpty) {
            add(UserDataUpdatedEvent(user));
          }
        });
  }

  List<ProductDataModel> _getProducts() {
    if (categoryIndex == 1) return _tacoList;
    if (categoryIndex == 2) return _drinkList;
    if (categoryIndex == 3) return _pizzaList;

    return _burgerList;
  }

  List<ProductDataModel> allProductsList = [];
  List<ProductDataModel> productsList = [];

  final List<ProductDataModel> _burgerList = [];
  final List<ProductDataModel> _tacoList = [];
  final List<ProductDataModel> _drinkList = [];
  final List<ProductDataModel> _pizzaList = [];

  UserDataModel? userDataModel;
  int currentIndex = 0;

  List<BottomNavModel> bottomNavItems = [
    BottomNavModel(image: Assets.imagesHome, index: 0, lable: "Home"),
    BottomNavModel(image: Assets.imagesCard, index: 1, lable: "Card"),
    BottomNavModel(image: Assets.imagesChat, index: 2, lable: "Chat"),
    BottomNavModel(image: Assets.imagesProfile, index: 3, lable: "Profile"),
  ];

  List<Widget> views = const [
    MainHomeView(),
    Scaffold(),
    Scaffold(),
    ProfileView()
  ];

  int categoryIndex = 0;
  List<CategoryItemModel> categoryItems = [
    CategoryItemModel(image: Assets.imagesBurger, title: "Burger", index: 0),
    CategoryItemModel(image: Assets.imagesTaco, title: "Taco", index: 1),
    CategoryItemModel(image: Assets.imagesDrink, title: "Drink", index: 2),
    CategoryItemModel(image: Assets.imagesPizza, title: "Pizza", index: 3),
  ];

  // profile build items
  List<ProfileItemModel> profileItems(BuildContext context) {
    return [
      ProfileItemModel(
          title: 'Personal Data',
          leading: Assets.imagesPersonalData,
          onTap: () => Navigation.push(
              context, PersonalDataView(userDataModel: userDataModel!))),
      ProfileItemModel(
          title: 'Settings',
          leading: Assets.imagesSettings,
          onTap: () => Navigation.push(context, const SettingView())),
      ProfileItemModel(
          title: 'Extra Card',
          leading: Assets.imagesExtraCard,
          onTap: () => Helper.customSnackBar(context,
              message: "This Feature is coming soon.")),
    ];
  }

  List<ProfileItemModel> supportItems(BuildContext context) {
    return [
      ProfileItemModel(
          title: 'Help Center',
          leading: Assets.imagesHelpCenter,
          onTap: () => Navigation.push(context, const HelpCenterView())),
      ProfileItemModel(
          title: 'Delete Account',
          leading: Assets.imagesDeleteAccount,
          onTap: () => showDialog(
              context: context,
              builder: (context) => DeleteAccountShowDialog())),
      ProfileItemModel(
          title: 'Add another account',
          leading: Assets.imagesAddAnotherAccount,
          onTap: () => Helper.customSnackBar(context,
              message: "This Feature is coming soon.")),
    ];
  }

  // gender item
  int genderCurrentIndex = -1;

  List<GenderItemModel> genderList = [
    GenderItemModel(icon: Icons.male, title: "Male"),
    GenderItemModel(icon: Icons.female, title: "Female"),
  ];
}
