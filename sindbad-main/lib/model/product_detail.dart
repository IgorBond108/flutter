class ProductDetailModel {
  String? title;
  String? slug;
  String? description;
  double? weight;
  double? height;
  double? width;
  double? length;
  String? sku;
  String? brand;
  String? status;
  bool? infinity;
  bool? featured;
  bool? digital;
  String? salePrice;
  String? discountPrice;
  List<dynamic>? tags;
  int? reviewsCount;
  double? rate;
  List<Cat>? cat;
  List<ProductImages>? productImages;
  bool? isFavorite;
  bool? isCartItem;
  dynamic productcard;

  ProductDetailModel(
      {this.title,
      this.slug,
      this.description,
      this.weight,
      this.height,
      this.width,
      this.length,
      this.sku,
      this.brand,
      this.status,
      this.infinity,
      this.featured,
      this.digital,
      this.salePrice,
      this.discountPrice,
      this.tags,
      this.reviewsCount,
      this.rate,
      this.cat,
      this.productImages,
      this.isFavorite,
      this.isCartItem,
      this.productcard});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    weight = json['weight'];
    height = json['height'];
    width = json['width'];
    length = json['length'];
    sku = json['sku'];
    brand = json['brand'];
    status = json['status'];
    infinity = json['infinity'];
    featured = json['featured'];
    digital = json['digital'];
    salePrice = json['sale_price'];
    discountPrice = json['discount_price'];
    if (json['tags'] != null) {
      tags = <Null>[];
      json['tags'].forEach((v) {
        tags!.add(v);
      });
    }
    reviewsCount = json['reviews_count'];
    rate = double.tryParse('${json['rate']}');
    if (json['cat'] != null) {
      cat = <Cat>[];
      json['cat'].forEach((v) {
        cat!.add(new Cat.fromJson(v));
      });
    }
    if (json['product_images'] != null) {
      productImages = <ProductImages>[];
      json['product_images'].forEach((v) {
        productImages!.add(ProductImages.fromJson(v));
      });
    }
    isFavorite = json['is_favorite'];
    isCartItem = json['is_cart_item'];
    productcard = json['productcard'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['width'] = this.width;
    data['length'] = this.length;
    data['sku'] = this.sku;
    data['brand'] = this.brand;
    data['status'] = this.status;
    data['infinity'] = this.infinity;
    data['featured'] = this.featured;
    data['digital'] = this.digital;
    data['sale_price'] = this.salePrice;
    data['discount_price'] = this.discountPrice;
    if (this.tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    data['reviews_count'] = this.reviewsCount;
    data['rate'] = this.rate;
    if (this.cat != null) {
      data['cat'] = this.cat!.map((v) => v.toJson()).toList();
    }
    if (this.productImages != null) {
      data['product_images'] =
          this.productImages!.map((v) => v.toJson()).toList();
    }
    data['is_favorite'] = this.isFavorite;
    data['is_cart_item'] = this.isCartItem;
    data['productcard'] = this.productcard;
    return data;
  }
}

class Cat {
  int? id;
  String? title;
  int? parentId;
  String? slug;
  int? lft;
  int? rght;
  int? treeId;
  int? level;

  Cat(
      {this.id,
      this.title,
      this.parentId,
      this.slug,
      this.lft,
      this.rght,
      this.treeId,
      this.level});

  Cat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    parentId = json['parent_id'];
    slug = json['slug'];
    lft = json['lft'];
    rght = json['rght'];
    treeId = json['tree_id'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['parent_id'] = this.parentId;
    data['slug'] = this.slug;
    data['lft'] = this.lft;
    data['rght'] = this.rght;
    data['tree_id'] = this.treeId;
    data['level'] = this.level;
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
