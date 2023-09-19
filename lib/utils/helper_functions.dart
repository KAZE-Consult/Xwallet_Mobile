int? getRoleId(String? val) {
  switch (val?.toLowerCase()) {
    case 'dealer':
      return 1;
    case 'subdealer':
      return 2;
    case 'retailer':
      return 3;
    default:
      return null;
  }
}

String? getRoleString(int? val) {
  switch (val) {
    case 1:
      return 'Dealer';
    case 2:
      return 'SubDealer';
    case 3:
      return 'Retailer';
    default:
      return null;
  }
}

bool validateEmail(String email) {
  String emailPattern =
      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-zA-Z]{2,})$';
  RegExp regExp = RegExp(emailPattern);
  return regExp.hasMatch(email);
}
