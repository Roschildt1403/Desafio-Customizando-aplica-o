import 'package:desafio_2/create_note_page.dart';
import 'package:desafio_2/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>["Primeiro Projeto"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        page: "Home",
        isEdit: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < notes.length; i++)
              Card(
                child: ListTile(
                  onTap: () async {
                    var response = await Navigator.pushNamed(
                      context,
                      "/create-note",
                      arguments: notes[i],
                    );
                    if (response.toString().isEmpty) {
                      notes.removeAt(i);
                    } else {
                      notes[i] = ("$response");
                    }

                    setState(() {});
                  },
                  title: Text(notes[i]),
                ),
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await Navigator.pushNamed(context, "/create-note");
          print(response);

          notes.add("$response");
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
