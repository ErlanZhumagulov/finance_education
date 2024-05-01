import 'models/GuideModel.dart';

List<Guide> guides = [
  Guide(
  id: 0,
  title: "Банковская и налоговая системы",
  content: [{"p":"В повседневной жизни каждый человек так или иначе сталкивается с работой финансовых организаций."},
      {"p":"Финансовая организация - это специальная организация, которая на основании государственного разрешения (его называют лицензией) предоставляет различного рода услуги, связанные с использованием и перемещением денежных средств от одного клиента к другому."},
      {"p":"Иначе говоря, финансовые организации - это организации, которые связывают финансовые услуги."},
      {"p":"К финансовым услугам относятся: банковские и страховые услуги, услуги по пенсионному накоплению, покупка и продажа ценных бумаг и многое другое."},
    {"p":"Каждый гражданин взаимодействует с финансовыми организациями, в частности с целью: открытия вкладов в банке, оформления банковских карт, страхования своего имущества или здоровья и т.д."},
  ],
  blocked: false,
  status: "not readed"
  ),
  Guide(
  id: 1,
  title: "Виды финансовых организаций",
  content: [{"p":"Финансовые организации в качестве основной цели своей деятельности рассматривают привлечение свободных денежных средств граждан и предоставление денежных средств в долг тем, кто в них нуждается"},
      {"p":"К финансовым организациям относят: банки, страховые компании, пенсионные фонды, кредитные союзы, инвестиционные фонды, компании по доверительному управлению средствами инвесторов, брокерские компании, дилерские компнии, фондовые биржи."},
      { "p":"Рассмотрение деятельности финансовых организаций мы начнём с банков, ведь среди населения наиболее востребованы услуги именно этих финансовых организаций"},
      {"p":"К основной деятельности банков относят: кредитные услуги (предоставление кредитов на различные цели), расчётные операции (осуществление необходимых платежей по поручению держателей, вкладчиков и т. д.), кассовые операции (прием и выдача денежных средств и ценностей через операционную кассу), комиссионные операции (выдача клиентам банка поручений по операциям, связанным с куплей-продажей), курсовые операции (покупка и продажа иностранной вылюты и ценных бумаг), финансовые операции."},
      {"p":"Клиринговые учреждения дают своим клиентам гарантии своевременного проведения расчетов, передачи расчётно-денежных документов"},
      {"p":"Лизинговая компания приобретает в собственность конкретное имущество и передаёт его в пользование третьему лицу на длительный срок за плату. При этом у получателя имущества есть возможность выкупить данное имущество, расплачиваясь за него частями (в рассрочку)."},
      {"p":"В зависимости от выполняемой роли и предназначения аккумуляции сбережений населения небанковские кредитно-финансовые организации могут быть: страховыми компаниями, пенсионными и благотворительными фондами, кредитными союзами, инвестиционными компаниями, ссудо-сберегательными ассоциациями, финансовыми компаниями."},
      {"p":"Страховые компании формируют за счёт предприятий, организаций и населения денежные фонды, средства которых в основном предназначены для выплат страховых возмещений учерба при наступлении определённых событий."},
      {"p":"Пенсионные фонды призваны организовывать сбор и накопление денежных средств, предназначенных для пенсионного обеспечения граждан. По форме собственности пенсионные фонды могут быть негосударственными и государственными."},
      {"p":"Благотворительные фонды обычно на связаны с коммерческой деятельностью. Они, как привило, направлены на решение гуманитарных проблем и поддержку социально значимых инициатив. Созданные благотворительные фонды могут фонансировать образование (университеты, колледжи, школы), научно-исследовательские институты, центры искусств, церкви, различные общественные организации, а также оказывать помощь гражданам, попавшим в трудную жизненную ситуацию."},
      {"p":"Кредитные союзы создаются как кооперативные организации, которые накапливают сбережения своих членов и обеспечивают взаимное кредитование. объединение граждан в такие союзы может присходить по профессиональным, религиозным, территориальным или друким признакам."},
      {"p":"Инвестиционные компании выделяются тем, что, выпуская собственные ценные бумаги, они накапливают денежные средства населения и других инвесторов, которые пускают в работу."},
      {"p":"Ссудо-сберегательные ассоциации - это организации, основной деятельностью которых является привлечение денежных средств населения с целью долгосрочного кредитования, покупки или строительсва жилья."},
      {"p":"Финансовые компании специализируются на кредитовании продажи потребительских товаров. Кроме того, они могут быть созданы как отдельные структурные подразделения, филиалы, дочерние предприятия банков, страховых компаний и промышленных фирм - производителей потребительских товаров. Финансовые компании могут применять различные схемы кредитования, в некоторых случаях они могут осуществлять лизинговые операции."},
      {"p":"Компании, занимающиеся финансовой деятельностью на правах посредника, называются брокерскими"},
      {"p":"Брокерская компания - это компания, которая покупает или продаёт ценные бумаги по поручениям клиентов. За свой счёт брокерская компания сделок не заключает."},
      {"p":"Следующей разновидностью финансовых организаций являются дилерские компании. Дилеры - это компании или физические лица, являющиеся представителями между производителем и потребителем"},
      {"p":"Дилер в сфере фондового и валютного рынка рассматривается как коммерческая или государственная организация, оформляющая куплю-продажу акций от своего имени и за свой счёт."},
      {"p":"Фондовая биржа - это организация, которая осуществляет деятельность по проведению торнов разнообразными ценными бумагами. Фондовая биржа организует спрос и предложение различных ценных бумаг, способствует заключению соответствующих сделок."},
      {"p":"Валютная биржа - это место, где осуществляется свободная купля-продажа иностранной валюты."},
    ],
    blocked: false,
    status: "not readed"
),
  Guide(
      id: 2,
      title: "Как увеличить доход с использованием финансовых организаций",
      content: [{"p":"Финансовые организации используют множество инструментов управления и приумножения средств граждан."},
        {"p":"Одним из таких инструментов является инвестирование свободных денежных средств населения. Инвестиции - это размещение капитала с целью получения прибыли."},
        {"p":"Помимо инвестиций гражнане делают сбережения, накапливаемые части денежных доходов населения, предназначенные для удовлетворения их потребностей в будущем."},
        { "p":"Сбережения откладываются с какой-то целью, обычно это покупка какой-нибудь вещи, машины, недвижимости. Целью также является создание своеобразной 'подушки безопасности' на чёрный день."},
        { "p":"Для того, чтобы сберегать свои денежные средства, граждане чаще всего обращаются в банк. Размещение личных финансов на счетах помогает сберегать денежные средства, а размещение их на вкладах позволяет получить процент по вкладу, и это является дополнительным доходом. Стоит отметить, что сбережения могут приносить проценты, но если эти проценты не перекрывают инфлящию или незначительно больше неё, то они всё ещё являются сбережениями, т. е. не приносят дополнительного дохода."},
        { "p":"Иногда для целей сбережения используют вложения в драгоценные металлы, которые предлагают банки или другие финансовые организации."},
        {"p":"Инвестиции, в отличие от сбережений, предназначены не только для сохранения, но и для приумножения отложенных денежных средств. Они всегда связаны с вложением средств, основанным на риске."},
        { "p":"Инвестиции производятся для того, чтобы получать регулярную прибыль от использования этих средств. Перед тем, как сделать инвестиции, нужно всегда оценивать риски."},
      ],
      blocked: false,
      status: "not readed"
  )
];