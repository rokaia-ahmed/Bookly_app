import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utiles/app_router.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildItem(context),
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemCount: 10,
      ),
    );
  }
  Widget buildItem(context) {
    return GestureDetector(
      onTap:(){
        GoRouter.of(context).push(AppRouter.kBookDetails);
      } ,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.height * 0.22,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              'https://wallup.net/wp-content/uploads/2018/10/07/649235-fox-foxes-df.jpg',
              fit: BoxFit.fill,
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
                  child: const Text('Harry potter'
                      ' and the Goblet of fire',
                    maxLines: 2,
                    style:TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ) ,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text('J.K. Rowling',
                  style:TextStyle(
                    //fontSize: 16,
                    color:Colors.grey ,
                  ) ,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text('19.99 €',
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
                    const Text('4.8',
                      style:TextStyle(
                        fontSize: 16,
                      ) ,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text('(2390)',
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
