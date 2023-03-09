
import 'package:bookly_app/core/widget/custom_error_message.dart';
import 'package:bookly_app/views/home/data/models/book_models.dart';
import 'package:bookly_app/views/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsListView extends StatelessWidget {
  const DetailsListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
    builder: (context, state) {
      if(state is SimilarBooksSuccess){
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.179,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildItem(context,state.book[index]),
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemCount: state.book.length,
          ),
        );
      }else if( state is SimilarBooksError){
        return CustomErrorWidget(errorMessage: state.errorMessage);
      }else{
        return const Center(child: CircularProgressIndicator());
      }

  },
);
  }
}
Widget buildItem(context,BookModel model){
  return GestureDetector(
    child: Container(
      width: MediaQuery.of(context).size.width * 0.22,
      height: MediaQuery.of(context).size.height * 0.179,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: CachedNetworkImage(
        imageUrl: model.volumeInfo.imageLinks?.thumbnail??'',
        errorWidget:(context,url,_)=>const Icon(Icons.error) ,
        fit: BoxFit.fill,
        placeholder:(context,url)=>const Center(child: CircularProgressIndicator()) ,
      ),
    ),
  );

}