import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_therapy/consent/cubit/consent_form_cubit.dart';
import 'package:music_therapy/consent/view/consent_form.dart';

void main() {
  runApp(ConsentFormApp());
}

class ConsentFormApp extends StatelessWidget {
  const ConsentFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consent Form Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => ConsentFormCubit(),
        child: const ConsentFormScreen(),
      ),
    );
  }
}
