class CartResponceModel{
  int? count;
  String? next;
  String? previous;
  List<CartResults>? results;

  CartResponceModel({this.count, this.next, this.previous, this.results});

  CartResponceModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <CartResults>[];
      json['results'].forEach((v) {
        results!.add(CartResults.fromJson(v));
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

class CartResults {
  int? id;
  int? quantity;
  Cart? cart;
  Product? product;

  CartResults({this.id, this.quantity, this.cart, this.product});

  CartResults.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    cart = json['cart'] != null ? new Cart.fromJson(json['cart']) : null;
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    if (this.cart != null) {
      data['cart'] = this.cart!.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Cart {
  int? id;
  String? created;
  int? user;

  Cart({this.id, this.created, this.user});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created = json['created'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created'] = this.created;
    data['user'] = this.user;
    return data;
  }
}

class Product {
  int? id;
  String? title;
  String? slug;
  String? description;
  double? weight;
  double? height;
  double? width;
  double? length;
  bool? infinity;
  bool? featured;
  String? status;
  bool? digital;
  String? sku;
  String? costPrice;
  String? salePrice;
  String? discountPrice;
  String? createDate;
  String? updateDate;
  int? brand;
  int? cat;
  dynamic? productcard;
  int? vendor;
  int? updatedBy;
  List<dynamic>? tags;

  Product(
      {this.id,
      this.title,
      this.slug,
      this.description,
      this.weight,
      this.height,
      this.width,
      this.length,
      this.infinity,
      this.featured,
      this.status,
      this.digital,
      this.sku,
      this.costPrice,
      this.salePrice,
      this.discountPrice,
      this.createDate,
      this.updateDate,
      this.brand,
      this.cat,
      this.productcard,
      this.vendor,
      this.updatedBy,
      this.tags});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    weight = json['weight'];
    height = json['height'];
    width = json['width'];
    length = json['length'];
    infinity = json['infinity'];
    featured = json['featured'];
    status = json['status'];
    digital = json['digital'];
    sku = json['sku'];
    costPrice = json['cost_price'];
    salePrice = json['sale_price'];
    discountPrice = json['discount_price'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    brand = json['brand'];
    cat = json['cat'];
    productcard = json['productcard'];
    vendor = json['vendor'];
    updatedBy = json['updated_by'];
    if (json['tags'] != null) {
      tags = <dynamic>[];
      json['tags'].forEach((v) {
        tags!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['width'] = this.width;
    data['length'] = this.length;
    data['infinity'] = this.infinity;
    data['featured'] = this.featured;
    data['status'] = this.status;
    data['digital'] = this.digital;
    data['sku'] = this.sku;
    data['cost_price'] = this.costPrice;
    data['sale_price'] = this.salePrice;
    data['discount_price'] = this.discountPrice;
    data['create_date'] = this.createDate;
    data['update_date'] = this.updateDate;
    data['brand'] = this.brand;
    data['cat'] = this.cat;
    data['productcard'] = this.productcard;
    data['vendor'] = this.vendor;
    data['updated_by'] = this.updatedBy;
    // if (this.tags != null) {
    //   data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
