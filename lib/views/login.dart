import 'dart:ui'
as prefix0;
import 'dart:ui';

import 'package:climax/views/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:climax/services/auth.dart';
import 'package:flutter/material.dart' as prefix1;
import 'package:google_fonts/google_fonts.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';

import '../fadein.dart';


class LoginPage extends StatefulWidget {
	LoginPage({
		this.auth,
		this.move,
		this.onSignedIn
	});
	final BaseAuth auth;
	final VoidCallback onSignedIn;
	final VoidCallback move;
	@override
	_LoginState createState() => _LoginState();
}

class _LoginState extends State < LoginPage > {
	final _formKey = GlobalKey < FormState > ();
	bool _isTrue = true;
	bool _canObscure = false;
	String fin = "#FAD961";
	String _emailOrNom;
	String _password;

	bool _validateandSave() {
		final form = _formKey.currentState;
		if (form.validate()) {
			form.save();
			print("le formulaire est pret");
			print('$_emailOrNom et $_password');
			return true;
		} else {
			print("Erreur dans le formulaire");
			return false;
		}
	}
	void _submit() async {
		if (_validateandSave()) {
			setState(() {
				_isTrue = false;

			});
			try {
				String uid = await widget.auth.signIn(_emailOrNom, _password);
				print("L'utilisateur s'est bien connecté $uid");
				_formKey.currentState.reset();
				setState(() {
					_isTrue = true;

				});
				Navigator.of(context).push(_createRoute());
			} catch (e) {
				print(e);
			}
		}
	}
	Route _createRoute() {
		return PageRouteBuilder(
			pageBuilder: (context, animation, secondaryAnimation) => Home(),
			transitionsBuilder: (context, animation, secondaryAnimation, child) {
				var begin = Offset(0.0, 1.0);
				var end = Offset.zero;
				var tween = Tween(begin: begin, end: end);
				var offsetAnimation = animation.drive(tween);

				return SlideTransition(
					position: offsetAnimation,
					child: child,
				);
			},
		);
	}
	Color _hexToColor(String code) {
		return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
	}

	@override
	Widget build(BuildContext context) {
		return Container(
			padding: EdgeInsets.all(20.0),
			child: Form(
				key: _formKey,
				child: Column(
					mainAxisAlignment: MainAxisAlignment.spaceBetween,
					children: < Widget > [
						FadeIn(1,
							Column(
								children: < Widget > [
									new Text("Bonjour!",
										style: GoogleFonts.bubblegumSans(
											textStyle: TextStyle(
												color: Colors.amber,
												letterSpacing: .5,
												fontSize: 25.0,
											)
										)),
									new Text("Ravis de vous revoir",
										style: GoogleFonts.bubblegumSans(
											textStyle: TextStyle(
												color: Colors.amber,
												fontSize: 35.0,
												letterSpacing: .5
											)
										)
									),
								],
							),
						),
						FadeIn(2,
							Column(
								mainAxisAlignment: MainAxisAlignment.spaceBetween,
								crossAxisAlignment: CrossAxisAlignment.center,
								children: < Widget > [
									new TextFormField(
										style: prefix1.TextStyle(
											color: Colors.white.withOpacity(.5)
										),
										onSaved: (value) => _emailOrNom = value,
										validator: (value) => value.isEmpty ? "L'email ou le nom doit etre renseigné" : null,
										decoration: new InputDecoration(
											focusColor: Colors.amber.withOpacity(.5),
											isDense: true,
											prefixIcon: Icon(Icons.email, color: Colors.amber),
											hintText: "Email ou Nom",
											hasFloatingPlaceholder: true,
											labelText: "Email",
											labelStyle: GoogleFonts.bubblegumSans(textStyle: TextStyle(
												color: Colors.amber,
												decorationStyle: TextDecorationStyle.dashed
											)),
										),
									),
									new TextFormField(
										onSaved: (value) => _password = value,
										cursorColor: Colors.green,
										validator: (value) => value.isEmpty ? "Le mot de passe doit etre renseigné" : null,
										decoration: new InputDecoration(
											isDense: true,
											prefixIcon: Icon(Icons.lock, color: Colors.amber),
											suffixIcon: FlatButton(
												child: _canObscure == true ? Text("SHOW", style: TextStyle(color: Colors.amber[200])) : Text("HIDE", style: TextStyle(color: Colors.amber[200])),
												onPressed: () {
													setState(() {
														_canObscure = _canObscure ? false : true;
													});
												},
											),
											labelText: "Mot de passe",
											labelStyle: GoogleFonts.bubblegumSans(textStyle: TextStyle(
												color: Colors.amber,
											))
										),
										obscureText: _canObscure,
									),
								],
							),
						),
						FadeIn(3,
							Column(
								children: < Widget > [
									FittedBox(
										fit: BoxFit.contain,
										child: _isTrue ? new RaisedButton(

											elevation: 12.0,
											textColor: _hexToColor("#124A2C"),
											child: new Text("Connexion", style: TextStyle(fontSize: 17.0)),
											shape: RoundedRectangleBorder(
												borderRadius: new BorderRadius.circular(18.0),
											),
											color: Colors.amber,
											onPressed: _submit
										) : Loading(indicator: BallPulseIndicator(), size: 60.0, color: Colors.amber)
									),
									Row(
										mainAxisAlignment: MainAxisAlignment.spaceEvenly,
										children: < Widget > [
											Text("Vous etes nouveau ?",
												style: TextStyle(color: Colors.white), ),
											new FlatButton(
												textColor: Colors.amber,
												child: Text("M'inscrire", style: TextStyle(color: Colors.amber), ),
												onPressed: widget.move,
											)
										],
									),
								],
							),
						),
					]
				)
			),

		);
	}
}