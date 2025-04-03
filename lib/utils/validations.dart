
class Validations {

  static bool isEmailValid(String email) {
    // Regular expression for email validation
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  static bool isPhoneNumberValid(String phoneNumber) {
    // Regular expression for phone number validation
    final phoneRegex = RegExp(r'^(?:[+0]9)?[0-9]{10,12}$');
    return phoneRegex.hasMatch(phoneNumber);
  }


}