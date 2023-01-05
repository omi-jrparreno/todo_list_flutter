class Note {
  final String title;
  final String description;

  const Note({required this.title, required this.description});

  String getNote() {
    return "$title $description";
  }
}
