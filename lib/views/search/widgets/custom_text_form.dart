import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
     decoration: InputDecoration(
       hintText: 'Search',
       border: InputBorder.none,
       enabledBorder:OutlineInputBorder(
         borderRadius: BorderRadius.circular(10),
         borderSide: const BorderSide(
           color: Colors.white,
         ),
       ) ,
       focusedBorder:OutlineInputBorder(
         borderRadius: BorderRadius.circular(10),
         borderSide: const BorderSide(
           color: Colors.white,
         ),
       )  ,
       suffixIcon:IconButton(
         onPressed: (){},
         icon:const Icon(
           FontAwesomeIcons.magnifyingGlass,
           size:20 ,
         ) ,
       ),
     ),
    );
  }
}