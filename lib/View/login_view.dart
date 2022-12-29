import 'package:flutter/material.dart';
import 'package:mvvm/Res/round_button.dart';
import 'package:mvvm/Utils/routes/routes_name.dart';
import 'package:mvvm/Utils/utils.dart';
import 'package:mvvm/View_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

ValueNotifier _obsecurepassword = ValueNotifier(true);

TextEditingController econtroller = TextEditingController();
TextEditingController pcontroller = TextEditingController();

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: TextField(
                controller: econtroller,
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: const Icon(Icons.email_outlined),
                  fillColor: Colors.blueGrey.shade100,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50)),
                ),
              )),
              const SizedBox(
                height: 20,
              ),
              ValueListenableBuilder(
                  valueListenable: _obsecurepassword,
                  builder: (context, value, child) {
                    return Center(
                        child: TextField(
                      obscureText: value,
                      obscuringCharacter: '*',
                      controller: pcontroller,
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: InkWell(
                            onTap: (() {
                              _obsecurepassword.value =
                                  !_obsecurepassword.value;
                            }),
                            child: Icon(value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined)),
                        fillColor: Colors.blueGrey.shade100,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ));
                  }),
              const SizedBox(
                height: 40,
              ),
              RoundButton(
                  title: 'Login',
                  callback: () {
                    if (econtroller.text.isEmpty) {
                      Utils().flushBarErrorMessage('Enter Email', context);
                    } else if (pcontroller.text.isEmpty) {
                      Utils().flushBarErrorMessage('Enter password', context);
                    } else if (pcontroller.text.length < 6) {
                      Utils().flushBarErrorMessage(
                          'Enter password with 6 or more digits', context);
                    } else {
                      Map data = {
                        "email": econtroller.text,
                        "password": pcontroller.text
                      };

                      authViewModel.loginApi(data, context);
                      print('API Called');
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.signUp);
                  },
                  child: Text("Don't have account? Signup")),
            ],
          ),
        ),
      ),
    );
  }
}
