import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../models/campaign_model.dart';
import '../models/center_model.dart';
// Importe suas páginas de detalhe aqui se existirem
// import 'campaign_detail_page.dart';
// import 'center_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Dados simulados para parecerem com a imagem
  final List<CampaignModel> campaigns = [
    CampaignModel(
      title: "Campanha do\nAgasalho",
      description: "Mês de Setembro", // Usando description como subtítulo
      image: "assets/campaign1.png", // Na prática, seria a ilustração da mulher
    ),
    CampaignModel(
      title: "Doação de\nAlimentos",
      description: "Mês de Outubro",
      image: "assets/campaign2.png",
    ),
  ];

  final List<DonationCenterModel> centers = [
    DonationCenterModel(
      name: "Centro de Doação Hermes",
      address: "Rua X",
      hours: "07:00 às 19:00",
      image: "assets/center1.jpg",
    ),
    DonationCenterModel(
      name: "Fraternidade Espírita\nIrmão Glacus", // Quebra de linha simulada
      address: "Av Y",
      hours: "08:00 às 20:00",
      image: "assets/center2.jpg",
    ),
    DonationCenterModel(
      name: "Centro de Doação Hermes",
      address: "Rua Z",
      hours: "07:00 às 19:00",
      image: "assets/center3.jpg",
    ),
  ];

  int currentBanner = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      
      // Removemos a AppBar padrão para fazer o header customizado
      body: Column(
        children: [
          _buildCustomHeader(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero, // Padding controlado internamente
              children: [
                const SizedBox(height: 20),
                
                // Título Campanhas
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Campanhas:",
                    style: TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // ---- Carousel Customizado ----
                SizedBox(
                  height: 190,
                  child: PageView.builder(
                    controller: PageController(viewportFraction: 0.92),
                    itemCount: campaigns.length,
                    onPageChanged: (index) => setState(() => currentBanner = index),
                    itemBuilder: (context, index) {
                      return _buildBannerCard(campaigns[index]);
                    },
                  ),
                ),

                const SizedBox(height: 10),

                // Indicadores (Dots)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    campaigns.length + 2, // +2 só para simular os dots extras da imagem
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: index == currentBanner 
                            ? AppColors.bannerBlue 
                            : Colors.grey.shade400,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),
                
                // Título Centros
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Centros de Doação Próximos a Você:",
                    style: TextStyle(
                      fontSize: 17, 
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // ---- Lista de Centros ----
                ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: centers.length,
                  itemBuilder: (context, index) {
                    return _buildCenterCard(centers[index]);
                  },
                ),
                
                // Espaço extra no final para não ficar colado na navbar
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.navSelected,
        unselectedItemColor: AppColors.navUnselected,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined, size: 28), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border, size: 28), label: "Doar"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none, size: 28), label: "Alertas"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline, size: 28), label: "Perfil"),
        ],
      ),
    );
  }

  // Widget do Header Azul com Logo Triangular
  Widget _buildCustomHeader() {
    return Container(
      width: double.infinity,
      height: 110, // Altura ajustada
      color: AppColors.headerBlue,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(bottom: 15),
      child: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Simulação do Logo Triangular
            Container(
              width: 50,
              height: 40,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  // Substitua pelo asset real do logo FEIG
                  image: AssetImage('assets/logo_triangulo.png'), 
                  fit: BoxFit.contain,
                ),
              ),
              // Fallback visual se não tiver imagem:
              child: const Icon(Icons.change_history, size: 40, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  // Widget do Card do Banner
  Widget _buildBannerCard(CampaignModel campaign) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: AppColors.bannerBlue,
        borderRadius: BorderRadius.circular(24),
        // Gradiente sutil para simular a curva
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF4B8CB3), AppColors.bannerBlue],
        ),
      ),
      child: Stack(
        children: [
          // Textos à esquerda
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  campaign.title, // "Campanha do Agasalho"
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  campaign.description, // "Mês de Setembro"
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                const Text(
                  "Aqueça corações, ❤️\ndoe agasalhos.",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          
          // Imagem/Ilustração à direita
          Positioned(
            right: 10,
            bottom: 0,
            top: 20,
            child: Image.asset(
              campaign.image, // Imagem da mulher com roupas
              fit: BoxFit.contain,
              // Fallback para não quebrar se não tiver imagem
              errorBuilder: (c, o, s) => const Icon(Icons.checkroom, size: 80, color: Colors.white24),
            ),
          ),
        ],
      ),
    );
  }

  // Widget do Item da Lista (Centro)
  Widget _buildCenterCard(DonationCenterModel center) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      // Não precisamos de altura fixa, deixa o conteúdo definir
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagem Arredondada
          Container(
            width: 130,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                center.image,
                fit: BoxFit.cover,
                errorBuilder: (c, o, s) => Container(color: Colors.grey[300]),
              ),
            ),
          ),
          
          const SizedBox(width: 14),

          // Textos
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 2),
                Text(
                  center.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 6),
                
                // RichText para formatar "Horário..." e "Aberto"
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 12, 
                      color: AppColors.textSecondary,
                      fontFamily: 'Segoe UI', // Fonte padrão do sistema ou use Google Fonts
                    ),
                    children: [
                      const TextSpan(text: "Horário de funcionamento: "),
                      TextSpan(text: "${center.hours} "),
                      const TextSpan(
                        text: "Aberto",
                        style: TextStyle(
                          color: AppColors.statusOpen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}