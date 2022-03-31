import 'package:cached_network_image/cached_network_image.dart';
import 'package:checkinpromobile/src/constants/AppColors.dart';
import 'package:checkinpromobile/src/constants/AppTextStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MessageNotificationBanner extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback onForward;
  final String faceCaptureFile;
  final String title;
  final String message;

  const MessageNotificationBanner(
      {Key key,
      this.onClose,
      this.onForward,
      this.faceCaptureFile,
      this.title,
      this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onClose != null) {
          onForward();
        }
      },
      child: Card(
        shadowColor: Colors.black87,
        color: Colors.lightBlue[900],
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
        child: SafeArea(
          child: ListTile(
            contentPadding:
                EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
            leading: SizedBox.fromSize(
              size: const Size(60, 60),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: 60,
                    height: 60,
                    imageUrl: faceCaptureFile ?? "",
                    placeholder: (cx, url) {
                      return CircularProgressIndicator();
                    },
                    errorWidget: (context, url, error) => CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/default_avatar.png'),
                      radius: 40,
                    ),
                  )),
            ),
            title: Text(
              this.title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: AppTextStyles.tahomaFont,
                  fontWeight: FontWeight.w600),
            ),
            subtitle: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  this.message,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: AppTextStyles.tahomaFont,
                      fontWeight: FontWeight.w300),
                )),
            trailing: IconButton(
                icon: Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  ///TODO i'm not sure it should be use this widget' BuildContext to create a Dialog
                  ///maybe i will give the answer in the future
                  if (onClose != null) onClose();
                }),
          ),
        ),
      ),
    );
  }
}
