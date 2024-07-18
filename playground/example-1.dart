void main() {
  try {
    validateEmail('invalidEmail');
  } catch (e) {
    print('Caught an exception: $e');
  }

  try {
    accessListElement([1, 2, 3], 5);
  } catch (e) {
    print('Caught an exception: $e');
  }

  try {
    throw CustomException('This is a custom exception');
  } catch (e) {
    print('Caught a custom exception: $e');
  }
}

// Lever une exception intégrée
void validateEmail(String email) {
  if (!email.contains('@')) {
    throw FormatException('Invalid email format');
  }
}

// Lever une erreur intégrée
void accessListElement(List<int> list, int index) {
  if (index >= list.length) {
    throw RangeError('Index out of range');
  }
  print(list[index]);
}

// Création et levée d'une exception personnalisée
class CustomException implements Exception {
  final String message;
  CustomException(this.message);

  @override
  String toString() => 'CustomException: $message';
}
