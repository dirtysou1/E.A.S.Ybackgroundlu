import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:easy/Yakinlar.dart';
import 'package:easy/values/values.dart';
import 'main.dart';
import 'widgets/potbelly_button.dart';
import 'widgets/spaces.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
class AddEditPage extends StatefulWidget {
  final List list;
  final int index;
  AddEditPage({this.list, this.index});
  @override
  _AddEditPageState createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {


  bool _autoValidate = false;
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  var maskFormatter = new MaskTextInputFormatter(mask: '(###) ###-##-##', filter: { "#": RegExp(r'[0-9]') });

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();

  bool editMode = false;

  addUpdateData() {
    if (editMode) {
      var url = 'https://www.easyrescuer.com/edit.php';
      http.post(url, body: {
        'id': widget.list[widget.index]['id'],
        'name': firstName.text.toUpperCase(),
        'phone': phone.text,
        'address': address.text,
      });
    } else {
      var url = 'https://www.easyrescuer.com/add.php';
      http.post(url, body: {
        'userid': finalID.trim(),
        'name': firstName.text.toUpperCase(),
        'phone': phone.text,
        'address': address.text,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      editMode = true;
      firstName.text = widget.list[widget.index]['name'];
      phone.text = widget.list[widget.index]['phone'];
      address.text = widget.list[widget.index]['address'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromRGBO(255, 255, 255, 0.3),
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Color.fromRGBO(255, 255, 255, 0.2),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset('assets/images/2.0x/closebutton.png'),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => MyHomePage()));
          },),
        title: Text(editMode ? 'Kişiyi düzenle' : 'Kişi ekle'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/yakinbg.jpg"),
            fit: BoxFit.cover,
          ),
        ),

    child: Container(
      child: Form(
        key: _formKey,
        autovalidate: _autoValidate,child: ListView(
            children: <Widget>[
              SpaceH96(),
              Center(
                  child: Text(
                    editMode ? 'KİŞİ DÜZENLE' : 'KİŞİ EKLE',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  )),
              SpaceH40(),
              Center(
                child: new Container(
                  height: 65,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 50,
                  ),
                  margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
                  child: new TextFormField(
                      style: Styles.normalTextStyle,
                      controller: firstName,
                      validator: _validateFields,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.people_outline_rounded),
                        //labelText: " ",

                        hintText: "Kişinin adı ve soyadı",
                        hintStyle: Styles.customNormalTextStyle(
                            fontSize: 13, color: Colors.white),
                        labelStyle: Styles.customNormalTextStyle(fontSize: 16),
                      )),
                ),
              ),

              Center(
                child: new Container(
                  height: 65,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 50,
                  ),
                  margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
                  child: new TextFormField(
                      style: Styles.normalTextStyle,
                      controller: phone,
                      inputFormatters: [maskFormatter],
                      validator: (value) {
                        if (value.length != 15) {
                          return "Geçerli bir telefon numarası girin.";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),helperText: "         (5XX) XXX-XX-XX",helperStyle: TextStyle(color: Colors.red,fontSize: 12),
                       // labelText: "Başında Sıfır olmadan giriniz",
                        hintText: "Kişinin numarası",
                        hintStyle: Styles.customNormalTextStyle(
                            fontSize: 13, color: Colors.white),
                        labelStyle: Styles.customNormalTextStyle(fontSize: 16),
                      )),
                ),
              ),

              SpaceH30(),

              Container(
                //margin: EdgeInsets.only(left: 100.0, right: 20.0, top: 20),
                child: Center(
                  child: Column(
                    children: [

                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Center(
                          child: RaisedButton(
                            onPressed: () {
                              setState(() {
                                _ButtonTaped();
                              });

                              debugPrint('Clicked RaisedButton Button');
                            },
                            color: Color.fromRGBO(60, 63, 65, 1.0),
                            child: Text(
                              editMode ? 'Değiştir' : 'Kaydet',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    MyHomePage()));
                          },
                          color: Color.fromRGBO(60, 63, 65, 1.0),
                          child: Text(
                            "İptal",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  _ButtonTaped() {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      //sign up user..
      addUpdateData();

      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>
              MyHomePage()));
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}

  String _validateFields(String text) {
    if (text.length == 0) {
      return "Boş kalmamalı";
    } else {
      return null;
    }
  }


