import 'package:climax/components/tickettree.dart';
import 'package:climax/services/auth_service.dart';
import 'package:climax/services/ticket_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
class PageQuatre extends StatefulWidget {
  PageQuatre({Key key}) : super(key: key);
  User user;
  @override
  _PageQuatreState createState() => _PageQuatreState();
}

class _PageQuatreState extends State<PageQuatre> {
  @override
  Widget build(BuildContext context) {
	  Auth mauth = Provider.of<Auth>(context);
	return Scaffold(
		backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
			Container(width: double.infinity,
			height: MediaQuery.of(context).size.height/2 - 80,
			child: Center(
				child: CircleAvatar(
					backgroundImage: NetworkImage(mauth.getUser.photoURL)
				),
			),
			),
          _tabSection(context),
        ],
      ),
    ));
  }
  }
  Widget _tabSection(BuildContext context) {
	  TicketService ticketservice = Provider.of<TicketService>(context);
  return DefaultTabController(
    length: 2,
	
    child: Column(
      mainAxisSize: MainAxisSize.min,
	  
      children: <Widget>[
        Container(
          child: TabBar(
			  
			  tabs: [
            Tab(text: "Ticket en cours"),
            Tab(text: "Ticket passé"),
          ]),
        ),
        Container( 
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
			  children: [
            StreamBuilder(
				stream: ticketservice.getAllTicket(),
				builder: (context,  AsyncSnapshot<QuerySnapshot> snapshot) {
					if (snapshot.hasError) {
						return Text('Something went wrong');
						}

						if (snapshot.connectionState == ConnectionState.waiting) {
							return Loading(color: Colors.amber);
						}

						return new ListView(
							children: snapshot.data.docs.map((DocumentSnapshot document) {
								return new ListTile(
								title: new Text(document.data()['for']),
								subtitle: new Text(document.data()['proprio']),
								trailing: Text('Seats: ${document.data()['seat'].length}'),
								);
							}).toList(),
						);
				},
			),
            ListView(
				physics: BouncingScrollPhysics(),
				children: [
					Center(child: Container(child: Loading(color: Colors.amber)))
				],
			),
          ]),
        ),
      ],
    ),
  );
}