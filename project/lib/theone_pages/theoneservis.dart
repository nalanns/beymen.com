// ignore_for_file: unused_import, unused_label
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hover_menu/hover_menu.dart';

//sayfalar
import 'package:project/main.dart';
import 'package:project/nav_pages/campaigns_page.dart';
import 'package:project/nav_pages/order_tracking_page.dart';
import 'package:project/nav_pages/repair_page.dart';
import 'package:project/nav_pages/services_page.dart';
import 'package:project/nav_pages/the_one_page.dart';




//the one sayfalar
import 'package:project/theone_pages/theonebeige.dart';
import 'package:project/theone_pages/theonegold.dart';
import 'package:project/theone_pages/theoneplatinium.dart';
import 'package:project/theone_pages/theonevip.dart';
import 'package:project/theone_pages/theonewhite.dart';
import 'package:project/theone_pages/theoneservis.dart';
import 'package:project/theone_pages/theonekosul.dart';


void main() {
  runApp(const ServisPage());
}

class ServisPage extends StatelessWidget {
  const ServisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [BeymenNavBar(),TheOneNavBar(), TheOneServisMain(), BeymenFooter()],
        ),
      ),
    );
  }
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
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          foregroundColor: WidgetStateProperty.all(Colors.black),
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
                          (context, animation1, animation2) =>
                              const RepairPage(),
                      transitionDuration: const Duration(milliseconds: 100),
                    ),
                  );
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
                      transitionDuration: const Duration(milliseconds: 100),
                    ),
                  );
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
                      transitionDuration: const Duration(milliseconds: 100),
                    ),
                  );
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
                              const ServisPage(),
                      transitionDuration: const Duration(milliseconds: 100),
                    ),
                  );
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
                      transitionDuration: const Duration(milliseconds: 100),
                    ),
                  );
                },
              ),
              const Icon(Icons.language, size: 18),
              const SizedBox(width: 4),
              const Text("TR"),
            ],
          ),
        ),
        const Divider(height: 1.0),
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
                width: 450,
                height: 40,
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

//************************THE ONE NAV********************
class CustomTheOneButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomTheOneButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  State<CustomTheOneButton> createState() => _CustomTheOneButtonState();
}
class _CustomTheOneButtonState extends State<CustomTheOneButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: TextButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          foregroundColor: WidgetStateProperty.all(Colors.black),
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



class TheOneNavBar extends StatelessWidget {
  const TheOneNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontFamily: GoogleFonts.montserrat().fontFamily,
      fontWeight: FontWeight.bold,
    );

    return Column(
      children: [
        Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
          child: Row(
            children: [
              const Spacer(),
              _navItem(context, "THE ONE", textStyle, const TheOnePage()),
              _navItem(context, "VIP", textStyle, const VipPage()),
              _navItem(context, "PLATINIUM", textStyle, const PlatiniumPage()),
              _navItem(context, "GOLD", textStyle, const GoldPage()),
              _navItem(context, "BEIGE", textStyle, const ServisPage()),
              _navItem(context, "WHITE", textStyle, const WhitePage()),
              _navItem(context, "ÖZEL SERVİSLER", textStyle, const ServisPage()),
              _navItem(context, "KOŞULLAR", textStyle, const KosulPage()),
              const Spacer(),
            ],
          ),
        ),
        const Divider(height: 0.5),
      ],
    );
  }

  Widget _navItem(BuildContext context, String label, TextStyle style, Widget destination) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => destination),
          );
        },
        child: Center(
          child: Text(label, style: style),
        ),
      ),
    );
  }
}




class TheOneServisMain extends StatelessWidget {
  const TheOneServisMain({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              SizedBox(
                width: screenWidth * 0.8,
                child: Column(
                  children: [
                    Image.asset("img/theOnePage/servisheader.jpg", fit: BoxFit.cover),
                    Image.asset(
                      "img/theOnePage/servis1.png",
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
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
              const SizedBox(width: 20),

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
              const SizedBox(width: 20),

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
