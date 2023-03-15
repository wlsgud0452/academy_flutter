class Schedule {
  final int? id;
  final String initdate;
  final String title;
  final String content;
  final String? user_uid;
  Schedule({
    this.id,
    required this.initdate,
    required this.title,
    required this.content,
    this.user_uid,
  });
  Schedule.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        initdate = res['initdate'],
        title = res['title'],
        content = res['content'],
        user_uid = res['user_uid'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'initdate': initdate,
      'title': title,
      'content': content,
      'user_uid': user_uid
    };
  }
}
