import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginForm extends StatefulWidget {
  LoginForm({
    super.key,
    required this.label,
    required this.icon,
    this.obscureText = false,
    this.type = TextInputType.text,
    this.mostrarBoton = false,
    required this.controller,
    required this.validator,
  });

  final String label;
  final IconData icon;
  bool obscureText;
  final bool mostrarBoton;
  final TextInputType type;
  final TextEditingController controller;
  final String? Function(String?) validator;
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: const TextStyle(color: Colors.white),
      keyboardType: widget.type,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        label: Text(
          widget.label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white54,
          ),
        ),
        prefixIcon: Icon(
          widget.icon,
          color: Colors.white,
        ),
        suffixIcon: widget.mostrarBoton
            ? IconButton(
                color: Colors.white,
                onPressed: () {
                  widget.obscureText = !widget.obscureText;
                  setState(() {});
                },
                icon: Icon(widget.obscureText
                    ? Icons.remove_red_eye
                    : Icons.visibility_off),
              )
            : null,
        enabledBorder: const OutlineInputBorder().copyWith(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        border: const OutlineInputBorder(),
      ),
      validator: widget.validator,
      onChanged: (value) {
        //
      },
    );
  }
}
