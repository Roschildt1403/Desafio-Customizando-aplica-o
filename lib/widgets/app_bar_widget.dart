import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100);
  final bool isEdit;
  final String page;

  const AppBarWidget({Key? key, required this.isEdit, required this.page})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (page == "Home") {
      return AppBar(
        title: Text("NOTES"),
        centerTitle: true,
      );
    }
    if (page == "Edit") {
      return AppBar(
        title: Text(isEdit ? "Edit Note" : "Create Note"),
        actions: [
          if (isEdit)
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Navigator.pop(context, "");
              },
            )
        ],
      );
    } else {
      return CircularProgressIndicator();
    }
  }
}
