import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:easy/Yaknlarm.dart';
import 'package:easy/custom_dialog_box.dart';
import 'package:easy/widgets/spaces.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:easy/AddEditPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'Butonlar.dart';
import 'main.dart';
import 'widgets/potbelly_button.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future addData() async {
    var url = 'https://www.easyrescuer.com/read.php';
    var response = await http.post(Uri.parse(url), body: {
      "userid": finalID.toString().trim(),
    });
    return jsonDecode(response.body);
  }

  Future getData() async {
    var url = 'https://www.easyrescuer.com/read.php';
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
  }

String Otomatikmi;


  var urlY = "https://www.easyrescuer.com/YardimSil2.php";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('YAKINLARIM'),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset('assets/images/2.0x/closebutton.png'),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => MyStatefulWidget()));
          },
        ),
      ),
      floatingActionButton:
          _getFAB() /*FloatingActionButton(backgroundColor: Colors.amber[900],
        child: Icon(Icons.add,size: 50,),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddEditPage(),),);
          debugPrint('Clicked FloatingActionButton Button');
        },
      ),*/
      ,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder(
          future: addData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      List list = snapshot.data;


                      Future yardimSil() async {
                        var url = 'https://www.easyrescuer.com/YardimSil.php';
                        var response = await http.post(Uri.parse(url), body: {
                          "yardim_tel": (list[index]['phone']).toString().trim(),
                        });
                        return jsonDecode(response.body);
                      }


                      void getOto() async{
                        var response = await http.post(Uri.parse(urlY),
                            body: {
                              "yardim_tel": (list[index]['phone']).toString().trim(),


                            }


                        );
                        print((list[index]['phone']).toString().trim());
                        var jsonData = jsonDecode(response.body);
                        var jsonString = jsonData['message'];
                        var otoyardim =jsonData['yardim_Otomatik'];
                        if(jsonString=='yardim var'){
                          myToast(jsonString);
                          //await FlutterSession().set('token',_emailTextController.text.trim());


                          final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                          sharedPreferences.setString('otoyardim', otoyardim);
                          var obtainYardim = sharedPreferences.getString('otoyardim');
                          Otomatikmi = obtainYardim;


                          if(Otomatikmi=='OTO'){
                            yardimSil();
                            Otomatikmi=null;
                            myToast("Kişinin kendiliğinden oluşan yardım çağrısı silindi");

                          }else {
                            myToast("Bu sadece felaket sonrası otomatik yardım çağrılarını siler."
                                "Yakınınızın cihazından otomatik bir yardım çağrısı henüz alınmadı. ");
                          }

                          print(Otomatikmi);

                        }else{
                        //  myToast(jsonString);
                          print('başarısız');

                          print('başarısız $Otomatikmi');
                        }
                      }





                      return Center(
                        child: Container(
                          height: 65,
                          width: 320,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 50,
                          ),
                          margin:
                              EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
                          child: ListTile(

                            leading: GestureDetector(
                              child: Icon(Icons.edit),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddEditPage(
                                      list: list,
                                      index: index,
                                    ),
                                  ),
                                );
                                debugPrint('Düzenleme etkin');
                              },
                            ),
                            title: Text(list[index]['name']),
                            subtitle: Text(list[index]['phone']),
                            trailing: PopupMenuButton(color: Colors.transparent,
                              itemBuilder: (BuildContext bc) => [
                                PopupMenuItem(height: 30,
                                    child: Center(
                                      child: PotbellyButton("Kişiyi sil", buttonWidth: 150,buttonHeight: 25,decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(30),),
                                        onTap:(){

                                        var url = 'https://www.easyrescuer.com/delete.php';
                                      http.post(url,body: {
                                        'id' : list[index]['id'],
                                      });
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MyHomePage(),
                                        ),
                                      );

                                      } ,),
                                    ), ),
                                PopupMenuItem(
                                child: Center(
                                  child: PotbellyButton("Bu kişi güvende",buttonHeight: 25,buttonWidth: 150,decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(30),),
                                    onTap: (){
                                    //yardimSil();
                                      getOto();
                              //myToast('BU ÖZELLİK HENÜZ UYGUN DEĞİL');





                                      },),),
                                    ),
                              /*  PopupMenuItem(
                                    child: Text("Settings"),
                                    value: "/settings"),*/
                              ],
                              onSelected: (route) {
                                print(route);
                                // Note You must create respective pages for navigation

                              },
                            ),

                            /*GestureDetector(child: Icon(Icons.delete),
                          onTap: (){


                           /* setState(() {

                              var url = 'https://www.easyrescuer.com/delete.php';
                              http.post(url,body: {
                                'id' : list[index]['id'],
                              });
                            });*/
                            debugPrint('Silindi');
                          },),*/
                          ),
                        ),
                      );
                    })
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  int _counter;
  Widget _getFAB() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22),
      backgroundColor: Colors.amber,
      visible: true,
      curve: Curves.bounceIn,
      children: [
        // FAB 1
        SpeedDialChild(
            child: Icon(
              Icons.refresh,
            ),
            backgroundColor: Colors.amber[900],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
            label: 'YENİLE',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: Colors.amber[900]),
        // FAB 2

        SpeedDialChild(
            child: Icon(Icons.home_filled),
            backgroundColor: Colors.amber[900],
            onTap: () {
              setState(() {
                _counter = 1;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyStatefulWidget(),
                  ),
                );
              });
            },
            label: 'ANASAYFA',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: Colors.amber[900]),

        SpeedDialChild(
            child: Icon(Icons.add),
            backgroundColor: Colors.amber[900],
            onTap: () {
              setState(() {
                _counter = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddEditPage(),
                  ),
                );
              });
            },
            label: 'EKLE',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: Colors.amber[900]),
      ],
    );
  }
}
myToast(String toast){
  return Fluttertoast.showToast(
      msg: toast,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white
  );
}
