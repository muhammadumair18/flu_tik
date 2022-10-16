class Video{
  String username;
  String uid;
  String id;
  List likes;
  String songName;
  String Caption;
  String thumbnail;
  String videourl;
  String profilephoto;
  int commentcount;
  int sharecount;

  Video({
    required this.username,
    required this.uid,
    required this.id,
    required this.likes,
    required this.songName,
    required this.Caption,
    required this.thumbnail,
    required this.videourl,
    required this.profilephoto,
    required this.commentcount,
    required this.sharecount,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': this.username,
      'uid': this.uid,
      'id': this.id,
      'likes': this.likes,
      'songName': this.songName,
      'Caption': this.Caption,
      'thumbnail': this.thumbnail,
      'videourl': this.videourl,
      'profilephoto': this.profilephoto,
      'commentcount': this.commentcount,
      'sharecount': this.sharecount,
    };
  }

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
      username: map['username'] as String,
      uid: map['uid'] as String,
      id: map['id'] as String,
      likes: map['likes'] as List,
      songName: map['songName'] as String,
      Caption: map['Caption'] as String,
      thumbnail: map['thumbnail'] as String,
      videourl: map['videourl'] as String,
      profilephoto: map['profilephoto'] as String,
      commentcount: map['commentcount'] as int,
      sharecount: map['sharecount'] as int,
    );
  }
}