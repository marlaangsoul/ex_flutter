class WebtoonModel {
  final String title, thumb, id;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
  // named constructor이라고 하는 이름 있는 클래스 constructor(생성자)아다.
  // 타이틀을 json의 타이틀로 초기화 해주는 것뿐.
}
