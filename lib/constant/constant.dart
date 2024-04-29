import 'package:chat_fire/model/message.dart';
import 'package:flutter/material.dart';

class custom_text_form_field extends StatelessWidget {
  Function(String)? onchaged;
  final bool op;
  final String text;
  custom_text_form_field(
      {this.onchaged, super.key, required this.text, required this.op});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "field is required";
          }
        },
        onChanged: onchaged,
        obscureText: op,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 16),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          hintText: "$text",
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(8)),
        ));
  }
}

final Color kprimarycolor = Color(0xff27425F);

void show_snackbar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("$text"),
    ),
  );
}

class custom_button extends StatelessWidget {
  VoidCallback? ontap;
  final String text;
  custom_button({
    this.ontap,
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
              color: kprimarycolor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
      ),
    );
  }
}

class chat_bubble extends StatelessWidget {
  final Messagemodel messagemodel;
  const chat_bubble({
    super.key,
    required this.messagemodel,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: kprimarycolor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(32),
            topLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        child: Text(
          messagemodel.text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class chat_reciecd_bubble extends StatelessWidget {
  final Messagemodel messagemodel;
  const chat_reciecd_bubble({
    super.key,
    required this.messagemodel,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(32),
            topLeft: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
        ),
        child: Text(
          messagemodel.text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
