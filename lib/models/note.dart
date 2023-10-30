class NoteModel{
  int id;
  String title;
  String content;
  DateTime? date;

  static List<NoteModel> notes = [];

  NoteModel({
    required this.id,
    required this.title,
    required this.content,
    this.date
  });

  // static void fillNotes(){
  //   // NoteModel.notes = [];
  //   // notes.add(NoteModel(id: 1, title: 'Node.js', content: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.', date: DateTime.now()));
  //   // notes.add(NoteModel(id: 2, title: 'Dart', content: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.', date: DateTime.now()));
  //   // notes.add(NoteModel(id: 3, title: 'Java', content: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.', date: DateTime.now()));
  //   // notes.add(NoteModel(id: 4, title: 'Laravel', content: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.', date: DateTime.now()));
  // }
}