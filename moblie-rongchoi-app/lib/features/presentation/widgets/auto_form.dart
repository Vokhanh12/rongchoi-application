import 'package:flutter/material.dart';

class AutoForm extends StatefulWidget {
  
  const AutoForm({super.key,
  required this.child,
  });

  final Widget child;


  @override
  State<AutoForm> createState() => _AutoFormState();
}

class _AutoFormState extends State<AutoForm> {

  @override
  void dispose() {
   
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: widget.child,    
      // child: CustomeColumnData(
      //   controllers: [
      //     {"Name": TextEditingController()},
      //     {"Email": TextEditingController()},
      //     {"Phone": TextEditingController()},
      //   ],
      // )
    );
  }



}