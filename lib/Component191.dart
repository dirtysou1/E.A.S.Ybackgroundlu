import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class Component191 extends StatelessWidget {
  Component191({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Pinned.fromSize(
          bounds: Rect.fromLTWH(0.0, 109.0, 318.0, 401.0),
          size: Size(318.0, 510.0),
          pinLeft: true,
          pinRight: true,
          pinTop: true,
          pinBottom: true,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48.0),
              color: const Color(0xff434343),
              border: Border.all(width: 1.0, color: const Color(0xff433d3d)),
            ),
          ),
        ),
        Pinned.fromSize(
          bounds: Rect.fromLTWH(43.0, 0.0, 237.0, 271.0),
          size: Size(318.0, 510.0),
          pinTop: true,
          fixedWidth: true,
          fixedHeight: true,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70.0),
              image: DecorationImage(
                image: const AssetImage('assets/images/tick.png'),
                fit: BoxFit.cover,
              ),
              border: Border.all(width: 1.0, color: const Color(0x00ffffff)),
            ),
          ),
        ),
        Pinned.fromSize(
          bounds: Rect.fromLTWH(37.0, 310.0, 243.0, 70.0),
          size: Size(318.0, 510.0),
          pinLeft: true,
          pinRight: true,
          fixedHeight: true,
          child: Text(
            'Güvende olduğunuz bilgisi yakınlarınıza SMS yoluyla iletilmiştir.',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 17,
              color: const Color(0xffffffff),
              letterSpacing: 1.7000000000000002,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
