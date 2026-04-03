import 'package:flutter/material.dart';

abstract class FormEvent {}

class NameChanged extends FormEvent {
  final String nama;
  NameChanged(this.nama);
}

class EmailChanged extends FormEvent {
  final String email;
  EmailChanged(this.email);
}

// state
class FormState {
  final String nama;
  final String email;

  FormState({this.nama = "", this.email = ""});
}

class FormPage4 extends StatelessWidget {
  const FormPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}