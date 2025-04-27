class ButtonModel {
  final String buttonName;
  final bool isLoading;
  final void Function() onTap;

  ButtonModel(
      {required this.buttonName, this.isLoading = false, required this.onTap});
}
