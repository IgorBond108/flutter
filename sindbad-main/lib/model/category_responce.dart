class CategoryResponceMoodel {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;

  CategoryResponceMoodel({this.count, this.next, this.previous, this.results});

  CategoryResponceMoodel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? title;
  int? parent;
  String? slug;
  List<Children>? children;

  Results({this.id, this.title, this.parent, this.slug, this.children});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    parent = json['parent'];
    slug = json['slug'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['parent'] = this.parent;
    data['slug'] = this.slug;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Children {
  int? id;
  String? title;
  int? parent;
  String? slug;
  List<Children>? children;

  Children({this.id, this.title, this.parent, this.slug, this.children});

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    parent = json['parent'];
    slug = json['slug'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['parent'] = this.parent;
    data['slug'] = this.slug;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}