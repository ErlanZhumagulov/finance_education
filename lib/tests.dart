import 'guides.dart';
import 'models/TaskModel.dart';
import 'models/TestModel.dart';

List<Test> tests = [
  // Test(
  //   guideId: -1,
  //   title: "Квартирный вопрос",
  //   tasks: [
  //     Task(question: "Кто живет на дне океана?", ans: 1, answers: [
  //       "губка для матья посуды",
  //       "губка боб",
  //       "губная гармошка"
  //     ]),
  //     Task(question: "Кто НЕ живет на дне океана?", ans: 0, answers: [
  //       "губка для матья посуды",
  //       "губка боб",
  //       "патрик"
  //     ]),
  //   ]
  // ),
  Test(
      guideId: 0,
      title: guides[0].title,
      tasks: [
        Task(question: "Выбери из приведенных ниже услуг ту, которая НЕ относится к финансовым ", ans: 2, answers: [
          "банковские услуги",
          "услуги по пенсионному накоплению",
          "консультационные услуги"
        ]),
        Task(question: "Относится ли к финансовым услугам покупка и продажа ценных бумаг?", ans: 0, answers: [
          "да",
          "нет"
        ]),
        Task(question: "Что такое финансовая организация?", ans: 3, answers: [
          "организация, раздающая деньги",
          "хранилище финансов",
          "организация выпускающая денежные знаки",
          "организация, оказывающая финансовые услуги"
        ]),
        Task(question: "Может ли финансовая организация действовать без государственного разрешения?", ans: 1, answers: [
          "да",
          "нет"
        ]),
      ]
  ),
  Test(
    guideId: 1,
    title: guides[1].title,
    tasks: [
      Task(question: "Кто организует спрос и предложение различных ценных бумаг и способствует заключению соответствующих сделок?",
           ans: 2,
           answers: [
              "кредитный союз",
             "инвестиционная компания",
             "фондовая биржа"
      ]),
      Task(question: "Компания, покупающая или продающая ценные бумаги по поручению клиентов:",
          ans: 2,
          answers: [
            "инвестиционная компания",
            "благотворительный фонд",
            "брокерская компания",
            "кредитный союз"
          ]),
      Task(question: "Место, где происходит свободная купля-продажа иностранной валюты?",
          ans: 1,
          answers: [
              "фондовая биржа",
              "валютная биржа"
          ]),
      Task(question: "Что из перечисленного НЕ является финансовой организацией?",
          ans: 2,
          answers: [
            "банк",
            "дилерская компания",
            "сеть магазинов 'Пятерочка'"
          ]),
    ]
  ),


  Test(
    guideId: 2,
    title: guides[2].title,
    tasks: [
      Task(question: "Вложение с целью прибыли:",
          ans: 0,
          answers: [
            "инвестиция",
            "сбережение"
          ]
      ),
      Task(question: "Какое из утверждений верно?",
          ans: 0,
          answers: [
            "сбережение - это вклад, процент от которых равен или ненамного больше инфляции",
            "инвестиции - это накапливаемая часть доходов с целью дальнейшего использования"
          ]
      ),
      Task(question: "Чем сбережения отличаются от инвестиций?",
          ans: 1,
          answers: [
            "ничем, кроме названия",
            "инвестиция - для при были, а сбережение - на 'чёрный день'",
            "инвестиция - это вложение в драгоценные металлы"
          ]
      ),
      Task(question: "Куда граждане чаще всего обращаются, чтобы сделать сбережение?",
          ans: 3,
          answers: [
            "в лизинговую компанию",
            "в благотворительный фонд",
            "на валютную биржу",
            "в банк"
          ]
      ),
    ]
  )
];