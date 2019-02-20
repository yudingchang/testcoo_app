import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testcoo_inspector/theme/style.dart';
import 'style.dart';
import 'package:testcoo_inspector/components/TextFields/password.dart';
import 'package:testcoo_inspector/components/TextFields/phoneNumber.dart';
import 'package:testcoo_inspector/components/Buttons/textButton.dart';
import 'package:testcoo_inspector/components/Buttons/primaryButton.dart';
import 'package:testcoo_inspector/components/Buttons/loadingButton.dart';
import 'package:testcoo_inspector/services/validations.dart';
import 'dart:async';

import 'package:testcoo_inspector/auth.dart';
import 'package:testcoo_inspector/data/storage.dart';
import 'package:testcoo_inspector/models/user.dart';
import 'package:testcoo_inspector/screens/Login/login_screen_presenter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> implements LoginScreenContract, AuthStateListener {
  BuildContext context;
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController scrollController = new ScrollController();
  bool autovalidate = false;
  Validations validations = new Validations();

  LoginScreenPresenter _presenter;
  bool _isLoading = false;
  String _username, _password;

  LoginScreenState() {
    _presenter = new LoginScreenPresenter(this);
    var authStateProvider = new AuthStateProvider();
    authStateProvider.subscribe(this);
  }

  _onPressed() {
    print("button clicked");
  }

  onPressed(String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  void _handleSubmitted() {

    final FormState form = formKey.currentState;
    if (!form.validate()) {
      autovalidate = true; // Start validating on every change.
//      showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      setState(() => _isLoading = true);
      form.save();
      _presenter.doLogin(_username, _password);
//      form.save();
//      Navigator.pushNamed(context, "/HomePage");
    }
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    final Size screenSize = MediaQuery.of(context).size;
    //print(context.widget.toString());
    Validations validations = new Validations();
    return new Scaffold(
        key: _scaffoldKey,
        body: new SingleChildScrollView(
            controller: scrollController,
            child: new Container(
              padding: new EdgeInsets.all(16.0),
              decoration: new BoxDecoration(color: const Color(0XFFFFFFFF)),
              child: new Column(
                children: <Widget>[
                  new Container(
                    height: screenSize.height - 32,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Form(
                          key: formKey,
                          autovalidate: autovalidate,
                          child: new Column(
                            children: <Widget>[
                              new PhoneNumber(
                                  bottomMargin: 25.0,
                                  onSaved: (String phoneNumber) {
                                    _username = phoneNumber;
                                  }),
                              new Password(
                                  bottomMargin: 50.0,
                                  onSaved: (String password) {
                                    _password = password;
                                  }),
                              _isLoading ? new LoadingButton(
                                width: screenSize.width,
                                height: 49.0,
                                bottomMargin: 4.0,
                                borderWidth: 0.0,
                                buttonColor: primaryColor,
                              ): new PrimaryButton(
                                buttonName: "登 录",
                                onTap: _handleSubmitted,
                                width: screenSize.width,
                                height: 49.0,
                                bottomMargin: 4.0,
                                borderWidth: 0.0,
                                buttonColor: primaryColor,
                              ),
                            ],
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new TextButton(
                                buttonName: "免费注册",
                                onPressed: () => onPressed("/SignUp"),
                                buttonTextStyle: buttonTextStyle),
                            new TextButton(
                                buttonName: "忘记密码",
                                onPressed: _onPressed,
                                buttonTextStyle: buttonTextStyle)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
  }

  void _showSnackBar(String text) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  @override
  onAuthStateChanged(AuthState state) {
    if(state == AuthState.LOGGED_IN)
      Navigator.of(context).pushReplacementNamed("/HomePage");
  }

  @override
  void onLoginError(String errorTxt) {
    _showSnackBar(errorTxt);
    setState(() => _isLoading = false);
  }

  @override
  void onLoginSuccess(User user) async {
    _showSnackBar(user.toString());
    setState(() => _isLoading = false);
    var storage = new Storage();
    storage.setToken(user.token);

    // 保存密码

    var authStateProvider = new AuthStateProvider();
    authStateProvider.notify(AuthState.LOGGED_IN);
  }
}
