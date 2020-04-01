import 'package:climax/components/barcode.dart';
import 'package:flutter/material.dart';
import 'package:ticket_card/ticket_card.dart';
import 'package:pigment/pigment.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketTree extends StatefulWidget {
	TicketTree({
		Key key,
		this.titre,
		this.madate
	}): super(key: key);
	final String titre;
	final String madate;
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
						shadow: [
							// TicketShadow(color: Colors.amber, elevation: 9,)
						],
						border: TicketBorder(
							width: 0.1,
							style: TicketBorderStyle.solid
						)
					),
					lineFromTop: 285,
					lineColor: Pigment.fromString("#141E51"),
					child: Container(
						height: 400,
						width: 230,
						decoration: BoxDecoration(
							borderRadius: BorderRadius.all(Radius.circular(20)),
							color: Colors.white,
						),
						child: Padding(
							padding: EdgeInsets.all(20.0),
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								mainAxisAlignment: MainAxisAlignment.spaceBetween,
								children: < Widget > [
									Row(
										mainAxisAlignment: MainAxisAlignment.spaceBetween,
										children: < Widget > [
											Text("Movie: ${widget.titre}",
												style: GoogleFonts.asap(
													fontWeight: FontWeight.w700,
												),
											),
										],
									),
									Row(
										crossAxisAlignment: CrossAxisAlignment.start,
										mainAxisAlignment: MainAxisAlignment.spaceBetween,
										children: < Widget > [
											Column(
												crossAxisAlignment: CrossAxisAlignment.start,
												children: < Widget > [
													Text("Date"),
													Text("${widget.madate}",
														style: GoogleFonts.asap(
															fontWeight: FontWeight.w700
														)
													)
												],
											)
										],
									),
									Row(
										mainAxisAlignment: MainAxisAlignment.spaceBetween,
										crossAxisAlignment: CrossAxisAlignment.start,
										children: < Widget > [
											Column(
												crossAxisAlignment: CrossAxisAlignment.start,
												children: < Widget > [
													Text("Prix "),
													Text("12500 fc", style: GoogleFonts.asap(
														fontWeight: FontWeight.w700
													))
												],
											)
										],
									),
									Row(
										mainAxisAlignment: MainAxisAlignment.spaceBetween,
										crossAxisAlignment: CrossAxisAlignment.start,
										children: < Widget > [
											Column(
												children: < Widget > [
													Text("Siege"),
													Text("A1,A2", style: GoogleFonts.asap(
														fontWeight: FontWeight.w700
													))
												],
											)
										],
									),
									Barcode()
								],
							),
						),
					),

				),
			),
		);
	}
}