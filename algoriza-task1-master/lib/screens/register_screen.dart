import 'package:algoriza_task1/screens/login_screen.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';

import '../widgets/help_button.dart';
import '../widgets/label_of_form_field.dart';
import '../widgets/material_button.dart';
import '../widgets/mu_form_field.dart';
import '../widgets/my_caption.dart';
import '../widgets/my_head_text.dart';
import '../widgets/outline_button.dart';
import '../widgets/text_button.dart';

class RegisterScreen extends StatelessWidget {

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var numberController = TextEditingController() ;
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    var formKey = GlobalKey<FormState>() ;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Image.asset(
                  'assets/images/1.png',
                  height: MediaQuery.of(context).size.height * .15,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 20,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                        );
                      },
                      icon: const Icon(Icons.arrow_back_ios_rounded),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const MyCaption(text: 'Welcome To Fashion Diary'),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: const [
                        MyHeadText(
                          headText: 'Register',
                        ),
                        Spacer(),
                        HelpButton(),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const LabelOfFormField(label: 'Email'),
                    const SizedBox(
                      height: 5,
                    ),
                    MyFormField(
                      controller: emailController,
                      validateText: 'your email must not be empty',
                      inputType: TextInputType.text,
                      hintText: 'Eg: email@gmail.com',
                    ),
                    const SizedBox(
                      height: 15,
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
                      height: 15,
                    ),
                    const LabelOfFormField(label: 'Password'),
                    const SizedBox(
                      height: 5,
                    ),
                    MyFormField(
                      controller: passwordController,
                      validateText: 'your password must not be empty',
                      inputType: TextInputType.text,
                      hintText: 'Password',
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    MyMaterialButton(onPressed: () {
                      if(formKey.currentState!.validate()){}
                    }, text: 'Register'),
                    const SizedBox(
                      height: 15,
                    ),
                    const Center(
                        child: LabelOfFormField(
                          label: 'Or',
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    const MyOutLineButton(),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Doesn\'t has any account ?'),
                        MyTextButton(textButton: 'Sign in home', onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => const LoginScreen(),
                            ),
                          );
                        }),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const MyCaption(
                      text:
                      'By regestering your account you are agree to our terms and condition ',
                      fontSize: 15,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            )
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
