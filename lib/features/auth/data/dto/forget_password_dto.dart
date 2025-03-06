class ForgetPasswordDto {
  final String username;
  final String newPassword;

  ForgetPasswordDto({
    required this.username,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'newPassword': newPassword,
    };
  }

  factory ForgetPasswordDto.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordDto(
      username: json['username'],
      newPassword: json['newPassword'],
    );
  }
}
