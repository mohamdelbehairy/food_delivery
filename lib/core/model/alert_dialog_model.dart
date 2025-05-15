class AlertDialogModel {
  final String? title, content, buttonName;
  final Function() onTap;

  AlertDialogModel(
      {this.title, this.content, this.buttonName, required this.onTap});
}
