class ProductResponceModel {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;

  ProductResponceModel({this.count, this.next, this.previous, this.results});

  ProductResponceModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? title;
  String? slug;
  String? description;
  double? weight;
  double? height;
  double? width;
  double? length;
  List<ColorChoices>? colorChoices;
  List<SizeChoices>? sizeChoices;
  List<MaterialChoices>? materialChoices;
  String? sku;
  String? brand;
  String? vendor;
  String? updatedBy;
  double? rate;
  int? reviewsCount;
  String? createDate;
  String? salePrice;
  String? discountPrice;
  List<dynamic>? tags;
  String? cat;
  String? status;
  List<ProductImages>? productImages;

  Results(
      {this.id,
      this.title,
      this.slug,
      this.description,
      this.weight,
      this.height,
      this.width,
      this.length,
      this.colorChoices,
      this.sizeChoices,
      this.materialChoices,
      this.sku,
      this.brand,
      this.vendor,
      this.updatedBy,
      this.rate,
      this.reviewsCount,
      this.createDate,
      this.salePrice,
      this.discountPrice,
      this.tags,
      this.cat,
      this.status,
      this.productImages});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    weight = json['weight'];
    height = json['height'];
    width = json['width'];
    length = json['length'];
    if (json['color_choices'] != null) {
      colorChoices = <ColorChoices>[];
      json['color_choices'].forEach((v) {
        colorChoices!.add(ColorChoices.fromJson(v));
      });
    }
    if (json['size_choices'] != null) {
      sizeChoices = <SizeChoices>[];
      json['size_choices'].forEach((v) {
        sizeChoices!.add(SizeChoices.fromJson(v));
      });
    }
    if (json['material_choices'] != null) {
      materialChoices = <MaterialChoices>[];
      json['material_choices'].forEach((v) {
        materialChoices!.add(MaterialChoices.fromJson(v));
      });
    }
    sku = json['sku'];
    brand = json['brand'];
    vendor = json['vendor'];
    updatedBy = json['updated_by'];
    rate = double.tryParse('${json['rate']}');
    reviewsCount = json['reviews_count'];
    createDate = json['create_date'];
    salePrice = json['sale_price'];
    discountPrice = json['discount_price'];
    if (json['tags'] != null) {
      tags = [];
      json['tags'].forEach((v) {
        tags!.add(v);
      });
    }
    cat = json['cat'];
    status = json['status'];
    if (json['product_images'] != null) {
      productImages = <ProductImages>[];
      json['product_images'].forEach((v) {
        productImages!.add(new ProductImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['width'] = this.width;
    data['length'] = this.length;
    if (this.colorChoices != null) {
      data['color_choices'] =
          this.colorChoices!.map((v) => v.toJson()).toList();
    }
    if (this.sizeChoices != null) {
      data['size_choices'] = this.sizeChoices!.map((v) => v.toJson()).toList();
    }
    if (this.materialChoices != null) {
      data['material_choices'] =
          this.materialChoices!.map((v) => v.toJson()).toList();
    }
    data['sku'] = this.sku;
    data['brand'] = this.brand;
    data['vendor'] = this.vendor;
    data['updated_by'] = this.updatedBy;
    data['rate'] = this.rate;
    data['reviews_count'] = this.reviewsCount;
    data['create_date'] = this.createDate;
    data['sale_price'] = this.salePrice;
    data['discount_price'] = this.discountPrice;
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    data['cat'] = this.cat;
    data['status'] = this.status;
    if (this.productImages != null) {
      data['product_images'] =
          this.productImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ColorChoices {
  int? id;
  String? title;
  String? colorHex;
  String? slug;

  ColorChoices({this.id, this.title, this.colorHex, this.slug});

  ColorChoices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    colorHex = json['color_hex'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['color_hex'] = this.colorHex;
    data['slug'] = this.slug;
    return data;
  }
}

class SizeChoices {
  int? id;
  String? title;
  List<Categories>? categories;

  SizeChoices({this.id, this.title, this.categories});

  SizeChoices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? title;
  String? slug;

  Categories({this.id, this.title, this.slug});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    return data;
  }
}

class MaterialChoices {
  int? id;
  String? title;
  String? slug;
  List<Categories>? categories;

  MaterialChoices({this.id, this.title, this.slug, this.categories});

  MaterialChoices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductImages {
  int? id;
  String? image;
  Null? raw;
  int? product;
  Null? comment;
  Null? productreview;
  Null? color;

  ProductImages(
      {this.id,
      this.image,
      this.raw,
      this.product,
      this.comment,
      this.productreview,
      this.color});

  ProductImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    raw = json['raw'];
    product = json['product'];
    comment = json['comment'];
    productreview = json['productreview'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['raw'] = this.raw;
    data['product'] = this.product;
    data['comment'] = this.comment;
    data['productreview'] = this.productreview;
    data['color'] = this.color;
    return data;
  }
}
