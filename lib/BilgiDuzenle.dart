import 'package:flutter/material.dart';
import './Component41.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BilgiDuzenle extends StatelessWidget {
  BilgiDuzenle({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: Stack(
        children: <Widget>[
          Container(
            width: 374.3,
            height: 675.6,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/profilbg.jpg'),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.42), BlendMode.dstIn),
              ),
              border: Border.all(width: 1.0, color: const Color(0x00000000)),
            ),
          ),
          Transform.translate(
            offset: Offset(42.0, 226.4),
            child: SvgPicture.string(
              _svg_ki75v0,
              allowDrawingOutsideViewBox: true,
            ),
          ),
          Transform.translate(
            offset: Offset(124.0, 463.6),
            child: SizedBox(
              width: 127.0,
              height: 37.0,
              child: Component41(),
            ),
          ),
          Transform.translate(
            offset: Offset(124.0, 300.8),
            child: SizedBox(
              width: 127.0,
              height: 37.0,
              child: Component41(),
            ),
          ),
          Transform.translate(
            offset: Offset(124.0, 382.2),
            child: SizedBox(
              width: 127.0,
              height: 37.0,
              child: Component41(),
            ),
          ),
          Transform.translate(
            offset: Offset(124.0, 260.0),
            child: Text(
              'Doğum yılınız:',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(133.0, 352.0),
            child: Text(
              'Kan grubunuz:',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(139.0, 431.0),
            child: Text(
              'Cinsiyetiniz:',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(162.0, 515.0),
            child: Container(
              width: 51.0,
              height: 52.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                image: DecorationImage(
                  image: const AssetImage('assets/images/addbutton.png'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(width: 1.0, color: const Color(0x00000000)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(268.0, 236.0),
            child: PageLink(
              links: [
                PageLinkInfo(),
              ],
              child: Container(
                width: 56.0,
                height: 48.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/closebutton.png'),
                    fit: BoxFit.cover,
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.59), BlendMode.dstIn),
                  ),
                  border:
                      Border.all(width: 1.0, color: const Color(0x00000000)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_ki75v0 =
    '<svg viewBox="42.0 226.4 291.0 348.6" ><path transform="translate(42.0, 226.36)" d="M 37.66990280151367 0 L 253.3300933837891 0 C 274.1346130371094 0 291 17.68754577636719 291 39.50624084472656 L 291 309.1363220214844 C 291 330.9550170898438 274.1346130371094 348.642578125 253.3300933837891 348.642578125 L 37.66990280151367 348.642578125 C 16.86538887023926 348.642578125 0 330.9550170898438 0 309.1363220214844 L 0 39.50624084472656 C 0 17.68754577636719 16.86538887023926 0 37.66990280151367 0 Z" fill="#ffffff" fill-opacity="0.13" stroke="#707070" stroke-width="1" stroke-opacity="0.31" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
