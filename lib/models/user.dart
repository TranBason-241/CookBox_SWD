// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

UserLogin userFromJson(String str) => UserLogin.fromJson(json.decode(str));

String userToJson(UserLogin data) => json.encode(data.toJson());

class UserLogin {
    UserLogin({
        this.id,
        this.name,
        this.address,
        this.phone,
        this.roleId,
        this.roleName,
        this.status,
        this.email,
    });

    int? id;
    String? name;
    String? address;
    String? phone;
    String? roleId;
    String? roleName;
    bool? status;
    String? email;

    factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        roleId: json["role_id"],
        roleName: json["role_name"],
        status: json["status"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "phone": phone,
        "role_id": roleId,
        "role_name": roleName,
        "status": status,
        "email": email,
    };
}
