class PhotoDTO {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  PhotoDTO({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl
  });

  static PhotoDTO fromJson(Map<dynamic, dynamic>? json) {
    return PhotoDTO(
        albumId: json?['albumId'],
        id: json?['id'],
        title: json?['title'],
        url: json?['url'],
        thumbnailUrl: json?['thumbnailUrl']
    );
  }
}