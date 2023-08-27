import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:unahplus/src/widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(12, 53, 106, 150),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 30),
            const CircleAvatar(
              radius: 70.0,
              backgroundColor: Colors.black54,
              child: Icon(
                Icons.movie,
                color: Colors.amber,
                size: 80,
              ),
              // backgroundImage: AssetImage('images/unahplus.png'),
            ),
            const SizedBox(height: 17),
            const Text(
              'UnahPlus',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
            const SizedBox(height: 40),
            LoginForm(
                label: 'Username',
                icon: Icons.person,
                controller: usernameController,
                validator: (value) {
                  if (value != 'username') {
                    return 'Invalid username';
                  }
                  return null;
                }),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            LoginForm(
                label: 'Password',
                icon: Icons.lock,
                obscureText: true,
                mostrarBoton: true,
                controller: passwordController,
                validator: (value) {
                  if (value != 'password') {
                    return 'Invalid password';
                  }
                  return null;
                }),
            const SizedBox(
              height: 10,
            ),
            const Spacer(),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.amber),
        ),
        onPressed: () {
          login(usernameController.text, passwordController.text);
        },
        child: const Text(
          'Login',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void login(String username, String password) async {
    try {
      Response response = await post(
          Uri.parse('https://fakestoreapi.com/auth/login'),
          body: {'username': username, 'password': password});
      if (response.statusCode == 200) {
        Navigator.pushNamed(context, '/principal');
        var data = jsonDecode(response.body.toString());
        print(data);
        print('Login successful');
      } else {
        print('Failes');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
