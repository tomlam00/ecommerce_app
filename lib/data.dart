final List<String> itemList = ['A', 'B', 'C', 'D', 'E'];
final List<String> newList = ['New1', 'New2', 'New3', 'New4', 'New5'];
final List<String> categoriesList = [
  'Category 1',
  'Category 2',
  'Category 3',
  'Category 4',
  'Category 5',
  'Category 6',
  'Category 7',
  'Category 8'
];
final List<String> cartList = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'A',
  'B',
  'C',
  'D',
  'E'
];
final List<String> likedList = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'A',
  'B',
  'C',
  'D',
  'E'
];

class Model {
  String imageUrl;
  String name;
  int price;

  Model({
    this.imageUrl,
    this.name,
    this.price,
  });
}

final List<Model> models = [
  Model(imageUrl: 'assets/images/modelA.jpg', name: 'Model A', price: 1000),
  Model(imageUrl: 'assets/images/modelB.jpg', name: 'Model B', price: 600),
  Model(imageUrl: 'assets/images/modelC.jpg', name: 'Model C', price: 240),
  Model(imageUrl: 'assets/images/modelD.jpg', name: 'Model D', price: 2340),
  Model(imageUrl: 'assets/images/modelE.jpg', name: 'Model E', price: 2561),
];

final List<String> carouselItems = [
  'assets/images/CarouselA.jpg',
  'assets/images/CarouselB.jpg',
  'assets/images/CarouselC.jpg'
];

final saved = List<Model>();

final cart = List<Model>();
