class HelpCenterModel {
  final String leading, title, subTitle;
  final Function() onTap;

  HelpCenterModel(
      {required this.leading,
      required this.title,
      required this.subTitle,
      required this.onTap});
}
