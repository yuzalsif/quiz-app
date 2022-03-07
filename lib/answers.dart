import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final void Function() selectHandler;
  final String answerParameter;

  Answer(this.selectHandler, this.answerParameter) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(answerParameter),
        onPressed: selectHandler,
      ),
    );
  }
}
