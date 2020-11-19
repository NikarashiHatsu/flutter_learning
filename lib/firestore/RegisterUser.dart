import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:training/components/SnackBarFailed.dart';
import 'package:training/components/SnackBarSuccess.dart';

class RegisterUser extends StatefulWidget {
  final bool canRegister;
  final String email;
  final String password;

  RegisterUser({
    @required this.canRegister, 
    @required this.email, 
    @required this.password
  });

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  bool _isRegistering = false;
  
  Future<void> register(BuildContext context) async {
    if(!_isRegistering) {
      setState(() {
        _isRegistering = true;
      });

      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: widget.email, 
          password: widget.password,
        );

        Scaffold.of(context).showSnackBar(snackBarSuccess('User registered'));
      } on FirebaseAuthException catch (e) {
        if(e.code == 'weak-password') {
          Scaffold.of(context).showSnackBar(snackBarFailed('The password provided is too weak.'));
        } else if(e.code == 'email-already-in-use') {
          Scaffold.of(context).showSnackBar(snackBarFailed('The account already exists for that email.'));
        }
      } catch (e) {
        Scaffold.of(context).showSnackBar(snackBarFailed(e));
      }

      setState(() {
        _isRegistering = false;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () async {
        await register(context);
      },
      color: widget.canRegister && !_isRegistering
        ? Colors.green[500]
        : Colors.grey,
      child: Text(
        _isRegistering
          ? 'Registering...'
          : 'Register',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}