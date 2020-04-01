import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:flutter/material.dart';


class Barcode extends StatefulWidget {
	Barcode({
		Key key
	}): super(key: key);

	@override
	_BarcodeState createState() => _BarcodeState();

}

class _BarcodeState extends State < Barcode > {
	@override
	Widget build(BuildContext context) {
		return Container(
			height: 80,
			width: 200,
			child: BarCodeImage(
				params: Code39BarCodeParams(
					"1234ABCD",
					lineWidth: 1.5, // width for a single black/white bar (default: 2.0)
					//barHeight: 35.0, // height for the entire widget (default: 100.0)
				),
				onError: (error) { // Error handler
					print('error = $error');
				},
			),
		);
	}
}