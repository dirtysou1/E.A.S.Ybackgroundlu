import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'main.dart';
import './Butonlar.dart';
import 'package:adobe_xd/page_link.dart';

class Component21 extends StatelessWidget {
  Component21({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Pinned.fromSize(
          bounds: Rect.fromLTWH(0.0, 0.0, 220.0, 57.0),
          size: Size(220.0, 57.0),
          pinLeft: true,
          pinRight: true,
          pinTop: true,
          pinBottom: true,
          child: Stack(
            children: <Widget>[        Pinned.fromSize(
              bounds: Rect.fromLTWH(67.0, 18.0, 84.0, 21.0),
              size: Size(220.0, 57.0),
              pinBottom: true,
              fixedWidth: true,
              fixedHeight: true,
              child: Text(
                'TAMAM  ',
                style: TextStyle(
                  fontFamily: 'Verdana',
                  fontSize: 17,
                  color: const Color(0xffffffff),
                  letterSpacing: 1.7000000000000002,
                ),
                textAlign: TextAlign.center,
              ),
            ),
              Pinned.fromSize(
                bounds: Rect.fromLTWH(0.0, 0.0, 220.0, 57.0),
                size: Size(220.0, 57.0),
                pinLeft: true,
                pinRight: true,
                pinTop: true,
                pinBottom: true,
                child: Container(
                  child:
                      FlatButton(onPressed: () => Navigator.of(context).pop(),child: Text(''),),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(114.0),
                    color: const Color(0x40707070),
                    border:
                        Border.all(width: 1.0, color: const Color(0xff707070)),
                  ),
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
