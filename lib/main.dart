import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget { // StatelessWidget kullanmak istedim çünkü durum yok.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Firmalar';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar( // App Bar kısmı uygulamanın en üst kısmına müdahale ettiğimiz kısım.
          title: const Text( // Bu navigator kısma uygulamanın başlığını koyuyoruz.
              appTitle,
              style: TextStyle( // Bu uygulama başlığının metnine müsahale ettim. yazının büyyüklüğü ve rengini değiştirdim.
                fontSize: 16,
                color: Colors.white,
              ),
          ),
          backgroundColor: const Color(0xFF0A3087), //en üst barın  arka plan rengini belirledim.
          centerTitle: true, // Başlığı ortaladım.
          leading: IconButton( // Bir Geri ikonu eklemek için bunu kullanıyoruz.
            icon: const Icon(Icons.arrow_back), // ikon şeklini belirledik.
            onPressed: () { // basıldığında geri gidecek. öncesinde bir şey varsa geri gidecek.
              Navigator.pop(context);
            },
            iconSize: 16, // ikonun büyüklüğünü ayarladım. 16 pixcel.
            color: Colors.white, // ikonun rengini beyaz yaptım.
          ),
        ),
        body: SingleChildScrollView( // Aşağıya doğru uzarsa proje kaydırabilir hale getirdim. body kısmı yani barın altında kalan kısımla burda ilgileneceğim.
          padding: const EdgeInsets.all(0), // kenarlarda boşluk olmasın istedim uygulamanın bar aşağısındaki kısmı kaplasın istedim.
          child: Container(
              color: Colors.grey[200], // Uygulamının  arka planını grimsi bir renk haline getirdim.
              child: const Column( // Rowlardan oluşacağı için dikey kısmını tamamen aldım.
                  children: [ // alt alta burda dizilecek widgetler.
                    EnUstListTile(), // Sağlık Kısmı burada. ListTile widgetini kullandım. Böylece diğer widgetleri daha kolay kullanmak istedim.
                    TextFieldKismi(), // Arama kısmını oluşturmak için TextField kullandım.
                    TexKismi(), // Kalıcı bir text kısmı oluşturdum.
                    FirmaBolumu(), // 5 tane Container i Listeye attım belli bir düzen içerisinde Listedekiler Container oluşturdu.
                  ]
              )
          )
        ),
      ),
    );
  }
}

class EnUstListTile extends StatelessWidget {
  const EnUstListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding( // uzaklık ayarlamak için bu widgetten başladım.
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 10), // marginini ayarladım.
        child: Container( // bir Container oluşturmak istedim çünkü kenarları yuvarlatmak ve arka planı renklendirmek için.
            decoration: BoxDecoration( // kutunun rengini ve yuvarlatmasını sağladım.
              color: const Color(0xFF0A3087),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const ListTile( // Container içerisine ListTile koyarak bir sütün içerisine sırayla Row şeklinde yan yana ikon metin ekledim
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // bu Column widgeti için sola hizalamadır.
                    children: [
                      Row(
                          children: [
                            Icon(
                              Icons.medical_services, // ikon şekli
                              color: Colors.white, // ikonun rengi.
                              size: 26, // ikonun boyutu.
                            ),
                            SizedBox(width: 100), // yatayda 100 pixel boşluk vermek için kulllandım.
                            Text(
                              'Sağlık', // Metnin başlığı
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ]
                      ),
                    ]
                )
            )
        ),
    );
  }
}

class TextFieldKismi extends StatelessWidget{
  const TextFieldKismi({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding( // margin vermek için bunu kulladım
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 2), // sırayla sol, üst, sağ, alt şeklinde margin verdim.
      child: Container(
        decoration: BoxDecoration( // Containere renk, kenarlaru yuvarlatmak, ve gölgelendirmek için kullanıldı.
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7), // gri rengini soluklaştırdım.
              spreadRadius: 1,
              blurRadius: 20,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: TextField( // yazılabilir bir metin eklemek için bu widget kullanıldı
          decoration: InputDecoration( // içine yazılanlar.
            labelText: 'Firma Ara', // yazının yazılcağı yere metin yerleştirdim.
            prefixIcon: const Icon( // ikon u baş kısmına yerleştirdim.
              Icons.search,
              color: Colors.black,
              size: 35,
            ),
            border: OutlineInputBorder( // dış kısmını ayarlamak için kullanıldı
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none, // dışındaki siyah çizgi giderildi.
            ),
          ),
        ),
      ),
    );
  }
}

class TexKismi extends StatelessWidget {
  const TexKismi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container( // sağ sol alt üst kısımlara margin yerleştirmek için Container kullanıldı.
      padding: const EdgeInsets.fromLTRB(34, 10, 10, 10),
      child: Row( // metni yatay eksene koyduk.
        children: [
          Text(
            'İstediğiniz  firmada  indirim  yakalama\nfırsatı...',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

class FirmaBolumu extends StatelessWidget {
  const FirmaBolumu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column( // Column içine birden fazla Container kulllanılmak için bir liste içine Container widgetleri konuldu.
      children: _name(5), // _name aşağıdaki Container listeleridir.
    );
  }

  List<Widget> _name(int count){ // bir _name adında liste oluşturuldu. bu Container dönecek.
    return List.generate(count, (i) => Container( // Container dönüyor. i aşağıda kullanılacak.
      decoration: BoxDecoration( // Container arka planına bir beyazlık ve kenarlara bir yuvarlatma yapıldı.
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Row oluşturularak her bir Row arasına bir boşluk verildi. bu boşluk 15 pixel.
        children: [
          const Expanded( // Bu düzenli bir widget dizilimi yapar.
            flex: 1, // Expanded ların her birine bu sayı verilerek konumlandırma yapılır. kime ne kadar kısım düştüğü bu kısımdan anlaşılır.
            child: Icon(
              Icons.arrow_right,
              color: Colors.black,
              size: 32.0,
            ),
          ),
          Expanded(
            flex: 7,
            child: Text(
              (i % 2 == 0 ? 'Firma Adı Uzun Firma\nAdı' : 'Firma Adı'), // i burda kullanıldı. çift sayıda ilk metin, tek sayıda ikinci metin gelecek ve bu sırada devam edecek.
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: Container( // Expanded içerisine bir Container verildi. Böylece boyutlandırma yapılabildi. ama sağ iki köşede yuvarlatma kayboldu. Bu kısma BoxDecoration ile özel oalrak yuvarlatma yapıldı.
              padding: const EdgeInsets.all(7.0),
              decoration: const BoxDecoration(
                color: Color(0xFF0A3087),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: const Text(
                '%10',
                textAlign: TextAlign.center, // metin ortalandı.
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}