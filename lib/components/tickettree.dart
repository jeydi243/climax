import 'package:flutter/material.dart';
import 'package:ticket_card/ticket_card.dart';

class TicketTree extends StatefulWidget {
	TicketTree({
		Key key
	}): super(key: key);

	@override
	_tickettreeState createState() => _tickettreeState();
}

class _tickettreeState extends State < TicketTree > {
	@override
	Widget build(BuildContext context) {
		return Center(
			child: Container(
				child: TicketCard(
					decoration: TicketDecoration(
						shadow: [TicketShadow(color: Colors.black, elevation: 6)],
						border: TicketBorder(
							color: Colors.green,
							width: 0.1,
							style: TicketBorderStyle.dotted
						)
					),
					lineFromTop: 100,
					child: Container(
						height: 200,
						width: 200,
						color: Colors.white,
						child: Text(
							"sdfsf",
							style: TextStyle(color: Colors.black),
						),
					),
				),
			),
		);
	}
}