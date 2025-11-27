import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class HelpRequestPage extends StatefulWidget {
  const HelpRequestPage({Key? key}) : super(key: key);

  @override
  State<HelpRequestPage> createState() => _HelpRequestPageState();
}

class _HelpRequestPageState extends State<HelpRequestPage> {
  // Controladores
  final _quantityController = TextEditingController();
  final _sizeController = TextEditingController();
  final _urgencyController = TextEditingController();
  final _timeController = TextEditingController();

  // Variável para o Dropdown
  String? _selectedCategory;
  final List<String> _categories = [
    'Cesta Básica',
    'Roupas',
    'Medicamentos',
    'Móveis',
    'Outros'
  ];

  @override
  void dispose() {
    _quantityController.dispose();
    _sizeController.dispose();
    _urgencyController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Usando fundo branco puro para esta tela específica para bater com o design,
    // mas você pode usar AppColors.background se preferir.
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.feigBrown),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            
            // LOGO (Placeholder ou Imagem)
            SizedBox(
              height: 100,
              child: Image.asset(
                'assets/imgs/feig_logo.png', // Verifique se esse arquivo existe
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.change_history, size: 60, color: AppColors.feigBrown),
                      Text("FEIG", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.feigBrown))
                    ],
                  );
                },
              ),
            ),
            
            const SizedBox(height: 24),

            // TÍTULO
            const Text(
              "Precisa de ajuda?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: AppColors.feigBrown,
              ),
            ),
            
            const SizedBox(height: 32),

            // FORMULÁRIO
            
            // 1. Categoria (Dropdown)
            _buildDropdownField(),
            const SizedBox(height: 16),

            // 2. Quantidade
            _buildCustomTextField(
              controller: _quantityController,
              hintText: "Quantidade",
            ),
            const SizedBox(height: 16),

            // 3. Tamanho
            _buildCustomTextField(
              controller: _sizeController,
              hintText: "Tamanho (se for roupa)",
            ),
            const SizedBox(height: 16),

            // 4. Urgência
            _buildCustomTextField(
              controller: _urgencyController,
              hintText: "Urgência / Prazo",
            ),
            const SizedBox(height: 16),

            // 5. Horário
            _buildCustomTextField(
              controller: _timeController,
              hintText: "Horário preferencial",
            ),
            
            const SizedBox(height: 40),

            // BOTÃO ENVIAR
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  print("Enviando dados: ${_selectedCategory}, ${_quantityController.text}");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.feigBrown,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Enviar",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomTextField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: AppColors.inputBorder),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: AppColors.textPrimary),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          isDense: true,
        ),
      ),
    );
  }

  Widget _buildDropdownField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: AppColors.inputBorder),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedCategory,
          hint: Text(
            "Categoria",
            style: TextStyle(color: Colors.grey[400], fontSize: 14),
          ),
          icon: Icon(Icons.arrow_drop_down, color: Colors.grey[400]),
          isExpanded: true,
          items: _categories.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: const TextStyle(color: AppColors.textPrimary)),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _selectedCategory = newValue;
            });
          },
        ),
      ),
    );
  }
}