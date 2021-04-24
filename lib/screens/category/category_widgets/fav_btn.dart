import 'package:final_project/config/app_string.dart';
import 'package:final_project/models/product.dart';
import 'package:final_project/services/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavBtn extends StatefulWidget {
  const FavBtn({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _FavBtnState createState() => _FavBtnState();
}

class _FavBtnState extends State<FavBtn> {
  @override
  Widget build(BuildContext context) {
    List<String> allFavs = Hive.box(AppString.LocalMemory).get("favs") ?? [];
    var isFav = allFavs.contains(widget.product.id);
    return IconButton(
      color: Colors.red,
      icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
      onPressed: () async {
        await toggleFavs(widget.product.id);
        setState(() {});
      },
    );
  }
}
