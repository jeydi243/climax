import 'package:climax/views/one.dart';
import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
	Tabs({
		Key key,
		this.index
	}): super(key: key);
	int index;
	@override
	_TabsState createState() => _TabsState();
}

class _TabsState extends State < Tabs > {
	@override
	Widget build(BuildContext context) {
		switch (widget.index) {
			case 1:
				return One();
			case 2:
				return Two();
			case 3:
				return Three();
			default:

		}
	}
}