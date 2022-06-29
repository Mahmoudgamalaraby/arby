import 'package:algoriza_task1/screens/register_screen.dart';
import 'package:algoriza_task1/widgets/help_button.dart';
import 'package:algoriza_task1/widgets/label_of_form_field.dart';
import 'package:algoriza_task1/widgets/material_button.dart';
import 'package:algoriza_task1/widgets/my_caption.dart';
import 'package:algoriza_task1/widgets/outline_button.dart';
import 'package:algoriza_task1/widgets/text_button.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';


import '../widgets/mu_form_field.dart';
import '../widgets/my_head_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var numberController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  Country? _selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/1.png',
              height: MediaQuery
                  .of(context)
                  .size
                  .height * .3,
              fit: BoxFit.cover,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyCaption(text: 'Welcome To Fashion Diary'),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        MyHeadText(
                          headText: 'Sign In',
                        ),
                        Spacer(),
                        HelpButton(),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const LabelOfFormField(label: 'Phone Number'),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        CountryPickerDropdown(
                          initialValue: 'EG',
                          itemBuilder: _buildDropdownItem,
                          priorityList:[
                            CountryPickerUtils.getCountryByIsoCode('EG'),
                            CountryPickerUtils.getCountryByIsoCode('SA'),
                          ],
                          sortComparator: (Country a, Country b) => a.isoCode.compareTo(b.isoCode),
                          onValuePicked: (Country country) {
                            print(country.name);
                          },
                        ),
                        Expanded(

                          child: MyFormField(
                            controller: numberController,
                            validateText: 'your number must not be empty',
                            inputType: TextInputType.number,
                            hintText: 'Eg: B12345678',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyMaterialButton(onPressed: () {
                      if (formKey.currentState!.validate()) {}
                    }, text: 'Sign In'),
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                        child: LabelOfFormField(
                          label: 'Or',
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    const MyOutLineButton(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Doesn\'t has any account ?'),
                        MyTextButton(textButton: 'Register here', onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (
                                  BuildContext context) => const RegisterScreen(),
                            ),
                          );
                        }),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const MyCaption(
                      text:
                      'Use the application according to Policy rules. Any kinds of violations will be subject to sanctions',
                      fontSize: 15,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildDropdownItem(Country country) => Container(
    child: Row(
      children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        SizedBox(
          width: 8.0,
        ),
        Text("+${country.phoneCode}(${country.isoCode})"),
      ],
    ),
  );
}
