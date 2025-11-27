import 'package:flutter/material.dart';
import 'pages/home.dart'; // Certifique-se que o arquivo da home tem esse nome
import 'utils/app_colors.dart';

import '../pages/Cadastro/EscolhaAcesso.dart';
import '../pages/home.dart';
import '../pages/Cadastro/Login.dart';

import 'utils/Navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projeto de Doações',
      theme: ThemeData(
        // Define a cor de fundo padrão para todas as telas (o cinza claro da imagem)
        scaffoldBackgroundColor: AppColors.background,
        
        // Define o tema da AppBar para outras telas (já que a Home tem header customizado)
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.headerBlue,
          foregroundColor: Colors.white, // Cor do texto/ícones na AppBar
          elevation: 0, // Remove a sombra para ficar mais moderno (flat)
          centerTitle: true,
        ),
        
        // Define o esquema de cores base do Material 3
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.headerBlue,
          background: AppColors.background,
          // Define a cor primária para botões e interações
          primary: AppColors.headerBlue, 
        ),
        
        useMaterial3: true,
      ),
      home: const NavBarMain(),
      routes: {
        '/Home': (_) => const HomePage(),
        '/Notifications': (_) => const Login(),
        '/Cadastro': (_) => const EscolhaAcesso(),
      },
    );
  }
}