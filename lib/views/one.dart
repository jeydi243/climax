import 'package:climax/fadein.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class One extends StatefulWidget {
	One({
		Key key
	}): super(key: key);

	@override
	_OneState createState() => _OneState();
}

class _OneState extends State < One > {
	@override
	Widget build(BuildContext context) {
		Map result = Provider.of<Map<String,dynamic>>(context);

		return Container(
			height: 300,
			width: double.infinity,
			child: ListView.builder(
				itemCount: result.length,
				itemBuilder: (_, int index) {
					
					String key = result.keys.elementAt(index);
					return new Row(
						children: < Widget > [
							new Text('$key : '),
							new Text("${result[key]}")
						],
					);
				},
			),
		);
	}
}