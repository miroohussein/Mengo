import 'package:flutter/material.dart';
import 'package:mengo/colors/colors.dart';

showDaialogLoader(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SizedBox(
          height: 32,
          child: Center(child: CircularProgressIndicator()),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              20,
            ),
          ),
        ),
      );
    },
  );
}

showErrorDaialog(
  String masseage,
  BuildContext context,
) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
          ),
          title: Text('Error'),
          content: Text(
            masseage,
            style: TextStyle(
              color: MengoColors.mainOrange,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'done',
                  style: TextStyle(
                    color: MengoColors.mainOrange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ],
        ),
      );
    },
  );
}

Future qrDaialog(
    String masseage,
    BuildContext context
    , String title,
    final VoidCallback function
    ) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
          ),
          title: Text(title),
          content: Text(
            masseage,
            style: TextStyle(
              color: MengoColors.mainOrange,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          actions: [FlatButton(onPressed: function, child: Text('done'))],
        ),
      );
    },
  );
}
