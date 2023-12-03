class QuizQustion {
  const QuizQustion(this.text, this.answers);
  final String text;
  final List<String> answers;
  List<String> getShuffeledAnswer() {
    final shuffledlist = List.of(answers);
    shuffledlist.shuffle();
    return shuffledlist;
  }
}
