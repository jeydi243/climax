import 'package:flutter/material.dart';

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
		return Container(
			height: 400,
			child: Column(
				children: <Widget> [
					Text("Trend"),
					ListView.builder(
						scrollDirection: Axis.horizontal,
						itemCount: 10,
						itemBuilder: (_, index) {
							return ListTile(
								leading: Text("data"),
							);
						},
					),
				],
			),
		);
	}
}