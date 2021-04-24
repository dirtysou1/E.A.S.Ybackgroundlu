
import 'package:easy/views/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:easy/values/values.dart';

import 'package:shared_preferences/shared_preferences.dart';





import 'main.dart';
import 'widgets/potbelly_button.dart';
import 'widgets/spaces.dart';


class ProfilSayfasi extends StatefulWidget {
  @override
  _ProfilSayfasiState createState() => _ProfilSayfasiState();

}

class _ProfilSayfasiState extends State<ProfilSayfasi> {





  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.purple,
        // home: Image.asset('assets/bg.jpg'),

        //backgroundColor: Colors.white,
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/backg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                    child: Column(
                      children: <Widget>[

                        _profil()
                      ],
                    )),
              ),
            )),
      ),
    );
  }





  Widget _profil() {

    if(isim==null){
      isim=finalisim;
      soyisim=finalsoyisim;
      il= finalil;
      dogumyili=finaldogumyili;
    }

    return new Column(

      children: [
        CircleAvatar(
          radius: 70,
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.3),
          child: Image.asset('assets/images/personcon.png'),
        ),
        SpaceH40(),
        Container(
          height: 450,
          width: 400,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.3),
            borderRadius: BorderRadius.circular(30),
          ),

          margin: EdgeInsets.only(left: 10.0, right: 10.0,bottom: 20),
          child: Center(
            child: Column(children: [
              SpaceH44(),
              Container(
                height: 65,
                width: 250,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(43, 43, 44, 1.0),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.only(
                  left: 10,
                  right: 50,
                ),
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Center(
                    child: Text(
                      "İsim :  ${isim}",
                      style: Styles.normalTextStyle,
                    )),
              ),
              SpaceH16(),
              Container(
                height: 65,
                width: 250,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(43, 43, 44, 1.0),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.only(
                  left: 10,
                  right: 50,
                ),
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Center(
                    child: Text(
                      "Soyisim :  ${soyisim}",
                      style: Styles.normalTextStyle,
                    )),
              ),
              SpaceH16(),
              Container(
                height: 65,
                width: 250,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(43, 43, 44, 1.0),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.only(
                  left: 10,
                  right: 50,
                ),
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Center(
                    child: Text(
                      "Doğum yılınız :  $dogumyili",
                      style: Styles.normalTextStyle,
                    )),
              ),
              SpaceH16(),
              Container(
                height: 65,
                width: 250,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(43, 43, 44, 1.0),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.only(
                  left: 10,
                  right: 50,
                ),
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Center(
                    child: Text(
                      "İl :  ${il}",
                      style: Styles.normalTextStyle,
                    )),
              ),
              SpaceH30(),
              SizedBox(width: 150,
                height: 50,
                child: PotbellyButton(
                  StringConst.CIKIS,
                  decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(30)),
                  onTap: () async {
                    final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                    sharedPreferences.remove('email');
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => LoginScreen()));
                  },
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
