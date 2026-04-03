import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

// bloc
class FormBloc extends Bloc<FormEvent, FormState> {
  FormBloc() : super(FormState()) {
    on<NameChanged>((event, emit) {
      emit(FormState(nama: event.nama, email: state.email));
    });
    on<EmailChanged>((event, emit) {
      emit(FormState(nama: state.nama, email: state.email));
    });
  }
}

class FormPage4 extends StatelessWidget {
  const FormPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
