import 'package:cafe_buzzybee/src/core/config/assets.dart';
import 'package:flutter/material.dart';

//height
SizedBox kSizedBox2 = const SizedBox(
  height: 2,
);

SizedBox kSizedBox5 = const SizedBox(
  height: 5,
);

SizedBox kSizedBox8 = const SizedBox(
  height: 8,
);
SizedBox kSizedBox15 = const SizedBox(
  height: 15,
);

SizedBox kSizedBox20 = const SizedBox(
  height: 20,
);

SizedBox kSizedBox30 = const SizedBox(
  height: 30,
);

SizedBox kSizedBox45 = const SizedBox(
  height: 45,
);

//width

SizedBox kSizedBoxW8 = const SizedBox(
  width: 8,
);

SizedBox kSizedBoxW10 = const SizedBox(
  width: 10,
);

SizedBox kSizedBoxW15 = const SizedBox(
  width: 15,
);

SizedBox kSizedBoxW20 = const SizedBox(
  width: 20,
);

final List<Map<String, dynamic>> croissantItem = [
  {
    'name': 'Nutella',
    'description': 'Croissant filled with rich and creamy Nutella',
    'image': Assets.nutellaCroissant,
    'price': 12.98,
    'unit': 2,
  },
  {
    'name': 'Pistachios',
    'description': 'Crispy croissants, pistachio cream and chopped pistachios.',
    'image': Assets.pistachiosCroissant,
    'price': 18.29,
    'unit': 2,
  },
  {
    'name': 'Raspberry',
    'description':
        'A sweet, flaky pastry with a raspberry filling and a red sugar topping.',
    'image': Assets.raspberryCroissant,
    'price': 8.99,
    'unit': 1,
  },
  {
    'name': 'Blueberry',
    'description':
        'Croissant with the sweet and tangy flavor of fresh blueberries.',
    'image': Assets.blueberryCroissants,
    'price': 35.78,
    'unit': 3,
  },
  {
    'name': 'Sandwich',
    'description':
        'Loaded with classic ingredients like turkey, onion and honey mustard potato chips.',
    'image': Assets.sandwichCroissant,
    'price': 19.15,
    'unit': 2,
  },
  {
    'name': 'Filled Round',
    'description':
        'Filled with chocolate custard cream, topped with chocolate and chocolate crisp pearls.',
    'image': Assets.filledRoundCroissant,
    'price': 50.12,
    'unit': 5,
  },
  {
    'name': 'Red Velvet',
    'description':
        'A delicious croissant with mascarpone cream and strawberry puree.',
    'image': Assets.redVelvetCroissant,
    'price': 10.12,
    'unit': 1,
  },
  {
    'name': 'Cookie',
    'description':
        'Cookie croissants, buttery croissants stuffed with chocolate chip cookie dough.',
    'image': Assets.cookieCroissant,
    'price': 25.09,
    'unit': 3,
  },
  {
    'name': 'Strawberry',
    'description':
        'Filled with an irresistible creamy custard and strawberries.',
    'image': Assets.strawberryCroissant,
    'price': 11.09,
    'unit': 1,
  },
];

final List<Map<String, dynamic>> coffeeItem = [
  {
    'name': 'Cappuccino',
    'description':
        'A cappuccino is the perfect balance of espresso, steamed milk and foam.',
    'image': Assets.cappuccino,
    'price': 9.99,
    'unit': 1,
  },
  {
    'name': 'Pistachio',
    'description':
        'The flavors of roasted coffee beans with the rich, nutty taste of pistachios.',
    'image': Assets.pistachioCoffee,
    'price': 13.09,
    'unit': 1,
  },
  {
    'name': 'Coffee',
    'description':
        'With a creamy texture and rich coffee flavour, these delicious coffee milkshakes.',
    'image': Assets.coffeeMilkshake,
    'price': 8.99,
    'unit': 1,
  },
  {
    'name': 'Frappuccino',
    'description':
        'Caramel flavour syrup combined with coffee and milk, topped with whipped cream.',
    'image': Assets.frappuccino,
    'price': 38.78,
    'unit': 3,
  },
  {
    'name': 'Green Tea',
    'description':
        'Green tea"s delightfully delicate flavor is due to its minimal oxidation.',
    'image': Assets.greenTeaCoffee,
    'price': 7.15,
    'unit': 1,
  },
  {
    'name': 'Hot Chocolate',
    'description': 'The hot chocolate is as rich as it is dark.',
    'image': Assets.hotChocolate,
    'price': 45.09,
    'unit': 4,
  },
  {
    'name': 'Iced Coffee',
    'description':
        'Iced coffee is brewed hot like regular coffee, and then cooled down.',
    'image': Assets.icedCoffee,
    'price': 10.12,
    'unit': 1,
  },
  {
    'name': 'Iced Strawberry',
    'description': 'Sweet strawberry syrup, bold espresso and creamy milk.',
    'image': Assets.icedStrawberryCoffee,
    'price': 17.99,
    'unit': 2,
  },
  {
    'name': 'Caramel',
    'description':
        'A coffee drink with a rich aroma and a creamy, sweet caramel flavor',
    'image': Assets.caramelCoffee,
    'price': 20.25,
    'unit': 2,
  },
];

final List<Map<String, dynamic>> iceCreamItem = [
  {
    'name': 'Blue Berry',
    'description': 'A creamy dessert made with blueberries, milk, and cream.',
    'image': Assets.blueBerryIceCream,
    'price': 15.98,
    'unit': 2,
  },
  {
    'name': 'Strawberry',
    'description':
        'A frozen dessert with a sweet, fruity flavor and a pink or light red color.',
    'image': Assets.strawberryIceCream,
    'price': 25.09,
    'unit': 3,
  },
  {
    'name': 'Chocolate',
    'description': 'Made with milk, cream, sugar, and cocoa powder.',
    'image': Assets.chocolateIceCream,
    'price': 25.89,
    'unit': 5,
  },
  {
    'name': 'Mango',
    'description': 'Dessert made with mango, milk, cream, and sugar.',
    'image': Assets.mangoIceCream,
    'price': 18.78,
    'unit': 3,
  },
  {
    'name': 'Pistachio',
    'description':
        'A creamy, sweet frozen dessert made with pistachio nuts or flavoring.',
    'image': Assets.pistachioIceCream,
    'price': 29.12,
    'unit': 2,
  },
  {
    'name': 'Red Velvet',
    'description': 'A rich and creamy ice cream with a red velvet flavor.',
    'image': Assets.redVelvetIceCream,
    'price': 10.12,
    'unit': 1,
  },
  {
    'name': 'Butter Scotch',
    'description':
        'A rich and creamy ice cream flavor made with butterscotch sauce, cream, and milk.',
    'image': Assets.butterScotchIceCream,
    'price': 5.29,
    'unit': 1,
  },
  {
    'name': 'Orange',
    'description': 'Made with fresh squeezed orange juice.',
    'image': Assets.orangeIceCream,
    'price': 5.15,
    'unit': 1,
  },
  {
    'name': 'Vanilla',
    'description': 'Made with milk, cream, sugar, and vanilla extract.',
    'image': Assets.vanillaIceCream,
    'price': 9.09,
    'unit': 1,
  },
];

final List<Map<String, dynamic>> signatureItem = [
  {
    'name': 'Waffle',
    'description':
        'Waffles with airy interiors and a rich, vanilla-tinged buttermilk flavor.',
    'image': Assets.crispyWaffle,
    'price': 11.98,
    'unit': 1,
  },
  {
    'name': 'Almond',
    'description':
        'A crescent-shaped pastry that"s buttery, flaky, and filled with almond cream.',
    'image': Assets.almondCroissant,
    'price': 21.29,
    'unit': 2,
  },
  {
    'name': 'Lotus Biscoff',
    'description': 'Pastry filled with caramelized biscuit spread.',
    'image': Assets.lotusBiscoffCroissant,
    'price': 18.99,
    'unit': 1,
  },
  {
    'name': 'Kitkat',
    'description': 'A waffle topped with crushed KitKat pieces.',
    'image': Assets.kitkatWaffle,
    'price': 13.12,
    'unit': 1,
  },
  {
    'name': 'Dalogna',
    'description':
        'Made from whipped, sweetened instant coffee beat into a thick foam.',
    'image': Assets.dalognaCoffee,
    'price': 27.15,
    'unit': 3,
  },
  {
    'name': 'Grape',
    'description': 'Sweet taste and grape juice.',
    'image': Assets.grapeIceCream,
    'price': 12.99,
    'unit': 2,
  },
  {
    'name': 'Almond',
    'description': 'Nutty flavor, a buttery taste, or a smooth finish.',
    'image': Assets.almondCoffee,
    'price': 15.99,
    'unit': 2,
  },
  {
    'name': 'Mango',
    'description':
        'A sweet pastry made with a flaky croissant and a filling of fresh mango.',
    'image': Assets.mangoCroissant,
    'price': 25.09,
    'unit': 3,
  },
  {
    'name': 'Raspberry',
    'description': 'Made with fresh or frozen raspberries and cream.',
    'image': Assets.raspberryIceCream,
    'price': 10.09,
    'unit': 1,
  },
];

final List<Map<String, dynamic>> waffleItem = [
  {
    'name': 'Nutella',
    'description':
        'Crispy on the outside, fluffy on the inside, and loaded with lots of chocolaty Nutella.',
    'image': Assets.nutellaWaffle,
    'price': 38.78,
    'unit': 3,
  },
  {
    'name': 'Pistachio',
    'description': 'Blend finely chopped American pistachios with waffle mix.',
    'image': Assets.pistachioWaffle,
    'price': 28.15,
    'unit': 2,
  },
  {
    'name': 'Red Velvet',
    'description':
        'Topped with a cream cheese glaze, whipped cream, and fresh strawberries.',
    'image': Assets.redVelvetWaffle,
    'price': 30.99,
    'unit': 3,
  },
  {
    'name': 'Blue Berry',
    'description':
        'Crispy on the outside and fluffy in the middle, super delicious with the added blueberries.',
    'image': Assets.blueBerryWaffle,
    'price': 20.95,
    'unit': 2,
  },
  {
    'name': 'Bubble',
    'description':
        'Bubble waffles have a honeycomb-like texture with round bubbles.',
    'image': Assets.bubbleWaffle,
    'price': 12.29,
    'unit': 1,
  },
  {
    'name': 'Chocolate',
    'description':
        'Waffle discs sandwiched with Dark Chocolate Ganache and dipped with Milk chocolate.',
    'image': Assets.chocolateWaffle,
    'price': 10.99,
    'unit': 1,
  },
  {
    'name': 'Raspberry',
    'description': 'Made with whole wheat flour and raspberries.',
    'image': Assets.raspberryWaffle,
    'price': 10.12,
    'unit': 1,
  },
  {
    'name': 'Strawberry',
    'description':
        'Fluffy on the inside, then topped with whipped cream and strawberry syrup.',
    'image': Assets.strawberryWaffle,
    'price': 12.59,
    'unit': 1,
  },
  {
    'name': 'Pumpkin',
    'description':
        'Made with pumpkin puree and warm spices, fluffy and packed with pumpkin spice flavor.',
    'image': Assets.pumpkinWaffle,
    'price': 35.12,
    'unit': 4,
  },
];

final Map<String, List<Map<String, dynamic>>> menuItems = {
  'Signature': signatureItem,
  'Croissant': croissantItem,
  'Waffle': waffleItem,
  'Coffee': coffeeItem,
  'Ice cream': iceCreamItem,
};

final menuItem = [
  {'text': 'Signature', 'image': Assets.signature},
  {'text': 'Croissant', 'image': Assets.croissant},
  {'text': 'Waffle', 'image': Assets.waffle},
  {'text': 'Coffee', 'image': Assets.coffee},
  {'text': 'Ice cream', 'image': Assets.iceCream},
];
