import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';
import 'package:notes/utils/colors.dart';
import 'package:notes/views/update.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<NoteModel> notes = NoteModel.notes;
  //controllers
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(() { 
      filter();
    });
  }
  //filter
  void filter(){
    if(searchController.text.isEmpty){
      setState(() {
        notes = NoteModel.notes;
      });

      return;
    }

    setState(() {
      notes = notes.where((element) => element.title.toLowerCase().contains(searchController.text.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SearchWidget(controller: searchController),
              const SizedBox(height: 50,),
              Expanded(
                child: SizedBox(
                  child: ListView.separated(
                    itemCount: notes.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 10), 
                    itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: () async{
                          await Navigator.push(context, MaterialPageRoute(builder: (_) => UpdateView(id: notes[index].id)));
                          setState(() {
                            notes = NoteModel.notes;
                          });
                        },
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: secondary,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  notes[index].title.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                      
                                Text(
                                  notes[index].content.toString(),
                                  style: const TextStyle(
                                    color: hint,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                      
                                Text(
                                  notes[index].date.toString().split(' ')[0].toString(),
                                  style: const TextStyle(
                                    color: hint,
                                    fontSize: 11
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    } 
                  )
                )
              )
            ],
          ),
        )
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40, right: 20),
        child: ClipOval(
          child: FloatingActionButton(
            backgroundColor: buttons,
            foregroundColor: Colors.white,
            child: const Icon(
              Icons.add,
              size: 30,
            ),
            onPressed: () async{
              await Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdateView()));
              setState(() {
                notes = NoteModel.notes;
              });
            }
          ),
        ),
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(
        color: text,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30)
        ),
        fillColor: const Color(0xff1f1f1f),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
        hintText: 'Search notes',
        hintStyle: const TextStyle(
          color: hint,
          fontSize: 14,
          fontWeight: FontWeight.w300
        ),
        
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: hint,
          size: 21,
        )
      ),
    );
  }
}