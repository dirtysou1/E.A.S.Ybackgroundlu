import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy/Component111.dart';




class Component121 extends StatefulWidget {
  @override
  _Component121State createState() => _Component121State();
}

class _Component121State extends State<Component121> {
  AudioPlayer advancedPlayer;
Component111 dd =  Component111();




  @override
  Widget build(BuildContext context) {
    return Container(
      width: 97.58,
      height: 93.55,
      child: FlatButton(
        onPressed: ()  {
          print(dd.getFlag);
          dd.setFlag =0;
          print(dd.getFlag);
        },
        child: Stack(
          children: <Widget>[
            Pinned.fromSize(
              bounds: Rect.fromLTWH(0.0, 0.0, 97.6, 93.6),
              size: Size(97.6, 93.6),
              pinLeft: true,
              pinRight: true,
              pinTop: true,
              pinBottom: true,
              child: SvgPicture.string(
                _svg_k2osvq,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
            Pinned.fromSize(
              bounds: Rect.fromLTWH(17.7, 18.9, 69.7, 55.7),
              size: Size(97.6, 93.6),
              pinLeft: true,
              pinRight: true,
              pinTop: true,
              pinBottom: true,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/iyi.png'),
                    fit: BoxFit.cover,
                  ),
                  border:
                      Border.all(width: 1.0, color: const Color(0x00000000)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const String _svg_k2osvq =
    '<svg viewBox="0.0 0.0 97.6 93.6" ><path transform="translate(0.0, 0.0)" d="M 48.79222106933594 0 C 75.73941040039063 0 97.58444213867188 20.94243621826172 97.58444213867188 46.7762336730957 C 97.58444213867188 72.61003112792969 75.73941040039063 93.55246734619141 48.79222106933594 93.55246734619141 C 21.84502220153809 93.55246734619141 -3.814697322468419e-07 72.61003112792969 -3.814697322468419e-07 46.7762336730957 C -3.814697322468419e-07 20.94243621826172 21.84502220153809 0 48.79222106933594 0 Z" fill="#058745" stroke="#ffffff" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
