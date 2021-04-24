import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Component41 extends StatelessWidget {
  Component41({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Pinned.fromSize(
          bounds: Rect.fromLTWH(0.0, 0.0, 127.0, 37.0),
          size: Size(127.0, 37.0),
          pinLeft: true,
          pinRight: true,
          pinTop: true,
          pinBottom: true,
          child: SvgPicture.string(
            _svg_iena84,
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}

const String _svg_iena84 =
    '<svg viewBox="0.0 0.0 127.0 37.0" ><path  d="M 0 0 L 127 0 L 127 37 L 82.58338928222656 37 L 0 37 L 0 0 Z" fill="#ffffff" fill-opacity="0.04" stroke="#707070" stroke-width="1" stroke-opacity="0.04" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
