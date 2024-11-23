import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      autovalidateMode: autovalidateMode,
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                'Enter your details to login to the book discussion space'),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !value.contains("@") ||
                    !value.contains('.')) {
                  return 'Please enter a valid email address';
                }
                if (value.length < 8) {
                  return 'Must be more than 8 charaters';
                }
                return null;
              },
              decoration: const InputDecoration(
                  icon: Icon(Icons.email), hintText: 'email'),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextFormField(
              validator: Validators.patternString(
                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                  'Invalid Password'),
              decoration: const InputDecoration(
                  icon: Icon(Icons.lock), hintText: 'password'),
              keyboardType: TextInputType.visiblePassword,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () {
                _formKey.currentState!.validate();
              },
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
