class UserData {
  final String? name;
  final String? email;
  final String? birthday;
  final String? password;
  final bool isTracking;
  UserData(
      {this.name,
      this.email,
      this.birthday,
      this.password,
      this.isTracking = false});

  UserData copyWith({
    String? name,
    String? email,
    String? birthday,
    String? password,
    bool? isTracking,
  }) {
    return UserData(
      name: name ?? this.name,
      email: email ?? this.email,
      birthday: birthday ?? this.birthday,
      password: password ?? this.password,
      isTracking: isTracking ?? this.isTracking,
    );
  }
}
