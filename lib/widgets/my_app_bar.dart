import 'package:flutter/material.dart';

// class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final Color backgroundColor = Colors.red;

//   final double height;

//   /// you can add more fields that meet your needs

//   const MyAppBar({Key key, this.height}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Container(
//         height: height,
//         child: Column(
//           children: [
//             Text('LOGO'),
//             TextField(
//               decoration: InputDecoration(
//                   hintText: 'Search',
//                   prefixIcon: Icon(Icons.search),
//                   border: OutlineInputBorder(),
//                   focusColor: Colors.white),
//             )
//           ],
//         ),
//       ),
//       backgroundColor: backgroundColor,
//       actions: [],
//     );
//   }

//   @override
//   Size get preferredSize => new Size.fromHeight(height);
// }

class MyAppBar extends PreferredSize {
  final double height;

  MyAppBar({this.height = kToolbarHeight});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('LOGO'),
      flexibleSpace:Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all( 8),
            child:TextField(
                    decoration: InputDecoration(
                      fillColor:Colors.white,
                      filled: true,
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                        focusColor: Colors.white),
                  ), 
             ),
        ],
      )
    );
  }
}

// return Container(
//       height: preferredSize.height,
//       color: Colors.black87,
//       alignment: Alignment.center,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 8),
//               child:Row(children: [ Drawer,Text(
//                 'LOGO',style: TextStyle(
//                   fontSize: 24,
//                   color: Colors.white
//                   )
//                 )],),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: 
//             )
//           ],
//         ),
//     );
