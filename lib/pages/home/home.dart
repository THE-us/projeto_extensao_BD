// lib/pages/home.dart
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../models/campaign_model.dart';
import '../models/center_model.dart';
import '../database/centers_data.dart';
import 'campaign_detail_page.dart';
import 'center_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CampaignModel> campaigns = [
    CampaignModel(
      title: "Campanha do\nAgasalho",
      description: "Mês de Setembro",
      image: "assets/campaign1.png",
    ),
    CampaignModel(
      title: "Doação de\nAlimentos",
      description: "Mês de Outubro",
      image: "assets/campaign2.png",
    ),
  ];

  int currentBanner = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.headerBlue,
      
      body: Column(
        children: [
          _buildCustomHeader(),

          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const SizedBox(height: 25),
                    
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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        campaigns.length, 
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

                    ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: centersData.length,
                      itemBuilder: (context, index) {
                        return _buildCenterCard(centersData[index]);
                      },
                    ),
                    
                    const SizedBox(height: 20),
                  ],
                ),
              ),
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

  Widget _buildCustomHeader() {
    return Container(
      width: double.infinity,
      height: 140, 
      color: AppColors.headerBlue, 
      alignment: Alignment.center,
      child: SafeArea(
        bottom: false,
        child: Container(
          width: 50,
          height: 40,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/logo_triangulo.png'), 
              fit: BoxFit.contain,
            ),
          ),
          child: const Icon(Icons.change_history, size: 40, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildBannerCard(CampaignModel campaign) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CampaignDetailPage(campaign: campaign),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: AppColors.bannerBlue,
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF4B8CB3), AppColors.bannerBlue],
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    campaign.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    campaign.description,
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
            Positioned(
              right: 10,
              bottom: 0,
              top: 20,
              child: Image.asset(
                campaign.image,
                fit: BoxFit.contain,
                errorBuilder: (c, o, s) =>
                    const Icon(Icons.checkroom, size: 80, color: Colors.white24),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterCard(CenterDetailModel center) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CenterDetailPage(center: center),
          ),
        );
      },
      child: Container(
        color: Colors.transparent,
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                ),
              ),
            ),
            
            const SizedBox(width: 14),

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
                  
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 12, 
                        color: AppColors.textSecondary,
                        fontFamily: 'Segoe UI',
                      ),
                      children: [
                        const TextSpan(text: "Horário de funcionamento: "),
                        TextSpan(text: center.hours),
                        const TextSpan(
                          text: "  Aberto",
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
      ),
    );
  }
}