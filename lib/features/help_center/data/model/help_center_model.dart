class HelpCenterModel {
  final String? leading;
  final String title, subTitle;
  final Function()? onTap;

  HelpCenterModel(
      {this.leading, required this.title, required this.subTitle, this.onTap});
}
