import 'package:flutter/material.dart';
import 'package:uic/login_uic.dart';

class LoginUicScreen  extends StatefulWidget {
  LoginUicScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginUicScreenState createState() => _LoginUicScreenState();
}

class _LoginUicScreenState extends State<LoginUicScreen> {

  LoginUicController _controller;

  @override
  void initState() {
    super.initState();
    _controller = LoginUicController(
      initialState: LoginUicState.signIn,
      onSignIn: (username, password) => _signIn(username, password),
      onSignedIn: (context) => Navigator.push(context,
        MaterialPageRoute(builder: (context) =>
            LoginUicSignedInScreen(title: 'LoginUic Demo')),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: LoginUic(
        controller: _controller,
      ),
    );
  }

  Future<void> _signIn(String username, String password) async {
    await Future.delayed(Duration(seconds: 3));
    if (username != 'demo') {
      throw Exception();
    }
    if (password != '1234') {
      throw Exception();
    }
  }
}

class LoginUicSignedInScreen extends StatelessWidget {
  LoginUicSignedInScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Signed In'),
      ),
    );
  }
}