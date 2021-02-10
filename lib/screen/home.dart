import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:whatsapp/models/status.dart';
import 'package:whatsapp/screen/camera.dart';
import '../models/calls.dart';


class Home extends StatefulWidget {
  var description;
  Home(this.description,{Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  String _imagePath;
  int _popUpMenuIndex = 0;
  var _date = DateTime.now().toString().split(" ");
  Icon _fabIcon;
  TabController _tabController;
  List<Calls> _callsList = new List<Calls>();
  List<Status> _lastUpdates = new List<Status>();

  List<String> _imageLink = [
    "http://www.sehirkameralari.com/wp-content/uploads/2012/06/istanbul2-280x270.jpg",
    "http://www.sehirkameralari.com/wp-content/uploads/2014/12/Ankara-Manzarası-280x270.jpg",
    "https://www.pusulahaber.com.tr/d/other/whatsapp-image-2019-08-18-at-11.12.18.jpeg",
    "https://dugunuzmani.net/wp-content/uploads/2019/03/Dream-Garden-Çankaya-696x464.jpeg"
  ];

  List<String> _names = [
    "Ali",
    "Ayşe",
    "Suat",
    "Haydar",
    "Meyrem",
    "Abdullah",
    "Mehmet",
    "Hamza",
    "Ömer",
    "Emrah"
  ];

  @override
  void initState() {
    super.initState();
    _callsList.add(Calls(
        "https://i1.rgstatic.net/ii/profile.image/743130617880576-1554187554007_Q512/Suat_Canbay2.jpg",
        "Suat Canbay",
        "${DateTime.now().toString()}"));
    _callsList.add(Calls(
        "https://i1.rgstatic.net/ii/profile.image/743130617880576-1554187554007_Q512/Suat_Canbay2.jpg",
        "Emrah Canbay",
        "${DateTime.now().toString()}"));
    _lastUpdates
        .add(Status("${_imageLink[2]}", "Emrah Canbay", "15 dakika önce"));
    _lastUpdates.add(Status("${_imageLink[3]}", "Merhamet Atıl", "Dün 20:15"));

    setState(() {});

    _tabController = TabController(vsync: this, length: 4)
      ..addListener(() {
        setState(() {
          switch (_tabController.index) {
            case 0:
              /*
              _getImage().then((_image){

              });
              */
              break;
            case 1:
              _fabIcon = Icon(
                Icons.message,
                size: 24,
              );
              break;
            case 2:
              _fabIcon = Icon(Icons.camera_enhance, size: 24);
              break;
            case 3:
              _fabIcon = Icon(Icons.add_call, size: 24);
              break;
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      setState(() {
        _popUpMenuIndex = _tabController.index;
        debugPrint(_popUpMenuIndex.toString());
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Whatsapp"),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.search),
                SizedBox(width: 20),
                _popMenuDraw,
              ],
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              child: Text("CHATS"),
            ),
            Tab(
                child: Text(
              "STATUS",
            )),
            Tab(
                child: Text(
              "CALLS",
            )),
          ],
        ),
      ),
      floatingActionButton: _tabController.index != 0
          ? FloatingActionButton(
              child: _fabIcon,
              onPressed: () {
                //_getImage();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Container(
                    child: Center(
                      child: TakePhoto(widget.description),
                    ),
                  );
                }));
              },
            )
          : null,
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          /* _camera,*/
          TakePhoto(widget.description),
          _chatList,
          _status,
          _callsList.length == 0
              ? Container(
                  child: Center(
                  child: Text(
                    "WhatsApp kullanan kişileri aramak için ekranın altındaki FAB simgesine dokunun.",
                    style: TextStyle(color: Colors.grey.shade800),
                  ),
                ))
              : _callsListe,
        ],
      ),
    );
  }

  Widget get _chatList => ListView.builder(
        itemCount: _names.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(
                              "https://i1.rgstatic.net/ii/profile.image/743130617880576-1554187554007_Q512/Suat_Canbay2.jpg"),),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              "${_names[index]}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("Mesaj kısmı burası"),
                            trailing: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text("${_date[0]}}")),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );

  Widget get _status => Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: ListTile(
              leading: Stack(
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2.0,
                        color: Colors.yellow,
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://i1.rgstatic.net/ii/profile.image/743130617880576-1554187554007_Q512/Suat_Canbay2.jpg"),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 37,
                    child: Container(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xff25d366)),
                    ),
                  ),
                ],
              ),
              title: Text(
                "Durumum",
                style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
              ),
              subtitle: Text(
                "Durum güncellemesi için dokunun",
                style: TextStyle(letterSpacing: 1),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 300,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  height: 40,
                  width: double.infinity,
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Son güncellemeler",
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.4),
                    shape: BoxShape.rectangle,
                    color: Colors.grey.shade200,
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  Widget get _callsListe => ListView.builder(
        itemCount: _callsList.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(_callsList[index].image),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                              title: Text(
                                "${_callsList[index].title}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "${_callsList[index].subTitle}",
                              ),
                              trailing: Padding(
                                padding: EdgeInsets.all(10),
                                child: Icon(
                                  Icons.videocam,
                                  color: Color(0xff075E54),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Divider(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );

  Widget get _last => Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              height: 40,
              width: double.infinity,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "Son güncellemeler",
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(width: 0.4),
                shape: BoxShape.rectangle,
                color: Colors.grey.shade200,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: ListView.builder(
                itemCount: _lastUpdates.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      NetworkImage(_lastUpdates[index].image),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                      title: Text(
                                        "${_lastUpdates[index].caption}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        "${_lastUpdates[index].date}",
                                      ),
                                      trailing: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Icon(
                                          Icons.videocam,
                                          color: Color(0xff075E54),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Divider(
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );

  Widget get _popMenuDraw {
    switch (_popUpMenuIndex) {
      case 0:
        return PopupMenuButton<String>(
          itemBuilder: (context) => <PopupMenuEntry<String>>[

            const PopupMenuItem<String>(
                value: 'Ayarlar',
                child: Text('Ayarlar', style: TextStyle(letterSpacing: 1))),
          ],
        );
        break;


      case 1:
        return PopupMenuButton<String>(
          onSelected: (value) {
            if (value == "Ayarlar") {
              Navigator.pushNamed(context, "/settings");
            }
          },
          itemBuilder: (context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'Yeni Grup',
              child: Text('Yeni Grup', style: TextStyle(letterSpacing: 1)),
            ),
            const PopupMenuItem<String>(
              value: 'Yeni Toplu Mesaj',
              child:
                  Text('Yeni Toplu Mesaj', style: TextStyle(letterSpacing: 1)),
            ),
            const PopupMenuItem<String>(
              value: 'WhatsApp Web',
              child: Text('WhatsApp Web', style: TextStyle(letterSpacing: 1)),
            ),
            const PopupMenuItem<String>(
                value: 'Yıldızlı Mesajlar',
                child: Text('Yıldızlı Mesajlar',
                    style: TextStyle(letterSpacing: 1))),
            const PopupMenuItem<String>(
                value: 'Ayarlar',
                child: Text('Ayarlar', style: TextStyle(letterSpacing: 1))),
          ],
        );
        break;
      case 2:
        return PopupMenuButton<String>(
          onSelected: (value) {
            if (value == "Ayarlar") {
              Navigator.pushNamed(context, "/settings");
            }
          },
          itemBuilder: (context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'Durum Gizlilik Ayarları',
              child: Text('Durum Gizlilik Ayarları',
                  style: TextStyle(letterSpacing: 1)),
            ),
            const PopupMenuItem<String>(
                value: 'Ayarlar',
                child: Text('Ayarlar', style: TextStyle(letterSpacing: 1))),
          ],
        );

        break;






      case 3:
        return PopupMenuButton<String>(
          onSelected: (value) {
            if (value == "Arama Kayıtlarını Sil") {
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                          "tüm arama kayıtlarını temizlemek istiyor musunuz?"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("İPTAL"),
                          color: Color(0xff075E54),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        FlatButton(
                          child: Text("Tamam"),
                          color: Color(0xff075E54),
                          onPressed: () {
                            _callsList.clear();
                            Navigator.pop(context);
                            setState(() {});
                          },
                        )
                      ],
                    );
                  });
            }
            if (value == "Ayarlar") {
              Navigator.pushNamed(context, "/settings");
            }
          },
          itemBuilder: (context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'Arama Kayıtlarını Sil',
              child: Text('Arama Kayıtlarını Sil',
                  style: TextStyle(letterSpacing: 1)),
            ),
            const PopupMenuItem<String>(
                value: 'Ayarlar',
                child: Text('Ayarlar', style: TextStyle(letterSpacing: 1))),
          ],
        );
        break;
    }
  }

  Widget get _camera {
    Container(
      child: Stack(
        children: <Widget>[
          Container(

              /*
              margin: EdgeInsets.all(20),
              child: Image.network(
                "https://miro.medium.com/max/1280/0*2zKraLcywQmTDi4H.jpg",
                loadingBuilder: (context, child, progress) {
                  return progress == null ? child : LinearProgressIndicator();
                },
              ),*/

              ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IntrinsicHeight(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          debugPrint("Flaş Tıklandı");
                        },
                        child: Icon(Icons.flash_auto),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              //borderRadius: BorderRadius.all(Radius.circular(50)),
                              shape: BoxShape.circle),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          debugPrint("Kamera DEğişti");
                        },
                        child: Icon(Icons.switch_camera),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Video için basılı tutun,fotoğraf için dokunun",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
