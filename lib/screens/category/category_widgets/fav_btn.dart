import 'package:final_project/bloc/main_bloc.dart';
import 'package:final_project/models/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavBtn extends StatelessWidget {
  const FavBtn({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
        final allFavs = BlocProvider.of <MainBloc>(context).state.userFavourites;

    
    return IconButton(
      icon: Icon(CupertinoIcons.heart),
      onPressed: () {
        if (FirebaseAuth.instance.currentUser.uid ==
            null) {
          return;
        }
        if (allFavs.contains(product.id)) {
        } else {
          allFavs.add('value');
        }
      },
    );
  }
}