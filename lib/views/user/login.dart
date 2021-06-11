import 'dart:ui';
import 'package:climax/views/user/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:climax/views/home.dart';
import 'package:flutter/gestures.dart';
import 'package:climax/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:pigment/pigment.dart';
import 'package:climax/animations/fadein.dart';
import 'package:provider/provider.dart';
// import 'package:bot_toast/bot_toast.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.onSignedIn});
  final VoidCallback onSignedIn;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isTrue = true;
  bool _canObscure = false;
  String fin = "#FAD961";
  String _emailOrNom;
  String _password;

  bool _validateandSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void _submit() async {
    Get.to(Home(), transition: Transition.size);
    if (_validateandSave()) {
      setState(() {
        _isTrue = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);
    return Scaffold(
      backgroundColor: Pigment.fromString("#141E51"),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: Stack(children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        FadeIn(
                          1,
                          Column(
                            children: <Widget>[
                              new Text("Bonjour!",
                                  style: GoogleFonts.bubblegumSans(
                                      textStyle: TextStyle(
                                    color: Colors.amber,
                                    letterSpacing: .5,
                                    fontSize: 25.0,
                                  ))),
                              new Text("Ravis de vous revoir",
                                  style: GoogleFonts.bubblegumSans(
                                      textStyle: TextStyle(
                                          color: Colors.amber,
                                          fontSize: 35.0,
                                          letterSpacing: .5))),
                            ],
                          ),
                        ),
                        FadeIn(
                          2,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new TextFormField(
                                style: TextStyle(
                                    color: Colors.white.withOpacity(.5)),
                                onSaved: (value) => _emailOrNom = value,
                                cursorColor: Colors.green,
                                validator: (value) => value.isEmpty
                                    ? "L'email ou le nom doit etre renseigné"
                                    : null,
                                decoration: new InputDecoration(
                                  focusColor: Colors.amber.withOpacity(.5),
                                  isDense: true,
                                  fillColor: Colors.white.withOpacity(.2),
                                  filled: true,
                                  prefixIcon:
                                      Icon(Icons.email, color: Colors.amber),
                                  hintText: "Email ou Nom",
                                  labelText: "Email",
                                  labelStyle: GoogleFonts.bubblegumSans(
                                      textStyle: TextStyle(
                                          color: Colors.amber,
                                          decorationStyle:
                                              TextDecorationStyle.dashed)),
                                ),
                              ),
                              new TextFormField(
                                style: TextStyle(
                                    color: Colors.white.withOpacity(.5)),
                                onSaved: (value) => _password = value,
                                cursorColor: Colors.green,
                                validator: (value) => value.isEmpty
                                    ? "Le mot de passe doit etre renseigné"
                                    : null,
                                decoration: new InputDecoration(
                                    fillColor: Colors.white.withOpacity(.2),
                                    filled: true,
                                    isDense: true,
                                    prefixIcon:
                                        Icon(Icons.lock, color: Colors.amber),
                                    suffixIcon: FlatButton(
                                      child: _canObscure == true
                                          ? Text("SHOW",
                                              style: TextStyle(
                                                  color: Colors.amber[200]))
                                          : Text("HIDE",
                                              style: TextStyle(
                                                  color: Colors.amber[200])),
                                      onPressed: () {
                                        setState(() {
                                          _canObscure =
                                              _canObscure ? false : true;
                                        });
                                      },
                                    ),
                                    labelText: "Mot de passe",
                                    labelStyle: GoogleFonts.bubblegumSans(
                                        textStyle: TextStyle(
                                      color: Colors.amber,
                                    ))),
                                obscureText: _canObscure,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  new FlatButton(
                                    textColor: Colors.amber,
                                    child: Text(
                                      "Réinitialisé ?",
                                      style: TextStyle(color: Colors.amber),
                                    ),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        FadeIn(
                          3,
                          Column(
                            children: <Widget>[
                              FittedBox(
                                  fit: BoxFit.fill,
                                  child: _isTrue
                                      ? new RaisedButton(
                                          elevation: 12.0,
                                          textColor:
                                              Pigment.fromString("#124A2C"),
                                          child: new Text("Connexion",
                                              style: TextStyle(fontSize: 17.0)),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(18.0),
                                          ),
                                          color: Colors.amber,
                                          onPressed: _submit)
                                      : Loading(
                                          indicator: BallPulseIndicator(),
                                          size: 60.0,
                                          color: Colors.amber)),
                              Row(children: <Widget>[
                                Expanded(
                                    child: Divider(
                                  color: Colors.amber.withOpacity(0.3),
                                  endIndent: 10,
                                )),
                                Text(
                                  "OR",
                                  style: TextStyle(color: Colors.amber),
                                ),
                                Expanded(
                                    child: Divider(
                                        color: Colors.amber.withOpacity(0.3),
                                        indent: 10)),
                              ])
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            RaisedButton(
                              onPressed: () {
                                Future.wait([auth.signInWithGoogle()])
                                    .then((value) {
                                  Get.to(Home());
                                });
                              },
                              padding: EdgeInsets.all(5),
                              child: Text("Google"),
                            ),
                            RaisedButton(
                              onPressed: () async {
                                try {
                                  bool result = await auth.signInWithFacebook();
                                  if (result == true) {
                                    print("La connexion a marché");
                                  }
                                } catch (e) {}
                              },
                              padding: EdgeInsets.all(5),
                              child: Text("Facebook"),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Vous etes nouveau ?",
                              style: TextStyle(color: Colors.white),
                            ),
                            FlatButton(
                              splashColor: Colors.amber,
                              textColor: Colors.amber,
                              child: Text(
                                "Inscription",
                                style: TextStyle(color: Colors.amber),
                              ),
                              onPressed: () {
                                Get.to(Register());
                              },
                            )
                          ],
                        ),
                      ])),
            ),
          ]),
        ),
      ),
    );
  }
}
