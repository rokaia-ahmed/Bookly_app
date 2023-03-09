import 'package:bookly_app/core/utiles/app_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utiles/app_assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          AppAssets.logo,
          width: 80,
          height:20 ,
          fit: BoxFit.contain,
        ),
        IconButton(
          padding:EdgeInsets.zero ,
          constraints:const BoxConstraints(
            minWidth: 10,
            minHeight: 10,
          ) ,
          onPressed: (){
            GoRouter.of(context).push(AppRouter.kSearchScreen);
          },
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            size:20 ,
          ),
        ),
      ],
    );
  }
}
