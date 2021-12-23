List<String> bookmarksCategories = [
  'Business',
  'Politics',
  'Sports',
  'Technology',
  'Automobile',
  'Art',
  'National',
  'International',
  'Crime',
  'Lifestyle',
];

class Bookmark {
  String imageUrl;
  String title;
  String date;
  String description;
  List<String> screenshots;

  Bookmark({
    this.imageUrl,
    this.title,
    this.date,
    this.description,
    this.screenshots,
  });

}

List<Bookmark> business_news() {
  return [
    Bookmark(
      imageUrl:
      'assets/images/article.jpg',
      title: 'Warning signs of a physical developmental delay',
      date: 'Bookmark 1',
      description: 'Children develop at different rates, but most follow a general timeline though preemies may be off schedule by a few weeks or months.If your child doesnt seem to be meeting milestones within several weeks of the average ask his doctor about it. It may be nothing, but if your child does have a delay, ',
    ),
    Bookmark(
      imageUrl:
      'assets/images/dev.jpg',
      title: 'Could my child have a developmental delay?',
      date: 'Bookmark 2',
      description: 'Bookmark 2',
    ),
    Bookmark(
      imageUrl:
      'assets/images/ba.jpg',
      title: 'Is it normal that my baby doesnt roll over yet?',
      date: 'Bookmark 3',
      description: 'Bookmark 3',
    ),
    Bookmark(
      imageUrl:
      'assets/images/know.jpg',
      title: 'Unibator programme',
      date: 'Bookmark 4',
      description: 'Bookmark 4',
    ),
    Bookmark(
      imageUrl:
      'assets/images/over.jpg',
      title: 'Baby milestone: Rolling over',
      date: 'Bookmark 5',
      description: 'Bookmark 5',
    ),
    
  ];
}