import 'package:equipment/localization/generated/l10n.dart';
import 'package:equipment/repositery/app_repositery.dart';
import 'package:equipment/repositery/retrofit/model/login_request.dart';
import 'package:equipment/widget/tabs_screen.dart';
import 'package:equipment/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';
import 'login_controller.dart';
import 'login_state.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context)!.loginPageAppBarTitle),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 150.0,
                width: 190.0,
                padding: EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                ),
                child: Center(
                  child: Image.asset('assets/images/logo.jpg'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              _SignInForm()
            ],
          ),
        ),
      ),
    );
  }
}

class _SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<_SignInForm> {
  late ScaffoldMessengerState _messengerState;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _controller = Get.put(LoginController());
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Form(
        key: _key,
        autovalidateMode:
            _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              controller: _emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context)!.userName_required;
                }
                return null;
              },
              keyboardType: TextInputType.text,
              maxLines: 1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: S.of(context)!.loginPageUserNameHint,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.text,
              maxLines: 1,
              minLines: 1,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context)!.password_required;
                }
                return null;
              },
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: S.of(context)!.loginPagePasswordHint,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.5);
                    return Theme.of(context)
                        .colorScheme
                        .primary; // Use the component's default.
                  },
                )),
                child: Text(S.of(context)!.loginPageButton),
                onPressed: _controller.state is LoginLoading
                    ? () {}
                    : () {
                        _onLoginButtonPressed(context);
                      },
              )),
          const SizedBox(
            height: 8,
          ),
          if (_controller.state is LoginLoading)
            Center(child: CircularProgressIndicator())
        ]),
      );
    });
  }

  _onLoginButtonPressed(BuildContext context) {
    if (_key.currentState!.validate()) {
      Navigator.of(context).pop();
      _controller
          .login(_emailController.text, _passwordController.text)
          .then((value) => {
                if (value is LoginSuccessUser) {_loginProcess()}
                else if(value is LoginFailure){
                customSnackBar(context,msg:value.error)
                }
              });
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  void _loginProcess() {
    Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
  }
}
