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

//ui
class FormPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Bloc")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<FormBloc, FormState>(
          builder: (context, state) {
            return Column(
              children: [
                TextField(
                  onChanged: (value) =>
                      context.read<FormBloc>().add(NameChanged(value)),
                ),
                TextField(
                  onChanged: (value) =>
                      context.read<FormBloc>().add(EmailChanged(value)),
                ),
                ElevatedButton(onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Submit Sukses!"))
                  );
                }, child: Text("Submit")),
                SizedBox(height: 10),
                Text("Nama: ${state.nama}"),
                Text("Nama: ${state.email}"),
              ],
            );
          },
        ),
      ),
    );
  }
}
