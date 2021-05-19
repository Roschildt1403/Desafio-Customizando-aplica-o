import 'package:desafio_2/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class CreateNotePage extends StatefulWidget {
  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  String texto = "";
  var textController = TextEditingController();
  bool isEdit = false;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        texto = ModalRoute.of(context)!.settings.arguments as String;
        textController.text = texto;
      }
      isEdit = true;
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        isEdit: isEdit,
        page: "Edit",
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textField(),
            SizedBox(
              height: 32,
            ),
            if (textController.text.isNotEmpty) saveButton(),
          ],
        ),
      ),
    );
  }

  Widget textField() {
    return TextField(
      decoration: InputDecoration(labelText: "Descrição"),
      controller: textController,
      onChanged: (x) {
        setState(() {});
      },
      maxLines: null,
    );
  }

  Widget saveButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context, textController.text);
            },
            child: Text("salvar"),
          ),
        ),
      ],
    );
  }
}
