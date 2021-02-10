import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';


class TakePhoto extends StatefulWidget {
  List<CameraDescription> _cameras;
  TakePhoto(this._cameras, {Key key}) : super(key: key);

  @override
  _TakePhotoState createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
  CameraController _cameraController;

  @override
  void initState() {
    super.initState();
    _cameraController =
        CameraController(widget._cameras[0], ResolutionPreset.medium);
    _cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_cameraController.value.isInitialized) {
      return Container();
    }
    return AspectRatio(
      aspectRatio: _cameraController.value.aspectRatio,
      child: Stack(
        children: <Widget>[
          Container(
            child: CameraPreview(_cameraController),

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
