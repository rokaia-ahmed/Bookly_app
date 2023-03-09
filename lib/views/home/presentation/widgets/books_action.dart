
import 'package:bookly_app/views/home/data/models/book_models.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({Key? key, required this.model}) : super(key: key);
  final BookModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
         Expanded(
           child: SizedBox(
             height: 45,
             child: TextButton(
                 onPressed: (){},
                 style:TextButton.styleFrom(
                   backgroundColor: Colors.white,
                   shape: const RoundedRectangleBorder(
                     borderRadius: BorderRadius.only(
                       topLeft: Radius.circular(10),
                       bottomLeft: Radius.circular(10),
                     ),
                   ),
                 ),
                 child: const Text('19.99€',
                 style:TextStyle(
                   color:Colors.black ,
                   fontWeight: FontWeight.bold,
                   fontSize: 20,
                 ) ,
                 ),
             ),
           ),
         ),
         Expanded(
            child: SizedBox(
              height: 45,
              child: TextButton(
                onPressed: () async {
                  Uri uri= Uri.parse(model.volumeInfo.previewLink!) ;
                   if (await canLaunchUrl(uri)) {
                       await launchUrl(uri);
                   }
                },
                style:TextButton.styleFrom(
                  backgroundColor: const Color(0xffEF8262),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
                child: const Text('Free preview',
                  style:TextStyle(
                    color:Colors.white ,
                    fontSize: 18,
                  ) ,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}