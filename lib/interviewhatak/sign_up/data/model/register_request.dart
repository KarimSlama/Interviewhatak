class RegisterRequestModel {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String? uId;
  final String image;

  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    this.uId,
    required this.image,
  });

  RegisterRequestModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? password,
    String? uId,
    String? image,
  }) {
    return RegisterRequestModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      uId: uId ?? this.uId,
      image: image ?? this.image,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "email": this.email,
      "phone": this.phone,
      "password": this.password,
      "uId": this.uId,
      "image": this.image,
    };
  }
}
