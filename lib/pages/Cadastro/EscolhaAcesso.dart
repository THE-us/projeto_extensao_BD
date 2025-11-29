import 'package:flutter/material.dart';


class EscolhaAcesso extends StatelessWidget {
const EscolhaAcesso({super.key});


@override
Widget build(BuildContext context) {
  final buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF3C1F1A),
    foregroundColor: Colors.white,
    minimumSize: const Size(double.infinity, 52),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
);


  return Scaffold(
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Center(child: Image.asset('assets/logo.png', height: 80)),
              const SizedBox(height: 40),
              const Text(
                'Escolha a forma de se cadastrar',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: buttonStyle,
                onPressed: () => Navigator.pushNamed(context, '/cadVoluntario'),
                child: const Text('Voluntário'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: buttonStyle,
                onPressed: () => Navigator.pushNamed(context, '/cadReceptor'),
                child: const Text('Receptor'),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/login'),
                child: const Text(
                  'Já tem uma conta? Entrar',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}