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
			child: BarCodeImage(
				params: Code39BarCodeParams(
					"1234ABCD",
					lineWidth: 2.0, // width for a single black/white bar (default: 2.0)
					barHeight: 90.0, // height for the entire widget (default: 100.0)
					withText: true, // Render with text label or not (default: false)
				),
				onError: (error) { // Error handler
					print('error = $error');
				},
			),
		);
	}
}