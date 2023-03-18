import 'package:flutter/material.dart';
import 'package:authentest_129/auth_service.dart';
import 'package:auth_buttons/auth_buttons.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

int isRadio = 3;
bool isCheck = false;

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _tel = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var children = [
      buildEmailInput,
      buildPasswordInput(),
      buildNameInput(),
      buildTelInput(),
      buildEmailSignUp(),
      build(context)
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New User"),
      ),
      body: SafeArea(
          child: Center(
        child: Form(
          key: _formKey,
          child: SizedBox(
            width: 320,
            child: ListView(children: [
              buildEmailInput(),
              buildPasswordInput(),
              buildNameInput(),
              buildTelInput(),
              buildEmailSignUp(),
            ]),
          ),
        ),
      )),
    );
  }

  TextFormField buildPasswordInput() {
    return TextFormField(
      controller: _password,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: "Password",
      ),
    );
  }

  Widget buildNameInput() {
    return TextFormField(
      controller: _name,
      decoration: const InputDecoration(
        labelText: "Name",
      ),
    );
  }

  Widget buildTelInput() {
    return TextFormField(
      controller: _tel,
      decoration: const InputDecoration(
        labelText: "Tel",
      ),
    );
  }

  TextFormField buildEmailInput() {
    return TextFormField(
      controller: _email,
      decoration: const InputDecoration(
        labelText: "E-mail",
      ),
    );
  }

  buildEmailSignUp() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: EmailAuthButton(
        text: "Sign Up",
        onPressed: () {
          AuthService()
              .signUpWithEmail(
                  _email.text, _password.text, _name.text, _tel.text)
              .then((value) => Navigator.pop(context));
        },
      ),
    );
  }

  @override
  Widget build2(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("กรุณาเลือก"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            RadioListTile(
              title: Text("อาจารย์"),
              controlAffinity: ListTileControlAffinity.platform,
              value: 1,
              groupValue: isRadio,
              activeColor: Colors.amber,
              onChanged: ((value) {
                setState(() {
                  isRadio = value!;
                });
              }),
            )
          ],
        ),
      ),
    );
  }
}
