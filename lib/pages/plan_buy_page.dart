import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class FinancialLiteracyApp extends StatefulWidget {
  @override
  _FinancialLiteracyAppState createState() => _FinancialLiteracyAppState();
}

class _FinancialLiteracyAppState extends State<FinancialLiteracyApp> {
  double budget = 1000;

  List<Item> toysList = [
    Item('Кукла', 25),
    Item('Машинка', 30),
    Item('Пазл', 20),
    Item('Мяч', 15),
  ];
  List<Item> foodList = [
    Item('Молоко', 40),
    Item('Хлеб', 20),
    Item('Фрукты', 50),
    Item('Овощи', 35),
  ];
  List<Item> clothingList = [
    Item('Футболка', 15),
    Item('Джинсы', 40),
    Item('Куртка', 60),
    Item('Шапка', 25),
  ];
  List<Item> otherList = [
    Item('Книга', 30),
    Item('Подарок', 50),
    Item('Аксессуары', 20),
    Item('Игрушка для домашнего животного', 45),
  ];

  double toys = 0;
  double food = 0;
  double clothing = 0;
  double other = 0;

  List<Item> selectedCategoryList = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    updateCategoryPrices();
  }

  void updateCategoryPrices() {
    setState(() {
      toys = calculateTotalPrice(toysList);
      food = calculateTotalPrice(foodList);
      clothing = calculateTotalPrice(clothingList);
      other = calculateTotalPrice(otherList);
    });
  }

  double calculateTotalPrice(List<Item> itemList) {
    return itemList.fold(0, (sum, item) => sum + item.price);
  }

  @override
  Widget build(BuildContext context) {
    double totalSpent = toys + food + clothing + other;
    double remainingBudget = budget - totalSpent;
    bool isBudgetExceeded = totalSpent > budget;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Управление финансами'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Расходы по категориям',
              style: theme.textTheme.headline6,
            ),
            SizedBox(height: 20),
            LinearProgressIndicator(
              value: totalSpent / budget,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                isBudgetExceeded ? Colors.red : Colors.blue,
              ),
            ),
            SizedBox(height: 10),
            Text(
              isBudgetExceeded
                  ? 'Превышение бюджета: ${totalSpent - budget} руб'
                  : 'Остаток бюджета: $remainingBudget руб',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1.7,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 0,
                    centerSpaceRadius: 70,
                    sections: [
                      _buildPieChartSection(Colors.blue, toys, 'Игрушки'),
                      _buildPieChartSection(Colors.green, food, 'Еда'),
                      _buildPieChartSection(Colors.orange, clothing, 'Одежда'),
                      _buildPieChartSection(Colors.red, other, 'Другое'),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Выберите категорию:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryButton('Игрушки', Icons.gamepad),
                _buildCategoryButton('Еда', Icons.fastfood),
                _buildCategoryButton('Одежда', Icons.shopping_bag),
                _buildCategoryButton('Другое', Icons.palette),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: selectedCategoryList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(selectedCategoryList[index].name),
                    subtitle:
                    Text('${selectedCategoryList[index].price} руб'),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Добавить элемент в выбранную категорию:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Название'),
            ),
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Цена'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (selectedCategoryList.isNotEmpty &&
                    nameController.text.isNotEmpty &&
                    priceController.text.isNotEmpty) {
                  setState(() {
                    selectedCategoryList.add(Item(
                      nameController.text,
                      double.parse(priceController.text),
                    ));
                    updateCategoryPrices();
                  });
                  nameController.clear();
                  priceController.clear();
                }
              },
              child: Text('Добавить'),
            ),
          ],
        ),
      ),
    );
  }

  PieChartSectionData _buildPieChartSection(Color color, double value, String title) {
    return PieChartSectionData(
      color: color,
      value: value,
      title: title,
      radius: 30,
    );
  }

  Widget _buildCategoryButton(String category, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {
        setState(() {
          selectedCategoryList = getCategoryList(category);
        });
      },
      icon: Icon(icon),
      label: Text(category),
    );
  }

  List<Item> getCategoryList(String category) {
    switch (category) {
      case 'Игрушки':
        return toysList;
      case 'Еда':
        return foodList;
      case 'Одежда':
        return clothingList;
      case 'Другое':
        return otherList;
      default:
        return [];
    }
  }
}

class Item {
  String name;
  double price;

  Item(this.name, this.price);
}
