// =============================================
// CadastroReceptor.dart (adicional pois estava na imagem)
// =============================================
import 'package:flutter/material.dart';

class CadastroReceptor extends StatelessWidget {
  const CadastroReceptor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              const SizedBox(height: 30),
              Center(child: Image.asset('assets/logo.png', height: 80)),
              const SizedBox(height: 20),
              const Text(
                'Cadastro de Receptor',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              _buildField('Nome'),
              _buildField('Email'),
              _buildField('CNPJ', helper: 'Porque precisamos do seu CNPJ'),
              _buildField('Telefone'),
              _buildField('CEP'),
              _buildField('Senha', obscure: true),

              const SizedBox(height: 20),
              _submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, {bool obscure = false, String? helper}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          helperText: helper,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF3C1F1A),
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      onPressed: () {},
      child: const Text('Cadastrar'),
    );
  }
}


