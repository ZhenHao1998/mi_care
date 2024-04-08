import 'package:equatable/equatable.dart';
import 'package:mi_care/validator.dart';

class FormData extends Equatable {
  final String firstName;
  final String lastName;
  final String contactNumber;
  final String email;

  const FormData({
    this.firstName = '',
    this.lastName = '',
    this.contactNumber = '',
    this.email = '',
  });

  Map<String, dynamic> toJson() => {
        'FirstName': firstName,
        'LastName': lastName,
        'ContactNo': contactNumber,
        'Email': email,
      };

  bool hasErrorMessages() =>
      hasErrorMessageOnEmail(email) != null ||
      hasErrorMessageOnMobile(contactNumber) != null ||
      hasErrorMessageOnName('First Name', firstName) != null ||
      hasErrorMessageOnName('Last Name', lastName) != null;

  Map<String, String> errorMessages() => {
        'email': hasErrorMessageOnEmail(email) ?? '',
        'contactNo': hasErrorMessageOnMobile(contactNumber) ?? '',
        'firstName': hasErrorMessageOnName('First Name', firstName) ?? '',
        'lastName': hasErrorMessageOnName('Last Name', lastName) ?? '',
      };

  FormData copyWith({
    String? firstName,
    String? lastName,
    String? contactNumber,
    String? email,
  }) =>
      FormData(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        contactNumber: contactNumber ?? this.contactNumber,
        email: email ?? this.email,
      );

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        contactNumber,
        email,
      ];
}
