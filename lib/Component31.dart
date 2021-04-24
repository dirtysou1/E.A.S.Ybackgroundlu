import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Component31 extends StatelessWidget {
  Component31({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Pinned.fromSize(
          bounds: Rect.fromLTWH(39.5, 28.0, 61.0, 75.0),
          size: Size(140.0, 131.0),
          fixedWidth: true,
          fixedHeight: true,
          child:
              // Adobe XD layer: 'person_icon_md' (shape)
              Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/personcon.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Pinned.fromSize(
          bounds: Rect.fromLTWH(78.7, 83.4, 37.6, 37.5),
          size: Size(140.0, 131.0),
          pinBottom: true,
          fixedWidth: true,
          fixedHeight: true,
          child: Stack(
            children: <Widget>[
              Pinned.fromSize(
                bounds: Rect.fromLTWH(0.0, 0.0, 37.6, 37.5),
                size: Size(37.6, 37.5),
                pinLeft: true,
                pinRight: true,
                pinTop: true,
                pinBottom: true,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 0.0, 37.6, 37.5),
                      size: Size(37.6, 37.5),
                      pinLeft: true,
                      pinRight: true,
                      pinTop: true,
                      pinBottom: true,
                      child: SvgPicture.string(
                        _svg_424v8a,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(6.0, 6.0, 25.6, 25.4),
                      size: Size(37.6, 37.5),
                      fixedWidth: true,
                      fixedHeight: true,
                      child: Transform.rotate(
                        angle: 0.0175,
                        child:
                            // Adobe XD layer: 'icon/content/add_24…' (group)
                            Stack(
                          children: <Widget>[
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(0.0, 0.0, 7.7, 7.7),
                              size: Size(25.6, 25.4),
                              pinLeft: true,
                              pinRight: true,
                              pinTop: true,
                              pinBottom: true,
                              child:
                                  // Adobe XD layer: 'Boundary' (shape)
                                  Container(
                                decoration: BoxDecoration(),
                              ),
                            ),
                            Pinned.fromSize(
                              bounds: Rect.fromLTWH(0.0, 0.0, 25.6, 25.4),
                              size: Size(25.6, 25.4),
                              pinLeft: true,
                              pinRight: true,
                              pinTop: true,
                              pinBottom: true,
                              child:
                                  // Adobe XD layer: ' ↳Color' (shape)
                                  SvgPicture.string(
                                _svg_wh3yu1,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Pinned.fromSize(
          bounds: Rect.fromLTWH(0.0, 0.0, 140.0, 131.0),
          size: Size(140.0, 131.0),
          pinLeft: true,
          pinRight: true,
          pinTop: true,
          pinBottom: true,
          child: SvgPicture.string(
            _svg_adzygz,
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}

const String _svg_wh3yu1 =
    '<svg viewBox="0.0 0.0 25.6 25.4" ><path transform="translate(0.0, 0.0)" d="M 25.57923698425293 14.53474807739258 L 14.61670875549316 14.53474807739258 L 14.61670875549316 25.4358081817627 L 10.96252822875977 25.4358081817627 L 10.96252822875977 14.53474807739258 L 2.521377532470657e-17 14.53474807739258 L 0 10.90106010437012 L 10.96252822875977 10.90106010437012 L 10.96252822875977 0 L 14.61670875549316 5.071194857889867e-17 L 14.61670875549316 10.90106010437012 L 25.57923698425293 10.90106010437012 L 25.57923698425293 14.53474807739258 Z" fill="#ffffff" fill-opacity="0.45" stroke="none" stroke-width="1" stroke-opacity="0.45" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_424v8a =
    '<svg viewBox="0.0 0.0 37.6 37.5" ><path  d="M 18.82223510742188 0 C 29.21746444702148 0 37.64447021484375 8.399020195007324 37.64447021484375 18.75973701477051 C 37.64447021484375 29.12045288085938 29.21746444702148 37.51947402954102 18.82223510742188 37.51947402954102 C 8.427002906799316 37.51947402954102 0 29.12045288085938 0 18.75973701477051 C 0 8.399020195007324 8.427002906799316 0 18.82223510742188 0 Z" fill="#3a3939" fill-opacity="0.38" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_adzygz =
    '<svg viewBox="0.0 0.0 140.0 131.0" ><defs><filter id="shadow"><feDropShadow dx="0" dy="3" stdDeviation="6"/></filter></defs><path  d="M 70 0 C 108.6599273681641 0 140 29.32535171508789 140 65.5 C 140 90.71372985839844 124.7747116088867 112.6000061035156 102.1958160400391 123.6760101318359 C 92.75588989257813 128.3076629638672 81.71395874023438 131 70 131 C 31.34007263183594 131 0 101.6746444702148 0 65.5 C 0 29.32535171508789 31.34007263183594 0 70 0 Z" fill="#000000" fill-opacity="0.2" stroke="#ffffff" stroke-width="1" stroke-opacity="0.24" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/></svg>';
