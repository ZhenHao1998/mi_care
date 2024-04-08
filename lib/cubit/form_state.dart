import 'package:equatable/equatable.dart';
import 'package:mi_care/model/form_data.dart';

class MiCareFormState extends Equatable {
  final FormData formData;

  const MiCareFormState({required this.formData});

  @override
  List<Object?> get props => [formData];
}

class MiCareFormValidateFail extends MiCareFormState {
  final Map<String, String> errorMessages;
  const MiCareFormValidateFail({
    required super.formData,
    required this.errorMessages,
  });

  @override
  List<Object?> get props => [errorMessages];
}

class MiCareFormValidateSuccess extends MiCareFormState {
  const MiCareFormValidateSuccess({required super.formData});
}

class MiCareFormValidating extends MiCareFormState {
  const MiCareFormValidating({required super.formData});
}

class MiCareFormLoading extends MiCareFormState {
  const MiCareFormLoading({required super.formData});
}

class MiCareFormSubmitFail extends MiCareFormState {
  const MiCareFormSubmitFail({required super.formData});
}

class MiCareFormSubmitSuccess extends MiCareFormState {
  const MiCareFormSubmitSuccess({required super.formData});
}
