import '../utils/globals.dart';

class AppUser {
  late final int id;
  late final String firstName;
  late final String lastName;
  late final String? imageURL;
  late final String email;
  late final String dob;
  late final String gender;
  late final String? emailVerifiedAt;
  late final DateTime createdAt;
  late final DateTime updatedAt;
  late final Role role;
  String? token;

  AppUser(
      this.id,
      this.firstName,
      this.lastName,
      this.imageURL,
      this.email,
      this.dob,
      this.gender,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.role,
      this.token);

  // JSON Serialization
  AppUser.fromJSON(Map<dynamic, dynamic> json) {
    id = json['data']['id'];
    firstName = json['data']['first_name'];
    lastName = json['data']['last_name'];
    imageURL = json['data']['avatar'] ?? '';
    email = json['data']['email'];
    gender = json['data']['gender'];
    dob = json['data']['dob'];
    emailVerifiedAt = json['data']['email_verified_at'];
    createdAt = DateTime.parse(json['data']['created_at'].toString());
    updatedAt = DateTime.parse(json['data']['updated_at'].toString());
    role =
        json['data']['roles'][0]['name'].toString().toLowerCase() == 'student'
            ? Role.student
            : Role.teacher;
    token = json['token'] ?? '';
  }

  //toJSON
  Map<String, dynamic> toJSON() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    _data['dob'] = dob;
    _data['gender'] = gender;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['created_at'] = createdAt.toString();
    _data['updated_at'] = updatedAt.toString();
    return _data;
  }

  @override
  String toString() {
    return 'AppUser{id: $id, firstName: $firstName, lastName: $lastName, imageURL: $imageURL, email: $email, dob: $dob, gender: $gender, emailVerifiedAt: $emailVerifiedAt, createdAt: $createdAt, updatedAt: $updatedAt, role: $role, token: $token}';
  }
}

class Roles {
  late final int id;
  late final String name;
  late final String guardName;
  late final String createdAt;
  late final String updatedAt;

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    guardName = json['guard_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['guard_name'] = guardName;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
