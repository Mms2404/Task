String? notEmpty(String? value, String fieldName) {
  if (value == null || value.trim().isEmpty) {
    return "$fieldName cannot be empty";
  }
  return null;
}
