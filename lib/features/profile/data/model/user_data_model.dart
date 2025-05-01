class UserDataModel {
  final String userName, userID, userEmail;
  final String? userImage;

  UserDataModel(
      {required this.userName,
      required this.userID,
      required this.userEmail,
      this.userImage});

  factory UserDataModel.fromJson(json) {
    return UserDataModel(
        userName: json['userName'],
        userID: json['userID'],
        userEmail: json['userEmail'],
        userImage: json['userImage']);
  }

  toJson() {
    return {
      'userName': userName,
      'userID': userID,
      'userEmail': userEmail,
      'userImage': userImage
    };
  }
}
