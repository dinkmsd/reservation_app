class UserModel {
  final String? id;
  final String? name;
  final String? avatarPath;
  final String? phone;
  final String? email;
  final String? password;

  UserModel(
      {this.password,
      this.phone,
      this.email,
      this.id,
      this.name,
      this.avatarPath});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'avatarPath': avatarPath,
        'phone': phone,
        'email': email,
        'password': password
      };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      avatarPath: json['avatarPath'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?);

  UserModel copyWith(
          {String? id,
          String? name,
          String? avatarPath,
          String? phone,
          String? email,
          String? password}) =>
      UserModel(
          id: id ?? this.id,
          name: name ?? this.name,
          phone: phone ?? this.phone,
          email: email ?? this.email,
          avatarPath: avatarPath ?? this.avatarPath,
          password: password ?? this.password);
}

final userModelMockData = UserModel(
    id: '01010101',
    name: 'Lua Pham',
    avatarPath: 'assets/images/images/avatar.png',
    email: 'luapham@gmail.com',
    phone: '0987654321',
    password: 'Cong@123');
