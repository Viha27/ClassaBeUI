class Category {
  Category({
    this.title = '',
    this.description = '',
    this.imagePath = '',
    this.lessonCount = 0,
    this.money = 0,
    this.reviews = 0,
    this.rating = 0.0,
  });

  String title;
  int lessonCount;
  int money;
  int reviews;
  String description;
  double rating;
  String imagePath;

  static List<Category> categoryList = <Category>[
    Category(
      imagePath: 'assets/design_course/maths.png',
      title: 'Johnny Clark',
      reviews: 306,
      lessonCount: 24,
      description: 'Regular Classes\nand Revision\nMaths for first class',
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/design_course/maths.png',
      title: 'Jhonny Clark',
      lessonCount: 22,
      description: 'Regular Classes\nand Revision\nMaths for first class',
      money: 18,
      rating: 4.6,
    ),
    Category(
      imagePath: 'assets/design_course/interFace1.png',
      title: 'Jhonny Clark',
      lessonCount: 24,
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/design_course/interFace2.png',
      title: 'Jhonny Clark',
      lessonCount: 22,
      money: 18,
      rating: 4.6,
    ),
  ];

  static List<Category> popularCourseList = <Category>[
    Category(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'App Design Course',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Web Design Course',
      lessonCount: 28,
      money: 208,
      rating: 4.9,
    ),
    Category(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'App Design Course',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Web Design Course',
      lessonCount: 28,
      money: 208,
      rating: 4.9,
    ),
  ];
}
