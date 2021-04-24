import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './Component21.dart';
import './Butonlar.dart';
import 'package:adobe_xd/page_link.dart';

import 'main.dart';

class Component281 extends StatelessWidget {
  Component281({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Pinned.fromSize(
          bounds: Rect.fromLTWH(0.0, 126.5, 318.0, 401.0),
          size: Size(318.0, 527.5),
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
          bounds: Rect.fromLTWH(33.0, 0.0, 252.0, 226.0),
          size: Size(318.0, 527.5),
          pinLeft: true,
          pinRight: true,
          pinTop: true,
          fixedHeight: true,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/yardimcagrisi.png'),
                fit: BoxFit.cover,
              ),
              border: Border.all(width: 1.0, color: const Color(0x00000000)),
            ),
          ),
        ),
        Pinned.fromSize(
          bounds: Rect.fromLTWH(18.0, 213.6, 282.0, 240.2),
          size: Size(318.0, 527.5),
          pinLeft: true,
          pinRight: true,
          fixedHeight: true,
          child: Text(
            'Yardım çağrınız alınmıştır.\nYardım ekiplerine ve yakınlarınıza yardım çağrınız iletilmiştir.\n\nDiğer afetzedelere ulaşımı kolaylaştırmak için lütfen Güvende Değilim butonunu bir daha kullanmayınız.',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 17,
              color: const Color(0xffffffff),
              letterSpacing: 1.7000000000000002,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Pinned.fromSize(
          bounds: Rect.fromLTWH(49.0, 465.8, 220.0, 57.0),
          size: Size(318.0, 527.5),
          pinLeft: true,
          pinRight: true,
          pinBottom: true,
          fixedHeight: true,
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MyStatefulWidget()));
            },
            child: Component21(),
          ),
        ),
      ],
    );
  }
}
