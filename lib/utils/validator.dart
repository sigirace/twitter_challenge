String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return "Name cannot be empty";
  }

  if (value.length < 4) {
    return "Name must be at least 4 characters";
  }

  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return "Email cannot be empty";
  }

  if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
      .hasMatch(value)) {
    return "Invalid email address";
  }

  return null;
}
