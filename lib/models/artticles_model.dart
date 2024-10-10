class ArtticlesModel {
  final Source source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  ArtticlesModel({
    required this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory ArtticlesModel.fromJson(Map<String, dynamic> data) {
    return ArtticlesModel(
      source: Source.fromJson(data['source']),
      author: data['author'],
      title: data['title'],
      description: data['description'],
      url: data['url'],
      urlToImage: data['urlToImage'],
      publishedAt: data['publishedAt'],
      content: data['content'],
    );
  }
}

class Source {
  final String? id;
  final String? name;

  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> data) {
    return Source(
      id: data['id'],
      name: data['name'],
    );
  }
}
