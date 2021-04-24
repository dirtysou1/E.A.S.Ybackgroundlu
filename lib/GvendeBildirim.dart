import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './Component191.dart';
import './Component21.dart';
import './Butonlar.dart';
import 'package:adobe_xd/page_link.dart';

class GvendeBildirim extends StatelessWidget {
  GvendeBildirim({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromSize(
            bounds: Rect.fromLTWH(-66.0, -4.0, 481.0, 676.0),
            size: Size(375.0, 667.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            pinBottom: true,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/butonbg.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.37), BlendMode.dstIn),
                ),
                border: Border.all(width: 1.0, color: const Color(0x00000000)),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(29.0, 25.0, 318.0, 510.0),
            size: Size(375.0, 667.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            fixedHeight: true,
            child: Component191(),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(78.0, 400.0, 220.0, 57.0),
            size: Size(375.0, 667.0),
            pinLeft: true,
            pinRight: true,
            fixedHeight: true,
              child: Component21(),
            ),
        ],
      ),
    );
  }
}
