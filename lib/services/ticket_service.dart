import 'package:cloud_firestore/cloud_firestore.dart';
FirebaseFirestore firestore = FirebaseFirestore.instance;

class TicketService{
	Stream<QuerySnapshot> getAllTicket(){
		return firestore.collection("tickets").snapshots();
	}
}