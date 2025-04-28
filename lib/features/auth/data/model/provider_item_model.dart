class ProviderItemModel {
  final String image;
  final Function() onTap;
  final double? height, width;

  ProviderItemModel(
      {required this.image, required this.onTap, this.height, this.width});
}
