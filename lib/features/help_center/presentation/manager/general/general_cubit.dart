import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/help_center/data/model/help_center_model.dart';

part 'general_state.dart';

class GeneralCubit extends Cubit<GeneralState> {
  GeneralCubit() : super(GeneralInitial());

  List<HelpCenterModel> generalItem = [
    HelpCenterModel(
        title: "How does the app work?",
        subTitle:
            "Our food delivery app is designed to be simple and user-friendly.You can quickly sign up or log in, and once you're in, a variety of delicious food items will be displayed on the home screen.Choose what you like, place your order, and enjoy fast and reliable delivery to your doorstep."),
    HelpCenterModel(
        title: "Is the app available in my area?",
        subTitle:
            "Yes, the app is available to everyone.No matter where you're located, as long as you have an internet connection, you can browse restaurants and place orders easily."),
    HelpCenterModel(
        title: "How can I contact customer support?",
        subTitle:
            "You can reach our support team directly through the app by going to the “Support” or “Contact Us” section.We’re here to assist you with any issues or questions you may have."),
    HelpCenterModel(
        title: "Do I need to create an account to use the app?",
        subTitle: "Yes, creating an account is required to place orders, track deliveries, and access personalized features like saved addresses and favorite meals."),
    HelpCenterModel(
        title: "Is the app available on Android, iOS?",
        subTitle:
            "Absolutely! Our app is available for both Android and iOS users.You can download it anytime from the Google Play Store or the Apple App Store."),
  ];
}
