import 'package:flutter/material.dart';
import 'package:training/pages/LoginPage.dart';
import 'package:training/firestore/RegisterUser.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _emailVerified = false;
  bool _passwordVerified = false;
  bool _canRegister = false;
  
  void verifyEmail(String text) {
    String _email = _emailController.text;

    setState(() {
      _emailVerified = _email.length >= 4
        ? true
        : false;
    });

    checkCanRegister();
  }

  void verifyPassword(String text) {
    String _password = _passwordController.text;
    String _confirmPassword = _confirmPasswordController.text;

    setState(() {
      _passwordVerified = (_password.length >= 4 && _confirmPassword.length >= 4) && (_password == _confirmPassword)
        ? true
        : false;
    });

    checkCanRegister();
  }

  void checkCanRegister() {
    setState(() {
      _canRegister = _emailVerified == true && _passwordVerified == true
        ? true
        : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 14.0),
                  child: Text(
                    'Register Page',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                TextField(
                  onChanged: verifyEmail,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  controller: _emailController,
                ),
                TextField(
                  onChanged: verifyPassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  controller: _passwordController,
                ),
                TextField(
                  onChanged: verifyPassword,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                  ),
                  obscureText: true,
                  controller: _confirmPasswordController,
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
                            builder: (context) => LoginPage(), 
                          ));
                        },
                        child: Text(
                          "Alreay have an account?",
                          style: TextStyle(color: Colors.blueAccent)
                        ),
                      ),
                      RegisterUser(
                        canRegister: _canRegister, 
                        email: _emailController.text, 
                        password: _passwordController.text,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}