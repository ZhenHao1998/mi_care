final emailRegex = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

final mobileRegex = RegExp(r'^(\+?6?01)[02-46-9]-*[0-9]{7}$|^(\+?6?01)[1]-*[0-9]{8}$');

String? hasErrorMessageOnEmail(String? email) {
  if (email == null || email == '') return 'Email cannot be empty!';

  if (!emailRegex.hasMatch(email)) return 'Invalid email pattern.';

  return null;
}

String? hasErrorMessageOnMobile(String? mobile) {
  if (mobile == null || mobile == '') return 'Mobile cannot be empty!';

  if (!mobileRegex.hasMatch(mobile)) return 'Invalid mobile';

  return null;
}

String? hasErrorMessageOnName(String key, String? name) {
  if (name == null || name == '') return '$key cannot be empty!';

  if (name.length < 3) return '$key cannot be less than 3';

  return null;
}
