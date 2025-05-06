class UserDataModel {
  final String userName, userID, userEmail;
  final String? userImage, gender, dateOfBirth, imageFile;

  UserDataModel(
      {required this.userName,
      required this.userID,
      required this.userEmail,
      this.userImage,
      this.gender,
      this.dateOfBirth,
      this.imageFile});

  factory UserDataModel.fromJson(json) {
    return UserDataModel(
        userName: json['userName'],
        userID: json['userID'],
        userEmail: json['userEmail'],
        userImage: json['userImage'],
        gender: json['gender'],
        dateOfBirth: json['dateOfBirth'],
        imageFile: json['imageFile']);
  }

  toJson() {
    return {
      'userName': userName,
      'userID': userID,
      'userEmail': userEmail,
      'userImage': userImage,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'imageFile': imageFile
    };
  }

  UserDataModel copyWith({
    String? userName,
    String? userID,
    String? userEmail,
    String? userImage,
    String? gender,
    String? dateOfBirth,
    String? imageFile,
  }) {
    return UserDataModel(
      userName: userName ?? this.userName,
      userID: userID ?? this.userID,
      userEmail: userEmail ?? this.userEmail,
      userImage: userImage ?? this.userImage,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      imageFile: imageFile ?? this.imageFile,
    );
  }
}
