import 'package:amazon/UI/product_card.dart';
import 'package:amazon/UI/product_no_button.dart';
import 'package:amazon/models/category.dart';
import 'package:amazon/models/product.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  Map titles;
  @override
  Widget build(BuildContext context) {
    titles = {
      6: "Watches",
      0: "Recommended Deal of the Day",
      1: "Watches",
      2: "Sunscreen",
      3: "Clothing",
      4: "Outdoor gear",
      5: "Deal of the Day",
      7: "Sunscreen",
      8: "Clothing",
      9: "Outdoor gear",
    };
    return ListView(
      padding: EdgeInsets.all(0),
      children: getProducts(),
    );
  }

  List<Widget> getProducts() {
    List<Widget> productList = [
      Container(
        alignment: Alignment.bottomCenter,
        height: 260,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://d3nuqriibqh3vw.cloudfront.net/styles/aotw_card_ir/s3/media-youtube/jTOvtcunHoY.jpg?itok=lW-nLwLc'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 70,
              width: 340,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
            
                Image.network('https://www.pngitem.com/pimgs/m/31-316852_virtual-reality-headset-samsung-gear-vr-oculus-rift.png',height: 40,),
                Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
          
                                  children: [Text('Samsung Gear VR', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal
                  ),),
                  Text('FOR GAMES', style:TextStyle(
                    
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ))]
                ),
                SizedBox(width:10),
                Container(
                  alignment: Alignment.center,
                  height:40,
                  width:40,
                  decoration:BoxDecoration(color: Colors.yellow[900], borderRadius:BorderRadius.circular(2) ),
                  child:Icon(Icons.arrow_forward, color: Colors.white),
                )
              ]),
            )),
      )
    ];
    bool hasBeenThree = true;
    bool isButton = true;
    Category cat;
    bool many = true;
    for (int i = 0; i < 10; i++) {
      List<Product> products = [];
      if (i % 2 == 0) {
        if (hasBeenThree) {
          for (int j = 1; j < 10; j++) {
            products
                .add(createProduct("watch" + j.toString(), "watch", 10.0 * j));
          }
        } else {
          for (int j = 1; j < 4; j++) {
            products.add(
                createProduct("image" + j.toString(), "product", 10.0 * j));
          }
        }
        hasBeenThree = !hasBeenThree;
      } else {
        if (isButton) {
          products.add(createProduct("image1", "new product!", 10.0));
        } else {
          cat = createCategory(many);
          many = !many;
          products.add(createProduct("image1", "new product!", 10.0));
        }
      }
      if (i % 2 > 0) {
        if (isButton) {
          productList.add(ProductCard(
            products: products,
            title: titles[i],
          ));
        } else {
          productList.add(CategoryCard(
            category: cat,
          ));
        }
        isButton = !isButton;
      } else {
        productList.add(ProductCard(
          products: products,
          title: titles[i],
        ));
      }
    }
    return productList;
  }

  Product createProduct(String assetName, String productName, double price) {
    return Product(
        AssetImage("lib/assets/" + assetName + ".jpeg"), productName, price);
  }

  Category createCategory(bool many) {
    List<AssetImage> images = [];
    List<String> categories = [];
    if (many) {
      images = [
        AssetImage("lib/assets/image3.jpeg"),
        AssetImage("lib/assets/image2.jpeg"),
        AssetImage("lib/assets/image4.jpeg"),
        AssetImage("lib/assets/image5.jpeg"),
      ];
      categories = ["Servers", "Monitors", "Phones", "Related"];
    } else {
      images = [
        AssetImage("lib/assets/image2.jpeg"),
      ];
    }
    return Category(images, "Electronics", categories);
  }
}
