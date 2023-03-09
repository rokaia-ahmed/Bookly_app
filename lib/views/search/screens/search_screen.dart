import 'package:flutter/material.dart';
import '../widgets/custom_text_form.dart';
import '../widgets/search_result.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CustomTextForm(),
              SizedBox(
                height: 10,
              ),
              Text('Search Result',
              style:TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ) ,
              ),
              SizedBox(
                height: 20,
              ),
              SearchResult(),
            ],
          ),
        ),
      ) ,
    );
  }
}

