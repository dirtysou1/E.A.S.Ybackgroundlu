import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:easy/Yakinlar.dart';

class Component221 extends StatelessWidget {
  Component221({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Pinned.fromSize(
          bounds: Rect.fromLTWH(0.0, 0.0, 121.0, 113.0),
          size: Size(121.0, 113.0),
          pinLeft: true,
          pinRight: true,
          pinTop: true,
          pinBottom: true,
          child: Container(child: FlatButton(onPressed: ()async{

          },),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              color: const Color(0xffcf8e0c),
              border: Border.all(width: 1.0, color: const Color(0xff707070)),
            ),
          ),
        ),
        Pinned.fromSize(
          bounds: Rect.fromLTWH(38.0, 29.0, 57.0, 61.0),
          size: Size(121.0, 113.0),
          pinLeft: true,
          pinRight: true,
          pinTop: true,
          fixedHeight: true,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: const AssetImage('assets/images/kisiekle.png'),
                fit: BoxFit.cover,
              ),
              border: Border.all(width: 1.0, color: const Color(0x00000000)),
            ),
          ),
        ),
      ],
    );
  }
}
