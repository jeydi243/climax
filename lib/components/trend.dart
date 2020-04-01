import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slimy_card/slimy_card.dart';

class Trend extends StatefulWidget {
	Trend({
		Key key
	}): super(key: key);

	@override
	_TrendState createState() => _TrendState();
}

class _TrendState extends State < Trend > {
	@override
	Widget build(BuildContext context) {
		return MultiProvider(
			providers: [
				// StreamProvider.value(
				// 	value: ,
				// )
			],
			child: Container(
				child: Column(
					children: < Widget > [
						Text("Trend"),
						ListView.builder(
							itemCount: 10,
							itemBuilder: (context, index) {
								return SlimyCard(
									color: Colors.red,
									width: 200,
									topCardHeight: 400,
									bottomCardHeight: 200,
									borderRadius: 15,
									topCardWidget: Text("Epa le monde est beau"),
									bottomCardWidget: Text("Donne le moi !"),
									slimeEnabled: true,
								);
							},
						),
					],
				),
			),
		);
	}
}