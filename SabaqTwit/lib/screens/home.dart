import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sabaqtwit/screens/account_screen.dart';
import 'package:sabaqtwit/screens/login_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeDisplay extends StatefulWidget {
  const HomeDisplay({Key? key}) : super(key: key);

  @override
  State<HomeDisplay> createState() => _HomeDisplayState();
}


class _HomeDisplayState extends State<HomeDisplay> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('MEKTEP'),
        actions: [
          IconButton(
            onPressed: () {
              if ((user == null)) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AccountScreen()),
                );
              }
            },
            icon: Icon(
              Icons.person,
              color: (user == null) ? Colors.white : Colors.yellow,
            ),
          ),
        ],
      ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                  child: Center(
                    child: Text('Здесь что то будет'),
                  )
              ),
              ListTile(
                title: Text('Тех. поддержка'),
                trailing: Icon(Icons.manage_accounts),
                onTap: () {Navigator.pop(context);},
              ),
              ListTile(
                title: Text('Настройки'),
                trailing: Icon(Icons.settings),
                onTap: () {Navigator.pop(context);},
              ),
              ListTile(
                title: Text('Правила и условия'),
                trailing: Icon(Icons.contact_page_rounded),
                onTap: () {Navigator.pop(context);},
              )
            ],
          ),
        ),
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset('assets/images/menu.svg'),
            SvgPicture.asset('assets/images/profile.svg'),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          'Hello,',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xff333333),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Text(
          'John Doe',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xff333333),
          ),
        ),
      ),
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff333333),
                  ),
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  children: [
                  CategoryCard(
                  title: 'Clothing',
                  image: 'assets/images/clothing.svg',
                  color: Color(0xffFFA8A8),
                ),
                CategoryCard(
                    title: 'Shoes',
                    image: 'assets/images/shoes.svg',
                    color: Color(0xffFFE08C),
              ),
              CategoryCard(
                title: 'Accessories',
                image: 'assets/images/accessories.svg',
                color: Color(0xffB0E0E6),
              ),
              CategoryCard(
                title: 'Electronics',
                image: 'assets/images/electronics.svg',
                color: Color(0xffC4C4C4),
              ),
            ],
          ),
        ),
        ],
      ),
    ),
    ),
    ],
    ),
    ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String image;
  final Color color;

  const CategoryCard({
    Key? key,
    required this.title,
    required this.image,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image,
            width: 48,
            height: 48,
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xff333333),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildContainer(IconData iconData, String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 50,
          ),
          SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
//
// SingleChildScrollView(
// child: Column(
// children: [
// Container(
// child: CarouselSlider(
// options: CarouselOptions(
// autoPlay: true,
// aspectRatio: 2.0,
// enlargeCenterPage: true,
// ),
// items: [
// ClipRRect(
// borderRadius: BorderRadius.circular(12.0),
// child: Image(
// image: NetworkImage('https://www.google.com/url?sa=i&url=https%3A%2F%2Falmaty.tv%2Fkz%2Fnews%2Fobrazovanie-i-nauka%2F1930-kazakstanda-bilim-ministrligi-men-dgogary-bilim-dgane-gylym-ministrligin-kuru-usynyldy&psig=AOvVaw1iqYze6Jxuu7_MEkHsSS-S&ust=1680639626456000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCIjPlNHEjv4CFQAAAAAdAAAAABAW'),
// alignment: Alignment.center,
// height: double.infinity,
// width: double.infinity,
// fit: BoxFit.cover,
// ),
// ),
// ],
// ),
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// _buildContainer(Icons.account_circle, 'Кеңестер'),
// _buildContainer(Icons.shopping_cart, 'Топ тізімі'),
// _buildContainer(Icons.favorite, 'Дерек. қоры'),
// _buildContainer(Icons.settings, 'Аналитика'),
// ],
// ),
// ],
// )
// )