import 'package:bookly_app/views/home/data/models/book_models.dart';
import 'package:bookly_app/views/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/books_action.dart';
import '../widgets/custom_book_details_appbar.dart';
import '../widgets/details_list_view.dart';

class BoolDetails extends StatefulWidget {
  const BoolDetails({Key? key, required this.model}) : super(key: key);
   final BookModel model;
  @override
  State<BoolDetails> createState() => _BoolDetailsState();
}

class _BoolDetailsState extends State<BoolDetails> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
        cate:widget.model.volumeInfo.categories![0]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 10),
           child: Column(
             children:  [
               const CustomBookDetailsAppbar(),
             const SizedBox(
               height: 20,
             ),
             Container(
               width: MediaQuery.of(context).size.width*0.4,
               height: MediaQuery.of(context).size.height*0.28,
               clipBehavior: Clip.antiAliasWithSaveLayer,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(15),
               ),
               child: CachedNetworkImage(
                 imageUrl: widget.model.volumeInfo.imageLinks?.thumbnail??'',
                 errorWidget:(context,url,_)=>const Icon(Icons.error) ,
                 fit: BoxFit.fill,
                 placeholder:(context,url)=>const Center(child: CircularProgressIndicator()) ,
               ),
             ),
               const SizedBox(
                 height: 10,
               ),
                Text(widget.model.volumeInfo.title!,
               maxLines: 1,
               textAlign: TextAlign.center,
               style:const TextStyle(
                 fontSize: 25,
                 fontWeight: FontWeight.bold,
                 overflow: TextOverflow.ellipsis,
               ) ,
               ),
               const SizedBox(
                 height: 10,
               ),
                Text(widget.model.volumeInfo.authors!.first,
                 style:const TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.normal,
                    fontStyle:FontStyle.italic ,
                   color: Colors.grey,
                 ) ,
               ),
               const SizedBox(
                 height: 10,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   const Icon(Icons.star_rounded,
                     color: Colors.yellow,
                     size: 20,
                   ),
                   const SizedBox(
                     width: 5,
                   ),
                    Text('${widget.model.volumeInfo.averageRating ??0}',
                     style:const TextStyle(
                       fontSize: 16,
                     ) ,
                   ),
                   const SizedBox(
                     width: 5,
                   ),
                   Text('(${widget.model.volumeInfo.ratingsCount??0})',
                     style:TextStyle(
                       fontSize: 12,
                       color: Colors.grey[600],
                     ) ,
                   ),
                 ],
               ),
               const SizedBox(
                 height: 20,
               ),
                BooksAction(model:widget.model),
               const SizedBox(
                 height: 10,
               ),
               const Align(
                 alignment: Alignment.topLeft,
                 child: Text('You can also like',
                   style:TextStyle(
                     fontSize: 16,
                   ) ,
                 ),
               ),
               const SizedBox(
                 height: 15,
               ),
               const DetailsListView(),
             ],
           ),
         ),
       ),
    );
  }
}



