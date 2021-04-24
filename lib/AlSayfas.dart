import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './Component91.dart';

class AlSayfas extends StatelessWidget {
  AlSayfas({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: Stack(
        children: <Widget>[
          Pinned.fromSize(
            bounds: Rect.fromLTWH(3.0, 15.0, 375.0, 653.0),
            size: Size(375.0, 667.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            pinBottom: true,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/acilisbg.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.59), BlendMode.dstIn),
                ),
                border: Border.all(width: 1.0, color: const Color(0x00000000)),
              ),
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(62.0, 515.0, 252.0, 86.0),
            size: Size(375.0, 667.0),
            pinLeft: true,
            pinRight: true,
            pinBottom: true,
            fixedHeight: true,
            child: Component91(),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(27.0, 50.0, 322.0, 54.0),
            size: Size(375.0, 667.0),
            pinLeft: true,
            pinRight: true,
            pinTop: true,
            fixedHeight: true,
            child: SingleChildScrollView(
                child: Text(
              'EASY\n',
              style: TextStyle(
                fontFamily: 'Rockwell',
                fontSize: 45,
                color: const Color(0xfff6cd00),
              ),
              textAlign: TextAlign.center,
            )),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(-65.4, 136.6, 326.0, 40.0),
            size: Size(375.0, 667.0),
            pinLeft: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Text(
              'Merhaba,',
              style: TextStyle(
                fontFamily: 'Rockwell',
                fontSize: 34,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(17.6, 196.9, 243.0, 211.0),
            size: Size(375.0, 667.0),
            pinLeft: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Text(
              ' E.A.S.Y uygulamasına hoş geldiniz.\n\nUygulamanın amacı \nolası felaket durumlarında sizi bulmak ve kurtarmak. Bunun için gerekli izinleri vermeniz gerek. ',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 15,
                color: const Color(0xffffffff),
                letterSpacing: 0.46499999999999997,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromSize(
            bounds: Rect.fromLTWH(18.0, 348.0, 247.0, 218.0),
            size: Size(375.0, 667.0),
            pinLeft: true,
            fixedWidth: true,
            fixedHeight: true,
            child: Text(
              'Bu izinler felaket durumları dışında kullanılmayacak ve girdiğiniz kişisel bilgileriniz eklediğiniz yakınlar haricinde kimseyle paylaşılmayacaktır.',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
