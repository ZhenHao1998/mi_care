import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_care/components/label_text_field.dart';
import 'package:mi_care/cubit/form_cubit.dart';
import 'package:mi_care/cubit/form_state.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  late FormCubit formCubit;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController mobileController;
  late TextEditingController emailController;

  late FocusNode firstNameFocusNode;

  @override
  void initState() {
    formCubit = FormCubit.initial();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    mobileController = TextEditingController();
    emailController = TextEditingController();

    firstNameFocusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  color: Colors.red,
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.7,
                  color: Colors.white,
                ),
              ],
            ),
            BlocConsumer<FormCubit, MiCareFormState>(
                listener: (context, state) {
                  if (state is MiCareFormSubmitSuccess) {
                    firstNameController.clear();
                    lastNameController.clear();
                    mobileController.clear();
                    emailController.clear();

                    firstNameFocusNode.requestFocus();

                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Thank You',
                              style: TextStyle(
                                color: Color.fromRGBO(37, 150, 190, 1),
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text('Thank you for your submission.'),
                            const Text('RSVP Form was submitted'),
                            const Text('successfully.'),
                            const SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(37, 150, 190, 1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Center(
                                  child: Text(
                                    'Ok',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
                bloc: formCubit,
                builder: (context, state) {
                  final errorMessages = state is MiCareFormValidateFail ? state.errorMessages : null;

                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Text(
                            'RSVP Form',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: SizedBox(
                            height: 30,
                            child: VerticalDivider(
                              thickness: 2,
                              width: 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Text(
                          'Kindly respond by February 06, 2021',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'We look forward to celebrate with you',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      'Please enter all the fields',
                                      style: TextStyle(
                                        color: Color.fromRGBO(37, 150, 190, 1),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  LabelTextField(
                                    controller: firstNameController,
                                    focusNode: firstNameFocusNode,
                                    labelText: 'First Name',
                                    hintText: 'Enter First Name',
                                    errorText: errorMessages?['firstName'],
                                    onChanged: (val) => formCubit.validate(firstName: val),
                                  ),
                                  LabelTextField(
                                    controller: lastNameController,
                                    labelText: 'Last Name',
                                    hintText: 'Enter Last Name',
                                    errorText: errorMessages?['lastName'],
                                    onChanged: (val) => formCubit.validate(lastName: val),
                                  ),
                                  LabelTextField(
                                    controller: mobileController,
                                    labelText: 'Contact Number',
                                    hintText: 'Enter Contact Number',
                                    errorText: errorMessages?['contactNo'],
                                    onChanged: (val) => formCubit.validate(contactNo: val),
                                  ),
                                  LabelTextField(
                                    controller: emailController,
                                    labelText: 'Email',
                                    hintText: 'Enter Email',
                                    errorText: errorMessages?['email'],
                                    onChanged: (val) => formCubit.validate(email: val),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              formCubit.submitForm();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(37, 150, 190, 1),
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Center(
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
