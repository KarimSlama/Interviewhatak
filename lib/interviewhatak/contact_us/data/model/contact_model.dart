class ContactModel {
  final String email;
  final String name;
  final String message;

  ContactModel(
      {required this.email, required this.name, required this.message});

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "email": this.email,
      "message": this.message,
    };
  }
}
