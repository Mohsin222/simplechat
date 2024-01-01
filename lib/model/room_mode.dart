class RoomModel {
  String? sId;
  List<Users>? users;
  String? createdAt;
  String? updatedAt;
  int? iV;

  RoomModel({this.sId, this.users, this.createdAt, this.updatedAt, this.iV});

  RoomModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? '';
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Users {
  String? sId;
  String? username;
  String? email;
  String? password;
  bool? isAvatarImageSet;
  String? avatarImage;
  int? iV;

  Users(
      {this.sId,
      this.username,
      this.email,
      this.password,
      this.isAvatarImageSet,
      this.avatarImage,
      this.iV});

  Users.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    isAvatarImageSet = json['isAvatarImageSet'];
    avatarImage = json['avatarImage'];
    iV = json['__v'];
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
