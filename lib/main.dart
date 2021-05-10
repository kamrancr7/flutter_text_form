import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form Validation'),
        ),
        body: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _myFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Form(
        key: _myFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter Email Address',
                border: OutlineInputBorder(),
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return 'Please Provide Email Address';
                }
                return null;
              },
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: (value){
                if(value.length < 6){
                  return 'Password must contain atleast 6 charaters';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if(_myFormKey.currentState.validate()){
                  print('All ok');
                }
              },
              child: Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
