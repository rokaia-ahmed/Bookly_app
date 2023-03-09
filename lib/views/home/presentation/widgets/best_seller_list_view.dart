import 'package:bookly_app/core/utiles/app_router.dart';
import 'package:bookly_app/core/widget/custom_error_message.dart';
import 'package:bookly_app/views/home/data/models/book_models.dart';
import 'package:bookly_app/views/home/presentation/manager/Newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/views/home/presentation/manager/Newest_books_cubit/newest_books_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
    builder: (context, state) {
      if(state is NewestBooksSuccess){
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => buildItem(context,state.books[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemCount: state.books.length,
        );
      }else if(state is NewestBooksError){
        return CustomErrorWidget(errorMessage: state.error);
      }else{
        return const Center(child: CircularProgressIndicator());
      }

  },
);
  }

  Widget buildItem(context,BookModel model) {
    return GestureDetector(
      onTap:(){
        GoRouter.of(context).push(
            AppRouter.kBookDetails,
        extra: model,
        );
      } ,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: MediaQuery.of(context).size.height * 0.16,
            height: MediaQuery.of(context).size.height * 0.22,
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
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.5,
                  child:  Text(model.volumeInfo.title!,
                       maxLines: 2,
                     style:const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                       overflow: TextOverflow.ellipsis,
                    ) ,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                 Text(model.volumeInfo.authors!.first,
                  style:const TextStyle(
                    //fontSize: 16,
                    color:Colors.grey ,
                  ) ,
                ),
                 const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                     const Text('free',
                      style:TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,

                      ) ,
                    ),
                    const Spacer(),
                    const Icon(Icons.star_rounded,
                      color: Colors.yellow,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                     Text('${model.volumeInfo.averageRating??'0'}' ,
                      style:const TextStyle(
                        fontSize: 16,
                      ) ,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text('(${model.volumeInfo.ratingsCount??'0'})',
                      style:TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ) ,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
