import 'package:flutter/material.dart';
import 'package:climax/components/barcode.dart';
import 'package:flutter_ticket_widget/flutter_ticket_widget.dart';


class Ticket extends StatefulWidget {
	@override
	_TicketState createState() => _TicketState();
}

class _TicketState extends State < Ticket > {
	@override
	Widget build(BuildContext context) {
		return Center(
			child: Container(
				child: FlutterTicketWidget(
					width: 300.0,
					height: 400.0,
					isCornerRounded: true,
					child: Padding(
						padding: const EdgeInsets.all(5.0),
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.center,
								children: < Widget > [
									Row(
										mainAxisAlignment: MainAxisAlignment.spaceBetween,
										children: < Widget > [
											Container(
												width: 100.0,
												height: 25.0,
												decoration: BoxDecoration(
													borderRadius: BorderRadius.circular(30.0),
													border: Border.all(width: 1.0, color: Colors.green),
												),
												child: Center(
													child: Text(
														'Business Class',
														style: TextStyle(color: Colors.green),
													),
												),
											)
										],
									),
									Padding(
										padding: const EdgeInsets.only(top: 20.0),
											child: Text(
												'Flight Ticket',
												style: TextStyle(
													color: Colors.black,
													fontSize: 20.0,
													fontWeight: FontWeight.bold),
											),
									),
									Padding(
										padding: const EdgeInsets.only(top: 5.0),
											child: Column(
												children: < Widget > [
													ticketDetailsWidget(
														'Passengers', 'Ilona', 'Date', '24-12-2018'),
													Padding(
														padding: const EdgeInsets.only(top: 12.0, right: 40.0),
															child: ticketDetailsWidget(
																'Flight', '76836A45', 'Gate', '66B'),
													),
													Padding(
														padding: const EdgeInsets.only(top: 12.0, right: 40.0),
															child: ticketDetailsWidget(
																'Class', 'Business', 'Seat', '21B'),
													),
												],
											),
									),
									Spacer(),
									Padding(
										padding: const EdgeInsets.only(bottom: 15.0),
											child: Barcode()
									),

								],
							),
					),
				),
			),
		);
	}

	Widget ticketDetailsWidget(String firstTitle, String firstDesc, String secondTitle, String secondDesc) {
		return Row(
			mainAxisAlignment: MainAxisAlignment.spaceBetween,
			children: < Widget > [
				Padding(
					padding: const EdgeInsets.only(left: 12.0),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: < Widget > [
								Text(
									firstTitle,
									style: TextStyle(
										color: Colors.grey,
									),
								),
								Padding(
									padding: const EdgeInsets.only(top: 4.0),
										child: Text(
											firstDesc,
											style: TextStyle(
												color: Colors.black,
											),
										),
								)
							],
						),
				),
				Padding(
					padding: const EdgeInsets.only(right: 20.0),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: < Widget > [
								Text(
									secondTitle,
									style: TextStyle(
										color: Colors.grey,
									),
								),
								Padding(
									padding: const EdgeInsets.only(top: 4.0),
										child: Text(
											secondDesc,
											style: TextStyle(
												color: Colors.black,
											),
										),
								)
							],
						),
				)
			],
		);
	}
}