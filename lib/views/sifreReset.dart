import 'dart:convert';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy/widgets/potbelly_button.dart';
import 'package:flutter/material.dart';
import 'package:easy/values/values.dart';
import 'package:easy/widgets/spaces.dart';
import 'package:http/http.dart' as http;

import 'LoginScreen.dart';

class passReset extends StatefulWidget {
  @override
  _passResetState createState() => _passResetState();
}

class _passResetState extends State<passReset> {
  final TextEditingController _emailTextController =
      new TextEditingController();
  var divWidth;
  bool _autoValidate = false;
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    divWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
              key: _formKey,
              autovalidate: _autoValidate,
              child: Column(
                children: <Widget>[_sifreRes()],
              )),
        ),
      ),
    ));
  }

  void addData2() async {
    var url = "https://www.easyrescuer.com/SİFRERESET/yeniSifre.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": _emailTextController.text.trim(),
    });
    var jsonData = jsonDecode(response.body);
    var jsonString = jsonData['message'];
    if (jsonString == 'E-posta gönderildi') {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var urlSifre = jsonData['url'];
      var isimSifre = jsonData['isim'];
      var soyisimSifre = jsonData['soyisim'];
      preferences.setString("urlSifre", urlSifre);
      var urlGet = preferences.getString("urlSifre");
      print(urlGet);
      print('$isimSifre , $soyisimSifre , $_emailTextController , $urlSifre  ');
      sendMail(isimSifre, soyisimSifre, (_emailTextController).text, urlSifre);
      myToast(
          "E-postanızdaki gelen kutusunu veya spam bölümünü kontrol ediniz.");
      //You can route to your desire page here
    }
  }

  sendMail(dynamic isimSifre, dynamic soyisimSifre, dynamic emailSifre,
      dynamic urlGet) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    print('SEND EMAİL $emailSifre $isimSifre $soyisimSifre $emailSifre');
    String username = "noreply@easyrescuer.com";
    String password = "153624AaAa"; //passsword
    final smtpServer = SmtpServer('smtp.hostinger.com',
        username: username, password: password);
    //final smtpServer = gmail(username, password);
    // Creating the Gmail server

    // Create our email message.
    final message = Message()
      ..from = Address(username)
      ..recipients.add(emailSifre) //recipent email
      //..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com']) //cc Recipents emails
      //..bccRecipients.add(Address('bccAddress@example.com')) //bcc Recipents emails
      ..subject =
          'Easy Rescuer - Şifre yenileme linkiniz ' //subject of the email
      //..text =
      //'This is the plain text.\nThis is line 2 of the text part.'
      ..html = """ 
<html style="margin: 0;padding: 0;" xmlns="http://www.w3.org/1999/xhtml"><!--<![endif]--><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title></title>
    <!--[if !mso]><!--><meta http-equiv="X-UA-Compatible" content="IE=edge"><!--<![endif]-->
    <meta name="viewport" content="width=device-width"><style type="text/css">
@media only screen and (min-width: 620px){.wrapper{min-width:600px !important}.wrapper h1{}.wrapper h1{font-size:56px !important;line-height:60px !important}.wrapper h2{}.wrapper h2{font-size:26px !important;line-height:34px !important}.wrapper h3{}.column{}.wrapper .size-8{font-size:8px !important;line-height:14px !important}.wrapper .size-9{font-size:9px !important;line-height:16px !important}.wrapper .size-10{font-size:10px !important;line-height:18px !important}.wrapper .size-11{font-size:11px !important;line-height:19px !important}.wrapper .size-12{font-size:12px !important;line-height:19px !important}.wrapper .size-13{font-size:13px !important;line-height:21px !important}.wrapper .size-14{font-size:14px !important;line-height:21px !important}.wrapper .size-15{font-size:15px !important;line-height:23px !important}.wrapper .size-16{font-size:16px !important;line-height:24px 
!important}.wrapper .size-17{font-size:17px !important;line-height:26px !important}.wrapper .size-18{font-size:18px !important;line-height:26px !important}.wrapper .size-20{font-size:20px !important;line-height:28px !important}.wrapper .size-22{font-size:22px !important;line-height:31px !important}.wrapper .size-24{font-size:24px !important;line-height:32px !important}.wrapper .size-26{font-size:26px !important;line-height:34px !important}.wrapper .size-28{font-size:28px !important;line-height:36px !important}.wrapper .size-30{font-size:30px !important;line-height:38px !important}.wrapper .size-32{font-size:32px !important;line-height:40px !important}.wrapper .size-34{font-size:34px !important;line-height:43px !important}.wrapper .size-36{font-size:36px !important;line-height:43px !important}.wrapper .size-40{font-size:40px !important;line-height:47px !important}.wrapper 
.size-44{font-size:44px !important;line-height:50px !important}.wrapper .size-48{font-size:48px !important;line-height:54px !important}.wrapper .size-56{font-size:56px !important;line-height:60px !important}.wrapper .size-64{font-size:64px !important;line-height:63px !important}}
</style>
    <meta name="x-apple-disable-message-reformatting">
    <style type="text/css">
.main, .mso {
  margin: 0;
  padding: 0;
}
table {
  border-collapse: collapse;
  table-layout: fixed;
}
* {
  line-height: inherit;
}
[x-apple-data-detectors] {
  color: inherit !important;
  text-decoration: none !important;
}
.wrapper .footer__share-button a:hover,
.wrapper .footer__share-button a:focus {
  color: #ffffff !important;
}
.wrapper .footer__share-button a.icon-white:hover,
.wrapper .footer__share-button a.icon-white:focus {
  color: #ffffff !important;
}
.wrapper .footer__share-button a.icon-black:hover,
.wrapper .footer__share-button a.icon-black:focus {
  color: #000000 !important;
}
.btn a:hover,
.btn a:focus,
.footer__share-button a:hover,
.footer__share-button a:focus,
.email-footer__links a:hover,
.email-footer__links a:focus {
  opacity: 0.8;
}
.preheader,
.header,
.layout,
.column {
  transition: width 0.25s ease-in-out, max-width 0.25s ease-in-out;
}
.preheader td {
  padding-bottom: 8px;
}
.layout,
div.header {
  max-width: 400px !important;
  -fallback-width: 95% !important;
  width: calc(100% - 20px) !important;
}
div.preheader {
  max-width: 360px !important;
  -fallback-width: 90% !important;
  width: calc(100% - 60px) !important;
}
.snippet,
.webversion {
  Float: none !important;
}
.stack .column {
  max-width: 400px !important;
  width: 100% !important;
}
.fixed-width.has-border {
  max-width: 402px !important;
}
.fixed-width.has-border .layout__inner {
  box-sizing: border-box;
}
.snippet,
.webversion {
  width: 50% !important;
}
.ie .btn {
  width: 100%;
}
.ie .stack .column,
.ie .stack .gutter {
  display: table-cell;
  float: none !important;
}
.ie div.preheader,
.ie .email-footer {
  max-width: 560px !important;
  width: 560px !important;
}
.ie .snippet,
.ie .webversion {
  width: 280px !important;
}
.ie div.header,
.ie .layout {
  max-width: 600px !important;
  width: 600px !important;
}
.ie .two-col .column {
  max-width: 300px !important;
  width: 300px !important;
}
.ie .three-col .column,
.ie .narrow {
  max-width: 200px !important;
  width: 200px !important;
}
.ie .wide {
  width: 400px !important;
}
.ie .stack.fixed-width.has-border,
.ie .stack.has-gutter.has-border {
  max-width: 602px !important;
  width: 602px !important;
}
.ie .stack.two-col.has-gutter .column {
  max-width: 290px !important;
  width: 290px !important;
}
.ie .stack.three-col.has-gutter .column,
.ie .stack.has-gutter .narrow {
  max-width: 188px !important;
  width: 188px !important;
}
.ie .stack.has-gutter .wide {
  max-width: 394px !important;
  width: 394px !important;
}
.ie .stack.two-col.has-gutter.has-border .column {
  max-width: 292px !important;
  width: 292px !important;
}
.ie .stack.three-col.has-gutter.has-border .column,
.ie .stack.has-gutter.has-border .narrow {
  max-width: 190px !important;
  width: 190px !important;
}
.ie .stack.has-gutter.has-border .wide {
  max-width: 396px !important;
  width: 396px !important;
}
.ie .fixed-width .layout__inner {
  border-left: 0 none white !important;
  border-right: 0 none white !important;
}
.ie .layout__edges {
  display: none;
}
.mso .layout__edges {
  font-size: 0;
}
.layout-fixed-width,
.mso .layout-full-width {
  background-color: #ffffff;
}
@media only screen and (min-width: 620px) {
  .column,
  .gutter {
    display: table-cell;
    Float: none !important;
    vertical-align: top;
  }
  div.preheader,
  .email-footer {
    max-width: 560px !important;
    width: 560px !important;
  }
  .snippet,
  .webversion {
    width: 280px !important;
  }
  div.header,
  .layout,
  .one-col .column {
    max-width: 600px !important;
    width: 600px !important;
  }
  .fixed-width.has-border,
  .fixed-width.x_has-border,
  .has-gutter.has-border,
  .has-gutter.x_has-border {
    max-width: 602px !important;
    width: 602px !important;
  }
  .two-col .column {
    max-width: 300px !important;
    width: 300px !important;
  }
  .three-col .column,
  .column.narrow,
  .column.x_narrow {
    max-width: 200px !important;
    width: 200px !important;
  }
  .column.wide,
  .column.x_wide {
    width: 400px !important;
  }
  .two-col.has-gutter .column,
  .two-col.x_has-gutter .column {
    max-width: 290px !important;
    width: 290px !important;
  }
  .three-col.has-gutter .column,
  .three-col.x_has-gutter .column,
  .has-gutter .narrow {
    max-width: 188px !important;
    width: 188px !important;
  }
  .has-gutter .wide {
    max-width: 394px !important;
    width: 394px !important;
  }
  .two-col.has-gutter.has-border .column,
  .two-col.x_has-gutter.x_has-border .column {
    max-width: 292px !important;
    width: 292px !important;
  }
  .three-col.has-gutter.has-border .column,
  .three-col.x_has-gutter.x_has-border .column,
  .has-gutter.has-border .narrow,
  .has-gutter.x_has-border .narrow {
    max-width: 190px !important;
    width: 190px !important;
  }
  .has-gutter.has-border .wide,
  .has-gutter.x_has-border .wide {
    max-width: 396px !important;
    width: 396px !important;
  }
}
@supports (display: flex) {
  @media only screen and (min-width: 620px) {
    .fixed-width.has-border .layout__inner {
      display: flex !important;
    }
  }
}
@media only screen and (-webkit-min-device-pixel-ratio: 2), only screen and (min--moz-device-pixel-ratio: 2), only screen and (-o-min-device-pixel-ratio: 2/1), only screen and (min-device-pixel-ratio: 2), only screen and (min-resolution: 192dpi), only screen and (min-resolution: 2dppx) {
  .fblike {
    background-image: url(https://i7.createsend1.com/static/eb/master/13-the-blueprint-3/images/fblike@2x.png) !important;
  }
  .tweet {
    background-image: url(https://i10.createsend1.com/static/eb/master/13-the-blueprint-3/images/tweet@2x.png) !important;
  }
  .linkedinshare {
    background-image: url(https://i8.createsend1.com/static/eb/master/13-the-blueprint-3/images/lishare@2x.png) !important;
  }
  .forwardtoafriend {
    background-image: url(https://i9.createsend1.com/static/eb/master/13-the-blueprint-3/images/forward@2x.png) !important;
  }
}
@media (max-width: 321px) {
  .fixed-width.has-border .layout__inner {
    border-width: 1px 0 !important;
  }
  .layout,
  .stack .column {
    min-width: 320px !important;
    width: 320px !important;
  }
  .border {
    display: none;
  }
  .has-gutter .border {
    display: table-cell;
  }
}
@media(max-width: 619px) {
  .email-flexible-footer .left-aligned-footer .column,
  .email-flexible-footer .center-aligned-footer,
  .email-flexible-footer .right-aligned-footer .column {
    /*Overriding inline styles for mobile compatiability*/
    text-align: center !important;
    max-width: calc(100% - 40px) !important;
    width: calc(100% - 40px);
    margin-left: 20px;
    margin-right: 20px;
  }
  .email-flexible-footer .footer__share-button {
    max-width: 280px;
    margin: 0 auto;
  }
  .email-flexible-footer .left-aligned-footer .flexible-footer__share-button__container,
  .email-flexible-footer .center-aligned-footer .flexible-footer__share-button__container,
  .email-flexible-footer .right-aligned-footer .flexible-footer__share-button__container {
    display: inline-block;
    /*Overriding inline styles for mobile compatiability*/
    margin-left: 5px !important;
    margin-right: 5px !important;
  }
}
.mso div {
  border: 0 none white !important;
}
.mso .w560 .divider {
  Margin-left: 260px !important;
  Margin-right: 260px !important;
}
.mso .w360 .divider {
  Margin-left: 160px !important;
  Margin-right: 160px !important;
}
.mso .w260 .divider {
  Margin-left: 110px !important;
  Margin-right: 110px !important;
}
.mso .w160 .divider {
  Margin-left: 60px !important;
  Margin-right: 60px !important;
}
.mso .w354 .divider {
  Margin-left: 157px !important;
  Margin-right: 157px !important;
}
.mso .w250 .divider {
  Margin-left: 105px !important;
  Margin-right: 105px !important;
}
.mso .w148 .divider {
  Margin-left: 54px !important;
  Margin-right: 54px !important;
}
.mso .size-8,
.ie .size-8 {
  font-size: 8px !important;
  line-height: 14px !important;
}
.mso .size-9,
.ie .size-9 {
  font-size: 9px !important;
  line-height: 16px !important;
}
.mso .size-10,
.ie .size-10 {
  font-size: 10px !important;
  line-height: 18px !important;
}
.mso .size-11,
.ie .size-11 {
  font-size: 11px !important;
  line-height: 19px !important;
}
.mso .size-12,
.ie .size-12 {
  font-size: 12px !important;
  line-height: 19px !important;
}
.mso .size-13,
.ie .size-13 {
  font-size: 13px !important;
  line-height: 21px !important;
}
.mso .size-14,
.ie .size-14 {
  font-size: 14px !important;
  line-height: 21px !important;
}
.mso .size-15,
.ie .size-15 {
  font-size: 15px !important;
  line-height: 23px !important;
}
.mso .size-16,
.ie .size-16 {
  font-size: 16px !important;
  line-height: 24px !important;
}
.mso .size-17,
.ie .size-17 {
  font-size: 17px !important;
  line-height: 26px !important;
}
.mso .size-18,
.ie .size-18 {
  font-size: 18px !important;
  line-height: 26px !important;
}
.mso .size-20,
.ie .size-20 {
  font-size: 20px !important;
  line-height: 28px !important;
}
.mso .size-22,
.ie .size-22 {
  font-size: 22px !important;
  line-height: 31px !important;
}
.mso .size-24,
.ie .size-24 {
  font-size: 24px !important;
  line-height: 32px !important;
}
.mso .size-26,
.ie .size-26 {
  font-size: 26px !important;
  line-height: 34px !important;
}
.mso .size-28,
.ie .size-28 {
  font-size: 28px !important;
  line-height: 36px !important;
}
.mso .size-30,
.ie .size-30 {
  font-size: 30px !important;
  line-height: 38px !important;
}
.mso .size-32,
.ie .size-32 {
  font-size: 32px !important;
  line-height: 40px !important;
}
.mso .size-34,
.ie .size-34 {
  font-size: 34px !important;
  line-height: 43px !important;
}
.mso .size-36,
.ie .size-36 {
  font-size: 36px !important;
  line-height: 43px !important;
}
.mso .size-40,
.ie .size-40 {
  font-size: 40px !important;
  line-height: 47px !important;
}
.mso .size-44,
.ie .size-44 {
  font-size: 44px !important;
  line-height: 50px !important;
}
.mso .size-48,
.ie .size-48 {
  font-size: 48px !important;
  line-height: 54px !important;
}
.mso .size-56,
.ie .size-56 {
  font-size: 56px !important;
  line-height: 60px !important;
}
.mso .size-64,
.ie .size-64 {
  font-size: 64px !important;
  line-height: 63px !important;
}
</style>
    
  <!--[if !mso]><!--><style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Oswald:400,700,400italic);
</style><link href="./easyrescuer.createsend.com_files/css" rel="stylesheet" type="text/css"><!--<![endif]--><style type="text/css">
.main,.mso{background-color:#000}.logo a:hover,.logo a:focus{color:#7096b5 !important}.footer-logo a:hover,.footer-logo a:focus{color:#b59b69 !important}.mso .layout-has-border{border-top:1px solid #000;border-bottom:1px solid #000}.mso .layout-has-bottom-border{border-bottom:1px solid #000}.mso .border,.ie .border{background-color:#000}.mso h1,.ie h1{}.mso h1,.ie h1{font-size:56px !important;line-height:60px !important}.mso h2,.ie h2{}.mso h2,.ie h2{font-size:26px !important;line-height:34px !important}.mso h3,.ie h3{}.mso .layout__inner,.ie .layout__inner{}.mso .footer__share-button p{}.mso .footer__share-button p{font-family:sans-serif}
</style><meta name="robots" content="noindex,nofollow">
<meta property="og:title" content="Doğrulama linki">
</head>
<!--[if mso]>
  <body class="mso">
<![endif]-->
<!--[if !mso]><!-->
  <body class="main full-padding" style="margin: 0;padding: 0;-webkit-text-size-adjust: 100%;" data-new-gr-c-s-check-loaded="14.1007.0" data-gr-ext-installed="">
<!--<![endif]-->
    <table class="wrapper" style="border-collapse: collapse;table-layout: fixed;min-width: 320px;width: 100%;background-color: #000;" cellpadding="0" cellspacing="0" role="presentation"><tbody><tr><td>
      <div role="banner">
        <div class="preheader" style="Margin: 0 auto;max-width: 560px;min-width: 280px; width: 280px;width: calc(28000% - 167440px);">
          <div style="border-collapse: collapse;display: table;width: 100%;">
          <!--[if (mso)|(IE)]><table align="center" class="preheader" cellpadding="0" cellspacing="0" role="presentation"><tr><td style="width: 280px" valign="top"><![endif]-->
            <div class="snippet" style="display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 140px; width: 140px;width: calc(14000% - 78120px);padding: 10px 0 5px 0;color: #2f3433;font-family: sans-serif;">
              
            </div>
          <!--[if (mso)|(IE)]></td><td style="width: 280px" valign="top"><![endif]-->
            <div class="webversion" style="display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 139px; width: 139px;width: calc(14100% - 78680px);padding: 10px 0 5px 0;text-align: right;color: #2f3433;font-family: sans-serif;">
              
            </div>
          <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
          </div>
        </div>
        <div class="header" style="Margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;width: calc(28000% - 167400px);" id="emb-email-header-container">
        <!--[if (mso)|(IE)]><table align="center" class="header" cellpadding="0" cellspacing="0" role="presentation"><tr><td style="width: 600px"><![endif]-->
          <div class="logo emb-logo-margin-box" style="font-size: 26px;line-height: 32px;Margin-top: 6px;Margin-bottom: 20px;color: #41637e;font-family: Avenir,sans-serif;Margin-left: 20px;Margin-right: 20px;" align="center">
            <div class="logo-center" align="center" id="emb-email-header"><img style="display: block;height: auto;width: 100%;border: 0;max-width: 181px;" src="./easyrescuer.createsend.com_files/icon1.png" alt="" width="181"></div>
          </div>
        <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
        </div>
      </div>
      <div>
      <div class="layout one-col fixed-width stack" style="Margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;width: calc(28000% - 167400px);overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;">
        <div class="layout__inner" style="border-collapse: collapse;display: table;width: 100%;background-color: #000000;">
        <!--[if (mso)|(IE)]><table align="center" cellpadding="0" cellspacing="0" role="presentation"><tr class="layout-fixed-width" style="background-color: #000000;"><td style="width: 600px" class="w560"><![endif]-->
          <div class="column" style="text-align: left;color: #2f3433;font-size: 15px;line-height: 23px;font-family: sans-serif;">
        
            <div style="Margin-left: 20px;Margin-right: 20px;Margin-top: 24px;">
      <div style="mso-line-height-rule: exactly;mso-text-raise: 11px;vertical-align: middle;">
        <h1 class="size-34" style="Margin-top: 0;Margin-bottom: 20px;font-style: normal;font-weight: normal;color: #2f3433;font-size: 30px;line-height: 38px;font-family: Oswald,Avenir Next Condensed,Arial Narrow,MS UI Gothic,sans-serif;text-align: center;" lang="x-size-34"><span style="color:#ffffff">E A S Y</span></h1>
      </div>
    </div>
        
            <div style="Margin-left: 20px;Margin-right: 20px;">
      <div style="mso-line-height-rule: exactly;mso-text-raise: 11px;vertical-align: middle;">
        <h1 style="Margin-top: 0;Margin-bottom: 0;font-style: normal;font-weight: normal;color: #2f3433;font-size: 40px;line-height: 47px;font-family: Oswald,Avenir Next Condensed,Arial Narrow,MS UI Gothic,sans-serif;text-align: center;"><span style="color:#ffffff">${isimSifre} ${soyisimSifre} işte şifreni değiştirmen için gereken buton.</span></h1><p style="Margin-top: 20px;Margin-bottom: 20px;text-align: center;"><span style="color:#faf0fa">Sizi korumak için uygulamanın açık olduğundan emin olun.</span></p>
      </div>
    </div>
        
            <div style="Margin-left: 20px;Margin-right: 20px;Margin-bottom: 24px;">
      <div style="mso-line-height-rule: exactly;mso-text-raise: 11px;vertical-align: middle;">
        <p class="size-30" style="Margin-top: 0;Margin-bottom: 0;font-size: 26px;line-height: 34px;text-align: center;" lang="x-size-30"><span style="color:#ad1616">Sadece butonlar yardımıyla iletişim kurabilirsiniz.</span></p>
      </div>
    </div>
        
          </div>
        <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
        </div>
      </div>
  
      <div style="background-color: #cbd5d6;background: 55% 60%/cover no-repeat url(https://i1.createsend1.com/ei/y/F6/860/A1A/135838/csfinal/backg.png) #cbd5d6;background-position: 55% 60%;background-image: url(https://i1.createsend1.com/ei/y/F6/860/A1A/135838/csfinal/backg.png);background-repeat: no-repeat;background-size: cover;">
        <div class="layout one-col stack" style="Margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;width: calc(28000% - 167400px);overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;">
          <div class="layout__inner" style="border-collapse: collapse;display: table;width: 100%;">
          <!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" role="presentation"><tr class="layout-full-width" style="background: 55% 60%/cover no-repeat url(https://i1.createsend1.com/ei/y/F6/860/A1A/135838/csfinal/backg.png) #cbd5d6;background-position: 55% 60%;background-image: url(https://i1.createsend1.com/ei/y/F6/860/A1A/135838/csfinal/backg.png);background-repeat: no-repeat;background-size: cover;background-color: #cbd5d6;"><td class="layout__edges">&nbsp;</td><td style="width: 600px" class="w560"><![endif]-->
            <div class="column" style="text-align: left;color: #2f3433;font-size: 15px;line-height: 23px;font-family: sans-serif;">
            
              <div style="Margin-left: 20px;Margin-right: 20px;Margin-top: 24px;">
      <div style="mso-line-height-rule: exactly;line-height: 297px;font-size: 1px;">&nbsp;</div>
    </div>
            
              <div style="Margin-left: 20px;Margin-right: 20px;">
      <div style="mso-line-height-rule: exactly;mso-text-raise: 11px;vertical-align: middle;">
        <p class="size-30" style="Margin-top: 0;Margin-bottom: 20px;font-family: arial,sans-serif;font-size: 26px;line-height: 34px;text-align: center;" lang="x-size-30"><span class="font-arial"><strong><span style="color:#ffffff">ŞİFRENİZİ DEĞİŞTİRMEK İÇİN&nbsp; TIKLAYINIZ</span></strong></span></p>
      </div>
    </div>
            
              <div style="Margin-left: 20px;Margin-right: 20px;">
      <div class="btn fullwidth btn--shadow btn--large" style="Margin-bottom: 20px;text-align: center;">
        <!--[if !mso]--><a style="border-radius: 4px;display: block;font-size: 14px;font-weight: bold;line-height: 24px;padding: 12px 24px 13px 24px;text-align: center;text-decoration: none !important;transition: opacity 0.1s ease-in;color: #ffffff !important;box-shadow: inset 0 -2px 0 0 rgba(0, 0, 0, 0.2);background-color: #cc5040;font-family: Arial, sans-serif;" href="$urlGet">ŞİFRENİ DEĞİŞTİR</a><!--[endif]-->
      <!--[if mso]><p style="line-height:0;margin:0;">&nbsp;</p><v:roundrect xmlns:v="urn:schemas-microsoft-com:vml" href="https://easyrescuer.createsend1.com/t/y-l-osuig-l-r/" style="width:560px" arcsize="9%" fillcolor="#CC5040" stroke="f"><v:shadow on="t" color="#A34033" offset="0,2px"></v:shadow><v:textbox style="mso-fit-shape-to-text:t" inset="0px,11px,0px,10px"><center style="font-size:14px;line-height:24px;color:#FFFFFF;font-family:Arial,sans-serif;font-weight:bold;mso-line-height-rule:exactly;mso-text-raise:4px">HESABI DO&#286;RULA</center></v:textbox></v:roundrect><![endif]--></div>
    </div>
            
              <div style="Margin-left: 20px;Margin-right: 20px;Margin-bottom: 24px;">
      <div style="mso-line-height-rule: exactly;line-height: 338px;font-size: 1px;">&nbsp;</div>
    </div>
            
            </div>
          <!--[if (mso)|(IE)]></td><td class="layout__edges">&nbsp;</td></tr></table><![endif]-->
          </div>
        </div>
      </div>
  
      <div style="background-color: #ffffff;">
        <div class="layout two-col stack" style="Margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;width: calc(28000% - 167400px);overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;">
          <div class="layout__inner" style="border-collapse: collapse;display: table;width: 100%;">
          <!--[if (mso)|(IE)]><table width="100%" cellpadding="0" cellspacing="0" role="presentation"><tr class="layout-full-width" style="background-color: #ffffff;"><td class="layout__edges">&nbsp;</td><td style="width: 300px" valign="top" class="w260"><![endif]-->
            <div class="column" style="text-align: left;color: #2f3433;font-size: 15px;line-height: 23px;font-family: sans-serif;max-width: 320px;min-width: 300px; width: 320px;width: calc(12300px - 2000%);Float: left;">
            
        <div style="font-size: 12px;font-style: normal;font-weight: normal;line-height: 19px;" align="center">
          <a style="text-decoration: underline;transition: opacity 0.1s ease-in;color: #41637e;" href="https://easyrescuer.createsend1.com/t/y-l-osuig-l-y/"><img class="gnd-corner-image gnd-corner-image-center gnd-corner-image-top" style="border: 0;display: block;height: auto;width: 100%;max-width: 264px;" alt="" width="264" src="./easyrescuer.createsend.com_files/icon-990514079e028a3c.png"></a>
        </div>
      
              <div style="Margin-left: 20px;Margin-right: 20px;Margin-top: 20px;">
      <div style="mso-line-height-rule: exactly;mso-text-raise: 11px;vertical-align: middle;">
        <h1 class="size-36" style="mso-text-raise: 13px;Margin-top: 0;Margin-bottom: 20px;font-style: normal;font-weight: normal;color: #2f3433;font-size: 30px;line-height: 38px;font-family: oswald,avenir next condensed,arial narrow,ms ui gothic,sans-serif;text-align: center;" lang="x-size-36"><span class="font-oswald"><strong>E A S Y</strong></span></h1>
      </div>
    </div>
            
              <div style="Margin-left: 20px;Margin-right: 20px;Margin-bottom: 24px;">
      <div style="mso-line-height-rule: exactly;line-height: 20px;font-size: 1px;">&nbsp;</div>
    </div>
            
            </div>
          <!--[if (mso)|(IE)]></td><td style="width: 300px" valign="top" class="w260"><![endif]-->
            <div class="column" style="text-align: left;color: #2f3433;font-size: 15px;line-height: 23px;font-family: sans-serif;max-width: 320px;min-width: 300px; width: 320px;width: calc(12300px - 2000%);Float: left;">
            
              <div style="Margin-left: 20px;Margin-right: 20px;Margin-top: 24px;">
      <div style="mso-line-height-rule: exactly;line-height: 43px;font-size: 1px;">&nbsp;</div>
    </div>
            
              <div style="Margin-left: 20px;Margin-right: 20px;">
      <div style="mso-line-height-rule: exactly;mso-text-raise: 11px;vertical-align: middle;">
        <h2 style="Margin-top: 0;Margin-bottom: 0;font-style: normal;font-weight: normal;color: #2f3433;font-size: 22px;line-height: 31px;font-family: Oswald,Avenir Next Condensed,Arial Narrow,MS UI Gothic,sans-serif;text-align: center;">Uygulamamızı kullandığınız için teşekkür ederiz.</h2><p style="Margin-top: 16px;Margin-bottom: 20px;text-align: center;"></p>
      </div>
    </div>
            
              <div style="Margin-left: 20px;Margin-right: 20px;Margin-bottom: 24px;">
      <div style="mso-line-height-rule: exactly;line-height: 15px;font-size: 1px;">&nbsp;</div>
    </div>
            
            </div>
          <!--[if (mso)|(IE)]></td><td class="layout__edges">&nbsp;</td></tr></table><![endif]-->
          </div>
        </div>
      </div>
  
      <div style="mso-line-height-rule: exactly;line-height: 20px;font-size: 20px;">&nbsp;</div>
  
      </div>
      <div role="contentinfo">
        <div class="layout email-footer stack" style="Margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;width: calc(28000% - 167400px);overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;">
          <div class="layout__inner" style="border-collapse: collapse;display: table;width: 100%;">
          <!--[if (mso)|(IE)]><table align="center" cellpadding="0" cellspacing="0" role="presentation"><tr class="layout-email-footer"><td style="width: 400px;" valign="top" class="w360"><![endif]-->
            <div class="column wide" style="text-align: left;font-size: 12px;line-height: 19px;color: #2f3433;font-family: sans-serif;Float: left;max-width: 400px;min-width: 320px; width: 320px;width: calc(8000% - 47600px);">
              <div style="Margin-left: 20px;Margin-right: 20px;Margin-top: 10px;Margin-bottom: 10px;">
                <table class="email-footer__links" style="border-collapse: collapse;table-layout: fixed;" role="presentation" emb-web-links=""><tbody><tr role="navigation">
                
                </tr></tbody></table>
                <div style="font-size: 12px;line-height: 19px;margin-bottom: 15px;Margin-top: 20px;">
                  <div>easyrescuer.com </div>
                </div>
                <div style="font-size: 12px;line-height: 19px;margin-bottom: 15px;Margin-top: 18px;">
                  <div>admin@easyrescuer.com</div>
                </div>
                <!--[if mso]>&nbsp;<![endif]-->
              </div>
            </div>
          <!--[if (mso)|(IE)]></td><td style="width: 200px;" valign="top" class="w160"><![endif]-->
            <div class="column narrow" style="text-align: left;font-size: 12px;line-height: 19px;color: #2f3433;font-family: sans-serif;Float: left;max-width: 320px;min-width: 200px; width: 320px;width: calc(72200px - 12000%);">
              <div style="Margin-left: 20px;Margin-right: 20px;Margin-top: 10px;Margin-bottom: 10px;">
                
              </div>
            </div>
          <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
          </div>
        </div>
        <div class="layout one-col email-footer" style="Margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;width: calc(28000% - 167400px);overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;">
          <div class="layout__inner" style="border-collapse: collapse;display: table;width: 100%;">
          <!--[if (mso)|(IE)]><table align="center" cellpadding="0" cellspacing="0" role="presentation"><tr class="layout-email-footer"><td style="width: 600px;" class="w560"><![endif]-->
            <div class="column" style="text-align: left;font-size: 12px;line-height: 19px;color: #2f3433;font-family: sans-serif;">
              <div style="Margin-left: 20px;Margin-right: 20px;Margin-top: 10px;Margin-bottom: 10px;">
                <div style="font-size: 12px;line-height: 19px;margin-bottom: 15px;">
                  
                </div>
              </div>
            </div>
          <!--[if (mso)|(IE)]></td></tr></table><![endif]-->
          </div>
        </div>
      </div>
      <div style="line-height:40px;font-size:40px;" id="footer-spacing">&nbsp;</div>
    </td></tr></tbody></table>
  

</body></html> """;

    try {
      final sendReport = await send(message, smtpServer);
      myToast("E-posta gönderildi.");
      print('Message sent: ' +
          sendReport.toString()); //print if the email is sent
    } on MailerException catch (e) {
      print('E-posta gönderilemedi. \n' +
          e.toString()); //print if the email is not sent
      // e.toString() will show why the email is not sending
    }
  }

  Widget _sifreRes() {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        new Container(
          height: 50.0,
          width: 145.0,
          child: Icon(
            Icons.lock_rounded,
            color: Colors.white24,
            size: 150.0,
          ),
        ),

        SpaceH96(),
        SpaceH48(),
        Center(
          child: new Container(
            height: 100.0,
            width: 270.0,
            child: Center(child: Text("Şifre sıfırlama linkiniz e-posta adresinize gönderilecektir.",style: Styles.mediumTextStyle ,)),
            ),
        ),


        SpaceW48(),SpaceH48(),
        new Container(
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
          margin: EdgeInsets.only(left: 10.0, right: 10.0),
          child: new TextFormField(
              style: Styles.normalTextStyle,
              controller: _emailTextController,
              validator: _validateEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                //labelText: " ",
                hintText: "E-posta adresinizi giriniz",
                hintStyle: Styles.customNormalTextStyle(
                    fontSize: 13, color: Colors.white),
                labelStyle: Styles.customNormalTextStyle(fontSize: 16),
              )),
        ),
        SpaceH96(),
    Row(children: [SpaceW60(),PotbellyButton(
          "GÖNDER",decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.white30),
          buttonWidth: 100,
          onTap: () async {

            addData2();

          },
        ),
        PotbellyButton(
          "GERİ GEL",buttonWidth: 100,decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.white30),
          margin: EdgeInsets.all(25),onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => LoginScreen()));
        },
        ),
      ]),
    ]);
  }

  String _validateEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (regex.hasMatch(email))
      return null;
    else
      return "Lütfen doğru bir e-posta adresi girin.";
  }
}
