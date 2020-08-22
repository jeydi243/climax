import 'package:climax/components/tickettree.dart';
import 'package:flutter/material.dart';

class PageQuatre extends StatelessWidget {
  const PageQuatre({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
	return Container(
        height: double.infinity, width: double.infinity, child: TicketTree());
  }
}