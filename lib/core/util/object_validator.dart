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

  String verifyTitleAndDescription(String title,String description){
  if (title.trim().length < 3 || title.trim().length > 40) {
        return "Title must be between 3 and 40 char";
        
      }
      if (description.trim().length < 10 || description.trim().length > 140) {
        return "Description must be between 10 and 140 char";
        
      }     return "true";
  }



}