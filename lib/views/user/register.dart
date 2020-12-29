import 'package:climax/views/user/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:climax/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:climax/views/home.dart';
import 'package:loading/loading.dart';
import 'package:pigment/pigment.dart';

class Signup extends StatefulWidget {
	Signup({
		this.auth,
		this.move
	});
	Auth auth;
	final VoidCallback move;

	@override
	_SignupState createState() => _SignupState();
}

class _SignupState extends State < Signup > {
	final _formKey = GlobalKey < FormState > ();
	bool _canObscure = true;
	String _email;
	String _nom;
	String _password;
	bool verif = true;

	Color _hexToColor(String code) {
		return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
	}
	bool _validateandSave() {
		final form = _formKey.currentState;
		if (form.validate()) {
			form.save();
			print("le formulaire est pret");
			print('$_email et $_password');
			return true;
		} else {
			print("Erreur dans le formulaire: Veuillez remplir tous les champs");
			return false;
		}
	}
	void _submit() async {
		setState(() {
		  verif= false;
		});
		try {
			if (_validateandSave()) {
				widget.auth = new Auth();
				await widget.auth.register(_email, _password, _nom).then((User user){
					print("L'utilisateur s'est bien enregistré $user");
					_formKey.currentState.reset();
					setState(() {
					  verif = true;
					});
					Get.to(Home());
				});
			}else{
				setState(() {
				  verif = true;
				});
			}
		} catch (e) {
			print(e);
		}
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			
			backgroundColor: Pigment.fromString("#141E51"),
			body: Center(
				child: AnimatedContainer(
					duration: Duration(seconds: 1),
					curve: Curves.fastOutSlowIn,
					alignment: Alignment.center,
					decoration: BoxDecoration(
						color: Pigment.fromString("#141E51"),
						borderRadius: BorderRadius.only(topRight: Radius.circular(10.0))
						// gradient: LinearGradient(
						// 	begin: Alignment.topCenter,
						// 	end: Alignment.bottomCenter,
						// 	colors: [Colors.white,Colors.white ,_hexToColor(fin)]),
					),
					padding: EdgeInsets.all(20.0),
					child: Center(
						child: Form(
							key:_formKey,
							child: Column(
						  	mainAxisAlignment: MainAxisAlignment.center,
						  	children: [
						  		Image.asset("images/conversation.png", fit: BoxFit.fill),
						  		Text("Rejoignez-nous!", softWrap: true,
						  			style: GoogleFonts.bubblegumSans(
						  				textStyle: TextStyle(
						  					color: Colors.yellow[800],
						  					fontSize: 35.0,
						  					letterSpacing: .5
						  				)
						  			),
						  		),
						  		new TextFormField(
						  			onSaved: (value) => _nom = value,
						  			validator: (value) => value.isEmpty ? "Le nom doit etre renseigné" : null,
						  			decoration: new InputDecoration(
						  				isDense: true,
						  				prefixIcon: Icon(Icons.account_circle, color: Colors.amber, ),
						  				labelText: "Nom",
						  				labelStyle: GoogleFonts.bubblegumSans(textStyle: TextStyle(
						  					color: Colors.amber,
						  				))
						  			),
						  		),
						  		new TextFormField(
						  			onSaved: (value) => _email = value,
						  			validator: (value) => value.isEmpty ? "L'email doit etre renseigné" : null,
						  			decoration: new InputDecoration(
						  				hoverColor: Colors.amber,
						  				isDense: true,
						  				prefixIcon: Icon(Icons.email, color: Colors.amber, ),
						  				labelText: "Email",
						  				labelStyle: GoogleFonts.bubblegumSans(textStyle: TextStyle(
						  					color: Colors.amber,
						  				))
						  			),
						  		),
						  		new TextFormField(
						  			onSaved: (value) => _password = value,
						  			validator: (value) => value.isEmpty ? "Le mot de passe doit etre renseigné" : null,
						  			decoration: new InputDecoration(
						  				filled: true,
						  				isDense: true,
						  				prefixIcon: Icon(Icons.lock, color: Colors.amber),
						  				suffixIcon: FlatButton(
						  					child: _canObscure == true ? Text("SHOW",style: TextStyle(
												  color: Colors.amber
											  )) : Text("HIDE",style: TextStyle(color: Colors.amber),),
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
						  		Row(
						  			children: < Widget > [
						  				Spacer(),
						  				FlatButton(
						  					padding: EdgeInsets.zero,
						  					child: Text("Reinitialisé ?",
						  						style: TextStyle(
						  							color: Colors.teal,
						  							fontWeight: FontWeight.w500
						  						), ),
						  					onPressed: widget.move,
						  				)
						  			],
						  		),
						  		ConstrainedBox(
						  			constraints: BoxConstraints(
						  				minWidth: MediaQuery.of(context).size.width
						  			),
						  			child: new RaisedButton(
						  				color: Colors.yellow[800],
						  				elevation: 12.0,
						  				shape: RoundedRectangleBorder(
						  					borderRadius: new BorderRadius.circular(18.0),
						  				),
						  				textColor: _hexToColor("#124A2C"),
						  				child: verif? Text("M'enregistrer"): Loading(),
						  				onPressed: _submit,
						  			),
						  		),


						  		Row(
						  			children: < Widget > [
						  				Spacer(),
						  				Text("Déja enregistré?",style: TextStyle(
											  color: Colors.amber
										  ),),
						  				FlatButton(
						  					padding: EdgeInsets.zero,
						  					child: Text("Connexion",
						  						style: TextStyle(
						  							color: Colors.teal,
						  							fontWeight: FontWeight.bold
						  						), ),
						  					onPressed: (){
												  Get.to(LoginPage());
											  },
						  				),

						  			],
						  		)
						  	]
						  ),
						),
					),
				),
			),
		);
	}
}