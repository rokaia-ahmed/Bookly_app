import 'package:bookly_app/core/widget/custom_error_message.dart';
import 'package:bookly_app/views/home/data/models/book_models.dart';
import 'package:bookly_app/views/home/presentation/manager/feature_books_cubit/feature_book_cubit.dart';
import 'package:bookly_app/views/home/presentation/manager/feature_books_cubit/feature_book_states.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utiles/app_router.dart';

class CustomHorizontalListView extends StatelessWidget {
  const CustomHorizontalListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<FeatureBookCubit,FeatureBookStates>(
     builder: (context, state) {
       if(state is FeatureBookSuccess){
         return SizedBox(
           height: MediaQuery.of(context).size.height*0.25,
           child: ListView.separated(
               physics: const BouncingScrollPhysics(),
               shrinkWrap: true,
               scrollDirection: Axis.horizontal,
               itemBuilder: (context, index) => buildItem(context,state,index ),
               separatorBuilder: (context, index) =>
               const SizedBox(width: 15),
               itemCount: state.books.length,
           ),
         );
       }else if(state is FeatureBookError){
         return CustomErrorWidget(errorMessage: state.errorMessage);
       }else{
         return const Center(child: CircularProgressIndicator());
       }
  },
);
  }
  Widget buildItem(context ,FeatureBookSuccess state,int index){
    return GestureDetector(
      onTap:(){
        GoRouter.of(context).push(
          AppRouter.kBookDetails,
          extra:state.books[index] ,
        );
      } ,
      child: Container(
        width: MediaQuery.of(context).size.width*0.35,
        height: MediaQuery.of(context).size.height*0.25,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: CachedNetworkImage(
          imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail??
              'https://th.bing.com/th/id/R.7e8731768b177cb71531b1a99f099b1d?rik=5DVLPzkPXrkxTA&pid=ImgRaw&r=0',
          fit: BoxFit.fill,
          placeholder:(context,url)=>const Center(child: CircularProgressIndicator()) ,
        ),
      ),
    );
  }
}

