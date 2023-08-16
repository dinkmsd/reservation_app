class ReviewModel {
  int? rating;
  String? comment;
  String? avatar;
  String? userName;
  String? reviewDate;

  ReviewModel(
      {this.rating, this.comment, this.avatar, this.userName, this.reviewDate});

  Map<String, dynamic> toJson() => {
        'rating': rating,
        'comment': comment,
      };

  static ReviewModel fromJson(Map<String, dynamic> json) =>
      ReviewModel(comment: json['comment'], rating: json['rating']);
}

List<ReviewModel> reviewModelMockData = <ReviewModel>[
  ReviewModel(
      rating: 5,
      userName: 'kristinjones',
      avatar: 'assets/images/images/avatar.png',
      comment: 'I would recommend this for all my friend!',
      reviewDate: '1 day ago'),
  ReviewModel(
      rating: 4,
      userName: 'cameronwilliam',
      avatar: 'assets/images/images/avatar_01.png',
      comment: 'I love it so much',
      reviewDate: '2 day ago'),
  ReviewModel(
      rating: 3,
      userName: 'courtneyhenry',
      avatar: 'assets/images/images/avatar_02.png',
      comment: 'It’s just good',
      reviewDate: '1 day ago'),
  ReviewModel(
      rating: 5,
      userName: 'jacobjones',
      avatar: 'assets/images/images/avatar_03.png',
      comment: 'Great dishes.',
      reviewDate: '1 day ago'),
  ReviewModel(
      rating: 5,
      userName: 'eleanorpena',
      avatar: 'assets/images/images/avatar_04.png',
      comment: 'A very good experience!',
      reviewDate: '1 day ago'),
  ReviewModel(
      rating: 5,
      userName: 'kristinjones',
      avatar: 'assets/images/images/avatar.png',
      comment: 'I would recommend this for all my friend!',
      reviewDate: '1 day ago'),
  ReviewModel(
      rating: 4,
      userName: 'cameronwilliam',
      avatar: 'assets/images/images/avatar_01.png',
      comment: 'I love it so much',
      reviewDate: '2 day ago'),
  ReviewModel(
      rating: 3,
      userName: 'courtneyhenry',
      avatar: 'assets/images/images/avatar_02.png',
      comment: 'It’s just good',
      reviewDate: '1 day ago'),
  ReviewModel(
      rating: 5,
      userName: 'jacobjones',
      avatar: 'assets/images/images/avatar_03.png',
      comment: 'Great dishes.',
      reviewDate: '1 day ago'),
  ReviewModel(
      rating: 5,
      userName: 'eleanorpena',
      avatar: 'assets/images/images/avatar_04.png',
      comment: 'A very good experience!',
      reviewDate: '1 day ago'),
];
