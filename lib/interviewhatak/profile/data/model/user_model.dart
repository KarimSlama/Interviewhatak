class UserModel {
  final String name;
  final String email;
  final String phone;
  final String? image;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    this.image =
        'https://img.freepik.com/premium-vector/european-men-avatar_7814-344.jpg?w=740',
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? image,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "email": this.email,
      "phone": this.phone,
      "image": this.image,
    };
  }
}
