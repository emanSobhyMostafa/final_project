import 'package:final_project/config/theme_colors.dart';
import 'package:final_project/screens/product_details/widgets/my_video_player.dart';
import 'package:flutter/material.dart';

class PreviewButton extends StatelessWidget {
  const PreviewButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(third),
      ),
      child: Text("Preview"),
      onPressed: () {
        
        showModalBottomSheet(
          elevation: 0,
          backgroundColor: Colors.grey.withOpacity(.75),
          context: context,
          builder: (context) => Container(
            // color: Colors.white,
            child: AlertDialog(
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              content: MyVideoPlayer(
                path:
                    "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
              ),
              actions: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      FlatButton(
                        child: Text("Close"),
                        textColor: Colors.white,
                        color: Theme.of(context).accentColor,
                        onPressed: () => Navigator.pop(context),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
