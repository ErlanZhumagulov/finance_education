import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(PlanBuyScreen());
}

class PlanBuyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FinancialLiteracyApp(),
      ),
    );
  }
}

class Item {
  String name;
  double price;

  Item(this.name, this.price);
}

class _FinancialLiteracyAppState extends State {
  // Бюджет
  double budget = 1000;

  // Списки покупок для каждой категории
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

  // Переменные для хранения суммы цен по категориям
  double toys = 0;
  double food = 0;
  double clothing = 0;
  double other = 0;

  // Переменная для хранения выбранной категории
  List<Item> selectedCategoryList = [];

  // Контроллеры для текстовых полей
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Вычисляем сумму цен для каждой категории
    updateCategoryPrices();
  }

  // Метод для обновления суммы цен по категориям
  void updateCategoryPrices() {
    setState(() {
      toys = calculateTotalPrice(toysList);
      food = calculateTotalPrice(foodList);
      clothing = calculateTotalPrice(clothingList);
      other = calculateTotalPrice(otherList);
    });
  }

  // Метод для вычисления суммы цен в списке покупок
  double calculateTotalPrice(List<Item> itemList) {
    double totalPrice = 0;
    for (var item in itemList) {
      totalPrice += item.price;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    double totalSpent = toys + food + clothing + other;
    double remainingBudget = budget - totalSpent;

    // Проверяем, превышен ли бюджет
    bool isBudgetExceeded = totalSpent > budget;

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Расходы по категориям',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                ? 'Бюджет превышен на: ${totalSpent - budget} руб'
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
                    PieChartSectionData(
                      color: Colors.blue,
                      value: toys,
                      title: 'Игрушки',
                      radius: 30,
                    ),
                    PieChartSectionData(
                      color: Colors.green,
                      value: food,
                      title: 'Еда',
                      radius: 30,
                    ),
                    PieChartSectionData(
                      color: Colors.orange,
                      value: clothing,
                      title: 'Одежда',
                      radius: 30,
                    ),
                    PieChartSectionData(
                      color: Colors.red,
                      value: other,
                      title: 'Другое',
                      radius: 30,
                    ),
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
              buildCategoryButton('Игрушки'),
              buildCategoryButton('Еда'),
              buildCategoryButton('Одежда'),
              buildCategoryButton('Другое'),
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
            'Добавить объект в выбранную категорию:',
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
              // Проверяем, выбрана ли какая-либо категория
              if (selectedCategoryList.isNotEmpty &&
                  nameController.text.isNotEmpty &&
                  priceController.text.isNotEmpty) {
                // Добавляем объект в выбранную категорию
                setState(() {
                  selectedCategoryList.add(Item(
                    nameController.text,
                    double.parse(priceController.text),
                  ));
                  // Обновляем сумму цен по категории
                  updateCategoryPrices();
                });
                // Очищаем поля ввода
                nameController.clear();
                priceController.clear();
              }
            },
            child: Text('Добавить'),
          ),
        ],
      ),
    );
  }

  // Метод для построения кнопки выбора категории
  Widget buildCategoryButton(String category) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedCategoryList = getCategoryList(category);
        });
      },
      child: Text(category),
    );
  }

  // Метод для получения списка покупок выбранной категории
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

class FinancialLiteracyApp extends StatefulWidget {
  @override
  _FinancialLiteracyAppState createState() => _FinancialLiteracyAppState();
}

