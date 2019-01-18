import 'dart:math';

class Article {
  final String name;
  final String text;
  final String domain;
  final String by;
  final String age;
  final int score;
  final int commentScore;

  Article({
    this.name,
    this.text,
    this.domain,
    this.by,
    this.age,
    this.score,
    this.commentScore,
  });
}

final articles = List<Article>.generate(
    20,
    (int id) => Article(
          name: "Name: $id",
          text: generateRandomText(id),
          domain: "Domain: $id",
          by: "By $id",
          age: "Age: $id",
          score: id * 2,
          commentScore: id * 3,
        ));

String generateRandomText(int id) {
  Random random = Random();

  return List<String>.generate(60, (int index) => random.nextInt(10).toString())
      .fold("ID: $id --> ", (curr, next) => curr + next);
}
