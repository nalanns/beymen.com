// ignore_for_file: unused_import, unused_label, unused_element
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hover_menu/hover_menu.dart';

//sayfalar
import 'order_tracking_page.dart';
import 'repair_page.dart';
import 'the_one_page.dart';
import 'services_page.dart';
import 'package:project/main.dart';

void main() {
  runApp(const CampaignsPage());
}

class CampaignsPage extends StatelessWidget {
  const CampaignsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [BeymenNavBar(), CampaignsPageMain(), BeymenFooter()],
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
                              const TheOnePage(),
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

//*******************************MAIN*****************************
class CampaignsPageMain extends StatelessWidget {
  const CampaignsPageMain({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final List<String> campaignTexts = [
      "Beymen Özel Markalarda 2 Ve Üzeri Ürüne %30 İndirim",
      "Outlet Seçili 2 Ürün Ve Üzeri Alışverişlerinizde +%20 İndirim",
      "PalZileri Markasının Seçili Ürünlerinde İndirim",
      "Seçili Ayakkabı & Çanta Ürünlerinde Yaz Fırsatları",
      "Seçili Beymen,Beymen Collection Ve Academia Markalı Ürünlerde İndirim",
      "Seçili Ev & Mobilya Ürünlerinde Yaz Fırsatları",
      "Seçili Giyim Ürünlerinde Yaz Fırsatları",
      "Seçili Güneş Gözlüğü Tasarımlarında Sepette Fırsatlar",
      "Seçili Inglesina Marka Ürünlerde Fırsatlar",
      "Seçili Kol Saati Tasarımlarında Sepette Fırsatlar",
      "Seçili Kozmetik Markalarında 2000 TL Üstü %25 İndirim",
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              SizedBox(
                width: screenWidth * 0.75,
                child: Image.asset(
                  "img/kampanyalarPage/kamp.png",
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 20),

          Row(
            children: [
              const SizedBox(width: 180.0),
              Expanded(
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 12,
                  children:
                      campaignTexts
                          .map((text) => _buildCampaignLink(text))
                          .toList(),
                ),
              ),
              const SizedBox(width: 180.0),
            ],
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildCampaignLink(String text) {
    return _HoverableCampaignBox(text: text);
  }
}

class _HoverableCampaignBox extends StatefulWidget {
  final String text;
  const _HoverableCampaignBox({required this.text});

  @override
  State<_HoverableCampaignBox> createState() => _HoverableCampaignBoxState();
}

class _HoverableCampaignBoxState extends State<_HoverableCampaignBox> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        alignment: Alignment.center,
        width: screenWidth < 1000 ? 100 : 250,
        height: 20,
        decoration: BoxDecoration(
          color: _isHovered ? Colors.black : Colors.white,
          border: Border.all(color: Colors.black12),
        ),
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: _isHovered ? Colors.white : Colors.black,
            fontSize: screenWidth < 1000 ? 12 : 14,
            fontWeight: FontWeight.w300,
            fontFamily: GoogleFonts.ptSans().fontFamily,
          ),
        ),
      ),
    );
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
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
