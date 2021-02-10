import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ayarlar"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 8,
            ),
            ListTile(
              leading: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://i1.rgstatic.net/ii/profile.image/743130617880576-1554187554007_Q512/Suat_Canbay2.jpg"),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
              title: Text(
                "Suat Canbay",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Eski Zamanlarda Kimler İstedi Bilmiyorum"),
            ),
            Divider(
              color: Colors.yellow,
            ),
            ListTile(
              leading: Icon(
                Icons.vpn_key,
                color: Color(0xff075E54),
              ),
              title: Text(
                "Hesap",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Gizlilik,Güvenlik,numara değiştir"),
            ),
            ListTile(
              leading: Icon(
                Icons.message,
                color: Color(0xff075E54),
              ),
              title: Text(
                "Sohbetler",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Yedekleme,geçmiş,duvar kağıdı"),
            ),
            ListTile(
              leading: Icon(
                Icons.bluetooth_searching,
                color: Color(0xff075E54),
              ),
              title: Text(
                "Bildirimler",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Mesaj,grup ve arama sesleri"),
            ),
            ListTile(
              leading: Icon(
                Icons.data_usage,
                color: Color(0xff075E54),
              ),
              title: Text(
                "Veri ve depolama kullanımı",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Ağ kullanımı,otomatik indirme"),
            ),
            ListTile(
              leading: Icon(
                Icons.help,
                color: Color(0xff075E54),
              ),
              title: Text(
                "Yardım",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Yardım, bize ulaşın, gizlilik politikası"),
            ),
            Divider(
              indent: 80,
              color: Colors.yellow,
            ),
            ListTile(
              leading: Icon(
                Icons.group,
                color: Color(0xff075E54),
              ),
              title: Text(
                "Arkadaş Davet Edin",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text("Facebook\'tan WhatsApp"),
            ),
            SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}
