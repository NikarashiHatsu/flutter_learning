import 'package:flutter/material.dart';
import 'package:training/pages/RegisterPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _canLogin = false;

  void _handleLogin(String text) {
    String usernameText = _usernameController.text;
    String passwordText = _passwordController.text;

    if(usernameText.length >= 4 && passwordText.length >= 4) {
      setState(() {
        _canLogin = true;
      });
    } else {
      setState(() {
        _canLogin = false;
      });
    }
  }

  void _authenticate() {
    if(_canLogin) {
      String username = _usernameController.text;
      String password = _passwordController.text;

      // TODO: Make Authentication
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 14.0),
              child: Text(
                'Login Page',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
              controller: _usernameController,
              onChanged: _handleLogin
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              controller: _passwordController,
              onChanged: _handleLogin,
            ),
            Container(
              margin: EdgeInsets.only(top: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ));
                    },
                    child: Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.blueAccent)
                    ),
                  ),
                  FlatButton(
                    onPressed: _authenticate,
                    color: _canLogin
                      ? Colors.green[500]
                      : Colors.grey,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}