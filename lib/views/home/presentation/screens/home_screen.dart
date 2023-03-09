import 'package:bookly_app/views/home/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/best_seller_list_view.dart';
import '../widgets/custom_horizontal_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CustomAppBar(),
                SizedBox(height: 15),
                CustomHorizontalListView(),
                SizedBox(height: 30),
                Text('Newest Books',
                 style:TextStyle(
                   fontSize: 20,
                   fontWeight:FontWeight.w400,
                 ) ,
                ),
                SizedBox(height: 20),
                BestSellerListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
