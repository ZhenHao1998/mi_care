import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mi_care/cubit/form_state.dart';
import 'package:mi_care/model/form_data.dart';
import 'package:mi_care/service/form_service.dart';

class FormCubit extends Cubit<MiCareFormState> {
  final formService = GetIt.I<FormService>();

  FormCubit._({required MiCareFormState state}) : super(state);

  factory FormCubit.initial({MiCareFormState? state}) {
    return FormCubit._(state: state ?? const MiCareFormState(formData: FormData()));
  }

  Future<void> validate({String? firstName, String? lastName, String? contactNo, String? email}) async {
    emit(
      MiCareFormValidating(
        formData: state.formData.copyWith(
          firstName: firstName,
          lastName: lastName,
          contactNumber: contactNo,
          email: email,
        ),
      ),
    );

    if (state.formData.hasErrorMessages()) {
      emit(MiCareFormValidateFail(formData: state.formData, errorMessages: state.formData.errorMessages()));

      return;
    }

    emit(MiCareFormValidateSuccess(formData: state.formData));
  }

  Future<void> submitForm() async {
    await validate();

    if (state is MiCareFormValidateSuccess) {
      await formService.submitForm(formData: state.formData).then(
        (value) {
          if (value) {
            emit(
              const MiCareFormSubmitSuccess(
                formData: FormData(),
              ),
            );
            return;
          }

          emit(MiCareFormSubmitFail(formData: state.formData));
        },
      );
    }

    return;
  }
}
