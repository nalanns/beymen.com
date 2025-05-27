// ignore_for_file: deprecated_member_use, unused_label, unused_import
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hover_menu/hover_menu.dart';

// sayfalar
import 'nav_pages/repair_page.dart';
import 'nav_pages/order_tracking_page.dart';
import 'nav_pages/campaigns_page.dart';
import 'nav_pages/the_one_page.dart';
import 'nav_pages/services_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beymen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.titilliumWebTextTheme(),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 98, 98, 98),
            textStyle: const TextStyle(fontSize: 14),
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const Scaffold(body: BeymenHomePage()),
    );
  }
}

class BeymenHomePage extends StatefulWidget {
  const BeymenHomePage({super.key});

  @override
  State<BeymenHomePage> createState() => _BeymenHomePageState();
}

class CustomNavButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomNavButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  State<CustomNavButton> createState() => _CustomNavButtonState();
}

class _BeymenHomePageState extends State<BeymenHomePage> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex = 0;

  final List<String> carouselImages = [
    'img/carousel/caro1.jpg',
    'img/carousel/caro2.png',
    'img/carousel/caro3.jpg',
    'img/carousel/caro4.jpg',
    'img/carousel/caro5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final carouselHeight = screenHeight * 0.8;

    return SafeArea(
      child: ListView(
        children: [
          // Navbar Kısmı
          const BeymenNavBar(),

          // Carousel Kısmı
          SizedBox(
            height: carouselHeight,
            child: Stack(
              children: [
                CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    height: carouselHeight,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1.0,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayAnimationDuration: const Duration(
                      milliseconds: 800,
                    ),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items:
                      carouselImages.map((imagePath) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(imagePath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                ),

                // Sol ok butonu
                Positioned(
                  left: 0,
                  top: carouselHeight / 2 - 24,
                  child: GestureDetector(
                    onTap: () {
                      _carouselController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        shape: BoxShape.rectangle,
                      ),
                      child: const Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ),

                // Sağ ok butonu
                Positioned(
                  right: 0,
                  top: carouselHeight / 2 - 24,
                  child: GestureDetector(
                    onTap: () {
                      _carouselController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        shape: BoxShape.rectangle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward_sharp,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ),

                // Nokta göstergesi (indicator)
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        carouselImages.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap:
                                () => _carouselController.animateToPage(
                                  entry.key,
                                ),
                            child: Container(
                              width: 10,
                              height: 10,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      _currentIndex == entry.key
                                          ? Colors.white
                                          : Colors.black.withOpacity(0.8),
                                ),
                                shape: BoxShape.circle,
                                color:
                                    _currentIndex == entry.key
                                        ? Colors.black
                                        : Colors.white.withOpacity(0.8),
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 100, color: Colors.white),

          // Kadın ve Erkek Resimleri
          if(screenWidth > 1000) ...[
            
          
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              ProductCard(
                imagePath: 'img/main/kadın.jpg',
                title: 'HOUSE OF ART',
                subtitle: 'Kadın',
                width: screenWidth<1300 ?  screenWidth * 0.4 : 600,
                height: screenWidth<1300 ? screenHeight * 0.6 : 600,
              ),
              SizedBox(width: screenWidth<1300 ? 50 : 100),
              ProductCard(
                imagePath: 'img/main/erkek.jpg',
                title: 'HOUSE OF ELEGANCE',
                subtitle: 'Erkek',
                width: screenWidth<1300 ? screenWidth * 0.4 : 600,
                height: screenWidth<1300 ? screenHeight * 0.6 : 600,
              ),
              const Spacer(),
            ],
          ),
          const Divider(height: 100, color: Colors.white),

          // 3'lü ProductCard'lar
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              ProductCard(
                imagePath: 'img/main/sunum.jpg',
                title: 'MİNİMAL SUNUMLAR',
                subtitle: 'Sofra & Mutfak',
                width: screenWidth<1400 ? screenWidth * 0.3 : 400,
                height: screenWidth<1400 ? screenHeight * 0.4 : 500,
              ),
              SizedBox(width: screenWidth<1400 ? 40 : 100),
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                ), // Sadece bu kartı 50px aşağı it
                child: ProductCard(
                  imagePath: 'img/main/tekn.jpg',
                  title: 'KURTARICI GÜÇ',
                  subtitle: 'Küçük Ev Aletleri',
                width: screenWidth<1400 ? screenWidth * 0.3 : 400,
                height: screenWidth<1400 ? screenHeight * 0.4 : 400,
                ),
              ),
              SizedBox(width: screenWidth<1400 ? 40 : 100),
              ProductCard(
                imagePath: 'img/main/canta.jpg',
                title: 'FARK YARATANLAR',
                subtitle: 'Çanta',
                width: screenWidth<1400 ? screenWidth * 0.3 : 400,
                height: screenWidth<1400 ? screenHeight * 0.4 : 500,
              ),
              const Spacer(),
            ],
          ),
          const Divider(height: 100, color: Colors.white),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              ProductCard(
                imagePath: 'img/main/parf.jpg',
                title: 'TAZELEYİCİ NOTALAR',
                subtitle: 'Parfüm',
                width: screenWidth<1400 ? screenWidth * 0.3 : 400,
                height: screenWidth<1400 ? screenHeight * 0.4 : 500,
              ),
              SizedBox(width: screenWidth<1400 ? 40 : 100),
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                ), // Sadece bu kartı 50px aşağı it
                child: ProductCard(
                  imagePath: 'img/main/gozl.jpg',
                  title: 'ANAHTAR PARÇA',
                  subtitle: 'Güneş Gözlüğü',
                width: screenWidth<1400 ? screenWidth * 0.3 : 400,
                height: screenWidth<1400 ? screenHeight * 0.4 : 400,
                ),
              ),
              SizedBox(width: screenWidth<1400 ? 40 : 100),
              ProductCard(
                imagePath: 'img/main/oyuncak.jpg',
                title: 'Eğlence Zamanı',
                subtitle: 'Oyuncak',
                width: screenWidth<1400 ? screenWidth * 0.3 : 400,
                height: screenWidth<1400 ? screenHeight * 0.4 : 500,
              ),
              const Spacer(),
            ],
          ),
          const Divider(height: 100, color: Colors.white),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              ProductCard(
                imagePath: 'img/main/academia.gif',
                title: 'RADARDA: BEYAZ',
                subtitle: 'Academia',
                width: screenWidth<1400 ? screenWidth * 0.3 : 400,
                height: screenWidth<1400 ? screenHeight * 0.4 : 500,
              ),
              SizedBox(width: screenWidth<1400 ? 40 : 100),
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                ), // Sadece bu kartı 50px aşağı it
                child: ProductCard(
                  imagePath: 'img/main/sanalmakyaj.jpg',
                  title: 'İNOVATİF GÜZELLİK',
                  subtitle: 'Sanal Makyaj',
                width: screenWidth<1400 ? screenWidth * 0.3 : 400,
                height: screenWidth<1400 ? screenHeight * 0.4 : 400,
                ),
              ),
              SizedBox(width: screenWidth<1400 ? 40 : 100),
              ProductCard(
                imagePath: 'img/main/collect.gif',
                title: 'RAFİNE ESTETİK',
                subtitle: 'Collection',
                width: screenWidth<1400 ? screenWidth * 0.3 : 400,
                height: screenWidth<1400 ? screenHeight * 0.4 : 500,
              ),
              const Spacer(),
            ],
          ),
          ] else ...[
            // Ekran genişliği 1000'den küçükse tek sütunlu gösterim
            Column(
              children: [
                ProductCard(
                  imagePath: 'img/main/kadın.jpg',
                  title: 'HOUSE OF ART',
                  subtitle: 'Kadın',
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.6,
                ),
                const SizedBox(height: 50),
                ProductCard(
                  imagePath: 'img/main/erkek.jpg',
                  title: 'HOUSE OF ELEGANCE',
                  subtitle: 'Erkek',
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.6,
                ),
                const SizedBox(height: 50),
                ProductCard(
                  imagePath: 'img/main/sunum.jpg',
                  title: 'MİNİMAL SUNUMLAR',
                  subtitle: 'Sofra & Mutfak',
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.6,
                ),
                const SizedBox(height: 50),
                ProductCard(
                  imagePath: 'img/main/tekn.jpg',
                  title: 'KURTARICI GÜÇ',
                  subtitle: 'Küçük Ev Aletleri',
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.6,
                ),
                const SizedBox(height: 50),
                ProductCard(
                  imagePath: 'img/main/canta.jpg',
                  title: 'FARK YARATANLAR',
                  subtitle: 'Çanta',
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.6,
                ),
                const SizedBox(height: 50),
                ProductCard(
                  imagePath: 'img/main/parf.jpg',
                  title: 'TAZELEYİCİ NOTALAR',
                  subtitle: 'Parfüm',
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.6,
                ),
                const SizedBox(height: 50),
                ProductCard(
                  imagePath: 'img/main/gozl.jpg',
                  title: 'ANAHTAR PARÇA',
                  subtitle: 'Güneş Gözlüğü',
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.6,
                ),
                const SizedBox(height: 50),
                ProductCard(
                  imagePath: 'img/main/oyuncak.jpg',
                  title: 'Eğlence Zamanı',
                  subtitle: 'Oyuncak',
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.6,
                ),
                const SizedBox(height: 50),
                ProductCard(
                  imagePath: 'img/main/academia.gif',
                  title: 'RADARDA: BEYAZ',
                  subtitle: 'Academia',
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.6,
                ),
                const SizedBox(height: 50),
                ProductCard(
                  imagePath: 'img/main/sanalmakyaj.jpg',
                  title: 'İNOVATİF GÜZELLİK',
                  subtitle: 'Sanal Makyaj',
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.6,
                ),
                const SizedBox(height: 50),
                ProductCard(
                  imagePath: 'img/main/collect.gif',
                  title: 'RAFİNE ESTETİK',
                  subtitle: 'Collection',
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.6,
                ),
                const SizedBox(height: 50),
              ],
            ),
          ],

          const Divider(height: 100, color: Colors.white),
          const Kampanyalar(),
          const Divider(height: 100, color: Colors.white),
          OneCikanKategoriler(),
          const Divider(height: 100, color: Colors.white),
          const BeymenFooter(),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final double width;
  final double height;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w900,
            fontFamily: GoogleFonts.raleway().fontFamily,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          'Keşfet',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: TextDecoration.underline,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _CustomNavButtonState extends State<CustomNavButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: TextButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.transparent,
          ), // Arkaplanı şeffaf
          overlayColor: MaterialStateProperty.all(
            Colors.transparent,
          ), // Hover efektini sıfırladık
          foregroundColor: MaterialStateProperty.all(
            Colors.black,
          ), // Yazı rengi
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            color: isHovering ? Colors.black87 : Colors.black,
            decoration:
                isHovering ? TextDecoration.underline : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

class BeymenNavBar extends StatelessWidget {
  const BeymenNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        // Üst Menü
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Row(
            children: [
              const Spacer(),
              CustomNavButton(
                label: "Repair",
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder:
                          (context, animation1, animation2) => RepairPage(),
                    ),
                  );
                  transitionDuration:
                  const Duration(milliseconds: 100);
                },
              ),
              CustomNavButton(
                label: "Sipariş Takibi",
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder:
                          (context, animation1, animation2) =>
                              const OrderTrackingPage(),
                    ),
                  );
                  transitionDuration:
                  const Duration(milliseconds: 100);
                },
              ),
              CustomNavButton(
                label: "Kampanyalar",
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder:
                          (context, animation1, animation2) =>
                              const CampaignsPage(),
                    ),
                  );
                  transitionDuration:
                  const Duration(milliseconds: 100);
                },
              ),
              CustomNavButton(
                label: "The One",
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder:
                          (context, animation1, animation2) =>
                              const TheOnePage(),
                    ),
                  );
                  transitionDuration:
                  const Duration(milliseconds: 100);
                },
              ),
              CustomNavButton(
                label: "Servisler",
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder:
                          (context, animation1, animation2) =>
                              const ServicesPage(),
                    ),
                  );
                  transitionDuration:
                  const Duration(milliseconds: 100);
                },
              ),
              const Icon(Icons.language, size: 18),
              const SizedBox(width: 4),
              const Text("TR"),
            ],
          ),
        ),

        const Divider(height: 1),

        // Logo & Arama & İkonlar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Row(
            children: [
              // Logo Kısmı
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApp(),
                      ), // Hedef sayfan
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: GoogleFonts.lora().fontFamily,
                          fontSize: screenWidth < 1000 ? 20 : 30,
                          color: const Color.fromARGB(255, 11, 0, 220),
                          fontWeight: FontWeight.w100,
                        ),
                        children: [
                          const TextSpan(text: " B E Y M E N"),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4, right: 4),
                              child: Icon(
                                Icons.circle,
                                size: screenWidth < 1000 ? 20 : 30,
                                color: const Color.fromARGB(255, 11, 0, 220),
                              ),
                            ),
                          ),
                          const TextSpan(text: "COM"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 30),
              const Spacer(),
              // Arama Çubuğu
              Container(
                width: screenWidth < 1000 ? screenWidth * 0.5 : 450,
                height: screenHeight < 1000 ? screenHeight * 0.05 : 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Ürün, Marka Arayın",
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    suffixIcon: Icon(Icons.search, color: Colors.grey[700]),
                  ),
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: GoogleFonts.ptSans().fontFamily,
                  ),
                ),
              ),
              const Spacer(),
              // Hesabım İkonu
              Row(
                children: [
                  if (screenWidth > 1000) ...[
                    Column(
                      children: const [
                        Icon(Icons.person_outline),
                        SizedBox(height: 4),
                        Text("Hesabım", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    const SizedBox(width: 20),

                    // Favorilerim İkonu
                    Column(
                      children: const [
                        Icon(Icons.favorite_border),
                        SizedBox(height: 4),
                        Text("Favorilerim", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    const SizedBox(width: 20),

                    // Sepetim İkonu
                    Column(
                      children: const [
                        Icon(Icons.shopping_bag_outlined),
                        SizedBox(height: 4),
                        Text("Sepetim", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                  // Ekran dar ise buraya başka widgetlar ekleyebilirsin
                ],
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        // Kategoriler
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Kadın",
                  style: TextStyle(
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Erkek",
                  style: TextStyle(
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Kozmetik",
                  style: TextStyle(
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Ev & Yaşam",
                  style: TextStyle(
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Çocuk",
                  style: TextStyle(
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Anne & Bebek & Oyuncak",
                  style: TextStyle(
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Teknoloji",
                  style: TextStyle(
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Spor & Outdoor",
                  style: TextStyle(
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Outlet",
                  style: TextStyle(
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Reborn",
                  style: TextStyle(
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 0.5),
      ],
    );
  }
}

class Kampanyalar extends StatefulWidget {
  const Kampanyalar({super.key});

  @override
  State<Kampanyalar> createState() => _KampanyalarState();
}

class _KampanyalarState extends State<Kampanyalar> {
  final PageController _pageController = PageController(initialPage: 1000);
  // ignore: unused_field
  int _currentPage = 0;

  final List<List<Map<String, String>>> pages = [
    [
      {
        'image': 'img/kampanyalar/kelebek.jpg',
        'title': 'BAHAR KELEBEK\'İ',
        'desc': 'Seçili Beymen Club alışverişlerinize özel Kelebek ayrıcalığı',
      },
      {
        'image': 'img/kampanyalar/basl.jpg',
        'title': 'YENİ BAŞLANGIÇLAR',
        'desc': 'Seçili Inglesina alışverişlerinizde sepette özel avantajlar',
      },
      {
        'image': 'img/kampanyalar/ahenk.jpg',
        'title': 'AHENKLİ YAŞAM ALANLARI',
        'desc': 'Moser ve Georg Jensen tasarımlarında %20 indirim',
      },
    ],
    [
      {
        'image': 'img/kampanyalar/odak.jpg',
        'title': 'YAZ STİLİ',
        'desc': 'Yaza özel tasarımlarda sepette ekstra %15',
      },
      {
        'image': 'img/kampanyalar/garanti.jpg',
        'title': 'GÜNEŞ KORUMASI',
        'desc': 'UV filtreli yaz bakım ürünlerinde fırsatlar',
      },
    ],
  ];

  void _goToPreviousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _goToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              Text(
                "KAMPANYALAR",
                style: TextStyle(
                  fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 20),
          Stack(
            children: [
              const Divider(height: 10, thickness: 2, color: Colors.grey),
              Positioned(
                top: 4,
                left: screenWidth * 0.38,
                child: Container(
                  width: screenWidth * 0.2,
                  height: 2,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                height: 600,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index % pages.length;
                    });
                  },
                  itemBuilder: (context, index) {
                    final pageIndex = index % pages.length;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                          pages[pageIndex].map((item) {
                            return Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 400,
                                      height: 400,
                                      child: ClipRRect(
                                        child: Image.asset(
                                          item['image']!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 40),
                                    Text(
                                      item['title']!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      item['desc']!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(300, 50),
                                        shape: BeveledRectangleBorder(),
                                        backgroundColor: Colors.black,
                                        foregroundColor: Colors.white,
                                      ),
                                      child: const Text("ALIŞVERİŞE BAŞLA"),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                    );
                  },
                ),
              ),
              Positioned(
                left: 0,
                top: 200,
                child: IconButton(
                  icon: const Icon(Icons.chevron_left),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    side: MaterialStateProperty.all(
                      BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  onPressed: _goToPreviousPage,
                ),
              ),
              Positioned(
                right: 0,
                top: 200,
                child: IconButton(
                  icon: const Icon(Icons.chevron_right),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    side: MaterialStateProperty.all(
                      BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  onPressed: _goToNextPage,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HoverableOutlinedButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const HoverableOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  State<HoverableOutlinedButton> createState() =>
      _HoverableOutlinedButtonState();
}

class _HoverableOutlinedButtonState extends State<HoverableOutlinedButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: widget.onPressed,
      onHover: (hovering) {
        setState(() {
          isHovered = hovering;
        });
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          isHovered ? const Color.fromARGB(255, 64, 64, 64) : Colors.white,
        ),
        foregroundColor: MaterialStateProperty.all(
          isHovered ? Colors.white : Colors.black,
        ),
        side: MaterialStateProperty.all(
          BorderSide(color: isHovered ? Colors.black : Colors.grey),
        ),
        minimumSize: MaterialStateProperty.all(const Size(300, 60)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
        ),
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: isHovered ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

class OneCikanKategoriler extends StatelessWidget {
  final List<Map<String, String>> kategoriler = [
    {"isim": "GİYİM", "resim": "img/onecikan/GIYIM.jpg"},
    {"isim": "AYAKKABI", "resim": "img/onecikan/AYAKKABI.jpg"},
    {"isim": "ÇANTA", "resim": "img/onecikan/CANTA.jpg"},
    {"isim": "AKSESUAR", "resim": "img/onecikan/AKSESUAR.jpg"},
  ];

  OneCikanKategoriler({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Öne Çıkan Kategoriler',
          style: TextStyle(
            fontSize: 24,
            fontFamily: GoogleFonts.rubik().fontFamily,
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              kategoriler.map((kategori) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(1),
                        child: Image.asset(
                          kategori['resim']!,
                          width: screenWidth * 0.2,
                          height: screenHeight * 0.25,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.2,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              kategori['isim']!,
                              style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                                fontFamily: GoogleFonts.rubik().fontFamily,
                              ),
                            ),
                            Icon(Icons.arrow_right, color: Colors.white),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
        ),
        SizedBox(height: 20),
        HoverableOutlinedButton(onPressed: () {}, text: "DAHA FAZLA GÖSTER"),
      ],
    );
  }
}

//*******************************FOOTER*****************************

class BeymenFooter extends StatelessWidget {
  const BeymenFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 60),
              // ÜCRETSİZ KARGO
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildIconWithCircle(Icons.local_shipping),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFooterTitle("ÜCRETSİZ KARGO", Colors.black),
                          const SizedBox(height: 8),
                          _buildFooterText(
                            "2000 TL ve üzeri alışverişlerinizde kargo ücretsiz.",
                            Colors.black,
                          ),
                          _buildFooterText(
                            "The One üyelerine ait limitsiz ücretsiz kargo ayrıcalığı.",
                            Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),

              // MAĞAZADAN TESLİM
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildIconWithCircle(Icons.store),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFooterTitle("MAĞAZADAN TESLİM", Colors.black),
                          const SizedBox(height: 8),
                          _buildFooterText(
                            "Online olarak satın aldığınız ürünleri mağazalarımızdan teslim alabilirsiniz.",
                            Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),

              // KOLAY İADE
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildIconWithCircle(Icons.assignment_return),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFooterTitle("KOLAY İADE", Colors.black),
                          const SizedBox(height: 8),
                          _buildFooterText(
                            "Beymen.com'dan satın aldığınız ürünleri kolayca iade edebilirsiniz.",
                            Colors.black,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 60),
                  ],
                ),
              ),
            ],
          ),
        ),

        Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(height: 40, color: Colors.grey),

              // Main footer content
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // BEYMEN HAKKINDA column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFooterTitle("BEYMEN HAKKINDA", Colors.white),
                        const SizedBox(height: 12),
                        _buildFooterLink("Kariyer İş İlanları"),
                        _buildFooterLink("The One Card"),
                        _buildFooterLink("Özel Düğüm"),
                        _buildFooterLink("Hediye Danışmanlığı"),
                        _buildFooterLink("Beymen Private - Stil Danışmanlığı"),
                        _buildFooterLink("Kurumsal Satış"),
                        _buildFooterLink("Bilgi Toplumu Hizmetleri"),
                      ],
                    ),
                  ),

                  // MÜŞTERİ HİZMETLERİ column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFooterTitle("MÜŞTERİ HİZMETLERİ", Colors.white),
                        const SizedBox(height: 12),
                        _buildFooterLink("Bize Ulaşın"),
                        _buildFooterLink("Sıkça Sorulan Sorular"),
                        _buildFooterLink("İşlem Rehberi"),
                        _buildFooterLink("Ücretsiz Kargo ve İade"),
                        _buildFooterLink("Mağazadan Teslim"),
                        _buildFooterLink("Üyelik Sözleşmesi"),
                        _buildFooterLink("Site Haritası"),
                        _buildFooterLink("Kişisel Verilerin Korunması"),
                      ],
                    ),
                  ),

                  // HESABIM column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFooterTitle("HESABIM", Colors.white),
                        const SizedBox(height: 12),
                        _buildFooterLink("Siparişlerim"),
                        _buildFooterLink("Adreslerim"),
                        _buildFooterLink("Üyelik Bilgilerim"),
                        const SizedBox(height: 12),

                        _buildFooterTitle("MAĞAZALAR", Colors.white),
                        const SizedBox(height: 12),

                        _buildFooterTitle("BEYMEN BLOG", Colors.white),
                        const SizedBox(height: 12),

                        _buildFooterTitle("BEYMEN MAGAZINE", Colors.white),
                      ],
                    ),
                  ),

                  // ÖZEL GÜNLER column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFooterTitle("ÖZEL GÜNLER", Colors.white),
                        const SizedBox(height: 12),
                        _buildFooterLink("Yılbaşı"),
                        _buildFooterLink("Sevgililer Günü"),
                        _buildFooterLink("Anneler Günü"),
                        _buildFooterLink("Babalar Günü"),
                        _buildFooterLink("Nişan ve Düğün Elbiseleri"),
                        _buildFooterLink("Mezuniyet ve Balo Elbiseleri"),
                        _buildFooterLink("Dünya Kadınlar Günü"),
                      ],
                    ),
                  ),
                ],
              ),

              const Divider(height: 40, color: Colors.grey),

              // İNSAN KAYNAKLARI section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFooterTitle("İNSAN KAYNAKLARI", Colors.white),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 20,
                    children: [
                      _buildFooterLink("About Beymen"),
                      _buildFooterLink("Satın Alma İş İlanları"),
                      _buildFooterLink("Kampanya Koşulları"),
                      _buildFooterLink("Mesafeli Satış Sözleşmesi"),
                    ],
                  ),
                ],
              ),

              const Divider(height: 40, color: Colors.grey),

              // Copyright text
              Center(
                child: _buildFooterText(
                  "© 2025 Beymen, Tüm Hakları Saklıdır",
                  Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIconWithCircle(IconData icon) {
    return Container(
      width: 60,
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 36),
    );
  }

  Widget _buildFooterTitle(String text, Color color) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
    );
  }

  Widget _buildFooterText(String text, Color color) {
    return Text(text, style: TextStyle(fontSize: 14, color: color));
  }

  Widget _buildFooterLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () {},
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
