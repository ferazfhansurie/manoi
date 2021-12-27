import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:manoi/screens/home.dart';

class Shop {
  final String uid;

  Shop({this.uid});
}

class ShopData {
  String shopName;
  String shopPic;
  String shopDesc;
  String shopLocation;
  String shopCategory;
  String shopProduct;
  String shopReview;

  shop(
    String shopName,
    String shopPic,
    String shopDesc,
    String shopLocation,
    String shopCategory,
    String shopProduct,
    String shopReview,
  ) {
    this.shopName = shopName;
    this.shopPic = shopPic;
    this.shopDesc = shopDesc;
    this.shopLocation = shopLocation;
    this.shopCategory = shopCategory;
    this.shopProduct = shopProduct;
    this.shopReview = shopReview;
  }

  String getshopName() {
    return shopName;
  }

  String getshopPic() {
    return shopPic;
  }

  String getshopDesc() {
    return shopDesc;
  }

  String getshopLocation() {
    return shopLocation;
  }

  String getshopCategory() {
    return shopCategory;
  }

  String getshopProduct() {
    return shopPic;
  }
}
