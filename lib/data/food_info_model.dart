class FoodInfoModel {
  final String name;
  final String description;
  final int rate;
  final int rateNumber;
  final String imageAddress;
  final String restaurantAddress;
  final String? price;
  final List<SauceInfoModel>? sauces;

  FoodInfoModel(this.name, this.description, this.rate, this.rateNumber,
      this.imageAddress, this.restaurantAddress,
      {this.sauces, this.price});
}

class SauceInfoModel {
  final String? id;
  final String? name;
  final int? color;

  SauceInfoModel({this.id, this.name, this.color});
}

final List<FoodInfoModel> foodInfoListMockData = [
  FoodInfoModel('Beef Ribs', 'USDA beef ribs finger', 5, 100,
      'assets/images/images/image_example.png', 'An BBQ Su Van Hanh'),
  FoodInfoModel('Beef Bacon', 'USDA beef bacon', 3, 33,
      'assets/images/images/image_example_02.png', 'An BBQ Su Van Hanh'),
  FoodInfoModel('Beef Stake', 'USDA beefstake', 2, 150,
      'assets/images/images/image_example_03.png', 'An BBQ Su Van Hanh'),
  FoodInfoModel('Salad', 'Lemony White Bean Salad with Prosciutto', 5, 1000,
      'assets/images/images/image_example_04.png', 'An BBQ Su Van Hanh'),
  FoodInfoModel('Beef Ribs', 'USDA beef ribs finger', 5, 99,
      'assets/images/images/image_example.png', 'An BBQ Su Van Hanh'),
  FoodInfoModel('Beef Ribs', 'USDA beef ribs finger', 5, 99,
      'assets/images/images/image_example.png', 'An BBQ Su Van Hanh'),
  FoodInfoModel('Beef Ribs', 'USDA beef ribs finger', 5, 99,
      'assets/images/images/image_example.png', 'An BBQ Su Van Hanh'),
];

final List<FoodInfoModel> foodInfoListMockData2 = [
  FoodInfoModel('Beef Ribs', 'USDA beef ribs finger', 5, 100,
      'assets/images/images/food_01.png', 'An BBQ Su Van Hanh',
      price: '389.000 VND',
      sauces: [
        SauceInfoModel(name: 'Galbi sauce', color: 0xFF887C72),
        SauceInfoModel(name: 'Obathan sauce', color: 0xFFA04E3F),
      ]),
  FoodInfoModel('Beef Bacon', 'USDA beef bacon', 3, 33,
      'assets/images/images/food_02.png', 'An BBQ Su Van Hanh',
      price: '389.000 VND',
      sauces: [
        SauceInfoModel(name: 'Galbi sauce', color: 0xFF887C72),
        SauceInfoModel(name: 'Obathan sauce', color: 0xFFA04E3F),
      ]),
  FoodInfoModel('Beef Stake', 'USDA beefstake', 2, 150,
      'assets/images/images/food_03.png', 'An BBQ Su Van Hanh',
      price: '389.000 VND',
      sauces: [
        SauceInfoModel(name: 'Galbi sauce', color: 0xFF887C72),
        SauceInfoModel(name: 'Obathan sauce', color: 0xFFA04E3F),
      ]),
  FoodInfoModel('Salad', 'Lemony White Bean Salad with Prosciutto', 5, 1000,
      'assets/images/images/food_04.png', 'An BBQ Su Van Hanh',
      price: '389.000 VND',
      sauces: [
        SauceInfoModel(name: 'Galbi sauce', color: 0xFF887C72),
        SauceInfoModel(name: 'Obathan sauce', color: 0xFFA04E3F),
      ]),
  FoodInfoModel('Beef Ribs', 'USDA beef ribs finger', 5, 99,
      'assets/images/images/food_01.png', 'An BBQ Su Van Hanh',
      price: '389.000 VND',
      sauces: [
        SauceInfoModel(name: 'Galbi sauce', color: 0xFF887C72),
        SauceInfoModel(name: 'Obathan sauce', color: 0xFFA04E3F),
      ]),
  FoodInfoModel('Beef Ribs', 'USDA beef ribs finger', 5, 99,
      'assets/images/images/food_02.png', 'An BBQ Su Van Hanh',
      price: '389.000 VND',
      sauces: [
        SauceInfoModel(name: 'Galbi sauce', color: 0xFF887C72),
        SauceInfoModel(name: 'Obathan sauce', color: 0xFFA04E3F),
      ]),
  FoodInfoModel('Beef Ribs', 'USDA beef ribs finger', 5, 99,
      'assets/images/images/food_02.png', 'An BBQ Su Van Hanh',
      price: '389.000 VND',
      sauces: [
        SauceInfoModel(name: 'Galbi sauce', color: 0xFF887C72),
        SauceInfoModel(name: 'Obathan sauce', color: 0xFFA04E3F),
      ]),
];
