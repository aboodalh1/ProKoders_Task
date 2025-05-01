class ObjectValidator {
  String verifyEmailAndPassword(String email,String password){
      if (email.trim().isEmpty) {
        return "The email must not be empty";
      }
      if (!email.trim().contains(RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'))) {
        return "The email format is not correct";
      }
      if (password.trim().isEmpty) {
        return "The password must not be empty";
      }
      if (password.trim().length < 8) {
        return "password not correct";
      }
      return "true";
  }
}