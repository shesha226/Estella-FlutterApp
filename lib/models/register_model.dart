class AppUserModel {
  final String userId;
  final String fullName;
  final String emailAddress;
  final String profilePictureUrl;

  AppUserModel({
    required this.userId,
    required this.fullName,
    required this.emailAddress,
    this.profilePictureUrl = '',
  });

  Map<String, dynamic> toDatabaseMap() {
    return {
      'fullName': fullName,
      'email': emailAddress,
      'profilePic': profilePictureUrl,
      'createdAt': DateTime.now().toIso8601String(),
    };
  }

  factory AppUserModel.fromDatabase(Map<String, dynamic> data, String id) {
    return AppUserModel(
      userId: id,
      fullName: data['fullName'] ?? '',
      emailAddress: data['email'] ?? '',
      profilePictureUrl: data['profilePic'] ?? '',
    );
  }
}
