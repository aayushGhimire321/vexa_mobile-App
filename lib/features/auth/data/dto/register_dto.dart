class RegisterDto {
  final String username;
  final String password;
  final String email;
  final String fullName;

  RegisterDto({
    required this.username,
    required this.password,
    required this.email,
    required this.fullName,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'email': email,
      'fullName': fullName,
    };
  }

  factory RegisterDto.fromJson(Map<String, dynamic> json) {
    return RegisterDto(
      username: json['username'],
      password: json['password'],
      email: json['email'],
      fullName: json['fullName'],
    );
  }
}
