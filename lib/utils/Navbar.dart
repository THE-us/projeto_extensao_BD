import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

// importe suas telas aqui
import '../pages/Cadastro/EscolhaAcesso.dart';
import '../pages/home.dart';
import '../pages/Cadastro/Login.dart';

class NavBarMain extends StatefulWidget {
  const NavBarMain({super.key});
  @override
  State<NavBarMain> createState() => _NavBarMainState();
}

class _NavBarMainState extends State<NavBarMain> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const EscolhaAcesso(),
      const Login(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: const Color(0xFF3C1F1A),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.notification_important),
        title: ("Notification"),
        activeColorPrimary: const Color(0xFF3C1F1A),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.login),
        title: ("Login"),
        activeColorPrimary: const Color(0xFF3C1F1A),
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),

      navBarStyle: NavBarStyle.style9, // você pode mudar o estilo
    );
  }
}
