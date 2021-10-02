import 'package:dio/dio.dart';
import 'package:equipment/localization/generated/l10n.dart';
import 'package:equipment/localization/language_constants.dart';
import 'package:equipment/localization/languages.dart';
import 'package:equipment/repositery/app_repositery.dart';
import 'package:equipment/repositery/retrofit/api_client.dart';
import 'package:equipment/repositery/retrofit/model/login_request.dart';
import 'package:equipment/widget/tabs_screen.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  late String email, password;
  bool isLoading = false;
  late ScaffoldMessengerState _messengerState;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: nameController,
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
                child: TextField(
                  controller: passwordController,
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
                    style: ButtonStyle(backgroundColor:
                        MaterialStateProperty.resolveWith<Color>(
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
                    onPressed: () {
                      print(nameController.text);
                      print(passwordController.text);
                      login(nameController.text, passwordController.text);
                    },
                  )),
              const SizedBox(
                height: 8,
              ),
              CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }

  void _loginProcess() {
    Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
  }

  void login(String userName, String password) async {
    final client = AppRepository().getApiClient();
    client
        .login(LoginRequest(userName: userName, password: password))
        .then((value) {
      print(value);
    });
  }
}
