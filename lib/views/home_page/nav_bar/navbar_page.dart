import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umatter/views/home_page/home_page.dart';
import 'package:umatter/views/home_page/settings_page/settings_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:umatter/views/quotes_page/quotes_page.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({Key? key}) : super(key: key);

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  List pages = [
    const HomePage(),
    const QuotesPage(),
    const SettingsPage(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: onTap,
          currentIndex: currentIndex,
          elevation: 0.0,
          selectedFontSize: 0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              label: "HomePage",
              tooltip: "Home Page",
              activeIcon: SvgPicture.asset(
                "assets/icons/home.svg",
                color: Colors.grey[1000],
              ),
              icon: SvgPicture.asset(
                "assets/icons/home.svg",
                color: Colors.grey[600],
              ),
            ),
            const BottomNavigationBarItem(
              label: "Quotes",
              tooltip: "Quotes",
              icon: FaIcon(
                FontAwesomeIcons.quoteLeft,
                semanticLabel: "Quotes",
              ),
            ),
            const BottomNavigationBarItem(
              label: "Settings",
              tooltip: "Settings",
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
