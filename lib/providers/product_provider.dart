import 'package:flutter/cupertino.dart';
import 'package:flutter_shopping/providers/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Naruto Cloak',
      description: 'Akatsuki cloak uchiha!',
      price: 39.99,
      imageUrl:
          'https://img.joomcdn.net/cd3d6f345224f0a4921d6e34fa2db797f16287c5_original.jpeg',
    ),
    Product(
      id: 'p2',
      title: 'Hoodie Sweetshirt',
      description: 'One Piece  hoodie',
      price: 59.99,
      imageUrl:
          'https://ae01.alicdn.com/kf/H983475d22b12469f980cf51c237b9f67v/Anime-One-Piece-Hoodie-Sweatshirt-Jeans-Clothes-For-Men-One-Piece-luffy-Coat-Jackets-Outwear-Men.jpg_Q90.jpg_.webp',
    ),
    Product(
      id: 'p3',
      title: 'Game Cube',
      description: 'Nintendo GameCube Limited Edition',
      price: 19.99,
      imageUrl:
          'https://http2.mlstatic.com/D_NQ_NP_721520-MLA40192899010_122019-O.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Naruto Shuriken',
      description: 'Kunai Shuriken cosplay',
      price: 49.99,
      imageUrl:
          'https://http2.mlstatic.com/D_NQ_NP_977795-MLM41908167360_052020-O.jpg',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favItems {
    return _items.where((prod) => prod.isFavourite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((item) => item.id == id);
  }

  void addProduct(Product newProduct) {
    _items.add(newProduct);
    notifyListeners();
  }

  void deleteProduct(String productId) {
    _items.removeWhere((element) => element.id == productId);
    notifyListeners();
  }

  void updateProduct(String productId, Product product) {
    final prot = _items.indexWhere((element) => element.id == productId);
    _items[prot] = product;
    notifyListeners();
  }
}
