import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';
import 'package:notes/utils/colors.dart';
import 'dart:math';

class UpdateView extends StatefulWidget {
  final int? id;
  const UpdateView({
    super.key,
    this.id
  });

  @override
  State<UpdateView> createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateView> {
  
  final TextEditingController title = TextEditingController();
  final TextEditingController content = TextEditingController();
  @override
  void initState() {
    super.initState();
    if(widget.id != null){      
      setState(() {
        var note = NoteModel.notes.firstWhere((element) => element.id == widget.id);
        title.text = note.title;
        content.text = note.content;
      });
    }
    content.addListener(() { 
      setState((){});
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert_rounded, color: Colors.white,),
            color: secondary,
            padding: const EdgeInsets.symmetric(vertical: -2),
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () {
                  setState(() {
                    if(widget.id == null){
                      Random  random = Random();
                      int randomInt = 1 + random.nextInt(1000 - 1 + 1);
                      NoteModel.notes.add(NoteModel(id: randomInt + DateTime.now().second, title: title.text, content: content.text, date: DateTime.now()));
                    }else{
                      NoteModel.notes.firstWhere((element) => element.id == widget.id).title = title.text;
                      NoteModel.notes.firstWhere((element) => element.id == widget.id).content = content.text;
                      NoteModel.notes.firstWhere((element) => element.id == widget.id).date = DateTime.now();
                    }
                  });
                },
                child: const SizedBox(
                  child: Text(
                    'Update',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                )
              ),
              PopupMenuItem(
                onTap: () {
                  setState(() {
                    NoteModel.notes.removeWhere((element) => element.id == widget.id);
                    Navigator.pop(context);
                  });
                },
                child: const SizedBox(
                  child: Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                )
              ),
            ]
          )
        ],
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w400
              ),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.black,
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                hintText: 'Title',
                hintStyle: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 25,
                  fontWeight: FontWeight.w400
                ),
                border: InputBorder.none,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    '${DateTime.now().toString().split(' ')[0]} ${DateTime.now().hour.toString() +':'+ DateTime.now().minute.toString()} | ${content.text.length} characters',
                    style: const TextStyle(
                      color: Color(0xff5d5d5d),
                      fontSize: 12
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: TextField(
                  controller: content,
                  maxLines: null,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,  
                  ),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    hintText: 'Start typing',
                    hintStyle: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 16,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}