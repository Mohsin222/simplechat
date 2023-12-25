class UserModel {
  String? sId;
  String? username;
  String? email;
  String? password;
  bool? isAvatarImageSet;
  String? avatarImage;
  int? iV;

  UserModel(
      {this.sId,
      this.username,
      this.email,
      this.password,
      this.isAvatarImageSet,
      this.avatarImage,
      this.iV});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? '';
    username = json['username'] ?? '';
    email = json['email'] ?? '';
    password = json['password'] ?? '';
    isAvatarImageSet = json['isAvatarImageSet'] ?? false;
    avatarImage = json['avatarImage'] ?? '';
    iV = json['__v'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['isAvatarImageSet'] = this.isAvatarImageSet;
    data['avatarImage'] = this.avatarImage;
    data['__v'] = this.iV;
    return data;
  }
}
