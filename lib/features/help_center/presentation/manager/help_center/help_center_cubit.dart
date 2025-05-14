import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/assets.dart';
import 'package:food_delivery/core/utils/navigation.dart';

import '../../../data/model/help_center_model.dart';
import '../../views/display_help_view.dart';

part 'help_center_state.dart';

class HelpCenterCubit extends Cubit<HelpCenterState> {
  HelpCenterCubit() : super(HelpCenterInitial());

  List<HelpCenterModel> helpCenterItem(BuildContext context) {
    return [
      HelpCenterModel(
          title: "General",
          leading: Assets.imagesGeneral,
          subTitle: "Basic question about Restate",
          onTap: () => Navigation.push(
              context, DisplayHelpView(title: "General", list: _generalItem))),
      HelpCenterModel(
          title: "Sellers",
          leading: Assets.imagesSellers,
          subTitle: "All you need to know about selling your home to Restate",
          onTap: () => Navigation.push(
              context, DisplayHelpView(title: "Sellers", list: _sellersItem))),
      HelpCenterModel(
          title: "Buyers",
          leading: Assets.imagesBuyers,
          subTitle: "Everything you need to know about buying with Restate",
          onTap: () => Navigation.push(
              context, DisplayHelpView(title: "Buyers", list: _buyersItem))),
      HelpCenterModel(
          title: "Agents",
          leading: Assets.imagesAgents,
          subTitle:
              "How buying agents and listing agents can work with Restate",
          onTap: () => Navigation.push(
              context, DisplayHelpView(title: "Agents", list: _agentsItem))),
    ];
  }

  final List<HelpCenterModel> _generalItem = [
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
        subTitle:
            "Yes, creating an account is required to place orders, track deliveries, and access personalized features like saved addresses and favorite meals."),
    HelpCenterModel(
        title: "Is the app available on Android, iOS?",
        subTitle:
            "Absolutely! Our app is available for both Android and iOS users.You can download it anytime from the Google Play Store or the Apple App Store."),
  ];

  final List<HelpCenterModel> _sellersItem = [
    HelpCenterModel(
        title: "How can I list my restaurant on the app?",
        subTitle:
            "To get your restaurant listed, simply reach out to our support team or fill out the onboarding form available on our website or in the app. Our team will review your request and guide you through the setup process."),
    HelpCenterModel(
        title: "Is there a fee to join?",
        subTitle:
            "We offer flexible commission-based plans. There are no upfront setup fees — you’ll only be charged a small percentage per order placed through the app."),
    HelpCenterModel(
        title: "Can I manage my own menu and prices?",
        subTitle:
            "Yes! You’ll get access to a dedicated dashboard where you can easily update your menu items, prices, and availability at any time."),
    HelpCenterModel(
        title: "How do I receive orders?",
        subTitle:
            "Orders will be sent directly to your restaurant via the app. You’ll receive a notification with all the order details and can accept or reject the order accordingly."),
    HelpCenterModel(
        title: "Can I temporarily pause my restaurant?",
        subTitle:
            "Absolutely. You can mark your restaurant as “temporarily closed” at any time from your dashboard, whether it’s for holidays, maintenance, or other reasons."),
  ];

  final List<HelpCenterModel> _buyersItem = [
    HelpCenterModel(
        title: "How do I place an order?",
        subTitle:
            "Simply sign in, browse through the available restaurants and food items on the home screen, add your favorite meals to the cart, and proceed to checkout. It’s quick and user-friendly."),
    HelpCenterModel(
        title: "Can I schedule an order for later?",
        subTitle:
            "Yes! During checkout, you’ll have the option to schedule your order for a specific time that suits you, or you can place it for immediate delivery."),
    HelpCenterModel(
        title: "What if something is wrong with my order?",
        subTitle:
            "If there are missing or incorrect items, you can report the issue directly through the “Help” section. Our support team will assist you quickly."),
    HelpCenterModel(
        title: "Can I reorder my previous meals?",
        subTitle:
            "Absolutely! Just go to your order history and tap on “Reorder” to get your favorite items again with one click."),
  ];

  final List<HelpCenterModel> _agentsItem = [
    HelpCenterModel(
        title: "How can I become a delivery agent?",
        subTitle:
            "You can apply directly through the app or our website. Fill in your details, provide the required documents, and our team will get in touch with you shortly."),
    HelpCenterModel(
        title: "What are the requirements to join as an agent?", subTitle: '''
To become a delivery agent, you’ll need:

. A valid national ID or driver’s license
. A smartphone with internet access
. A reliable vehicle (bike, motorbike, or car)
. Commitment to deliver on time'''),
    HelpCenterModel(
        title: "How do I receive delivery requests?",
        subTitle:
            "Once approved and logged into the agent app, you’ll receive live delivery requests. You can view the restaurant, delivery location, and accept or reject the order."),
    HelpCenterModel(
        title: "What support is available for agents?",
        subTitle:
            "We offer 24/7 support through the agent help center. If you face any issues during delivery, our team is always ready to assist."),
  ];
}
