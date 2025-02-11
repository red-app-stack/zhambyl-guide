import 'package:flutter/material.dart';
import 'package:zhambyl_guide/views/shared/bottom_sheet.dart';
import 'package:zhambyl_guide/widgets/common/location_card.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> locations = [
    {
      "title": "Мавзолей Айша-Биби",
      "subtitle": "Тараз, Казахстан",
      "description":
          "Айша-Биби (каз. Айша бибі) — мавзолей эпохи Караханидов, XII века постройки, расположенный в селе Айша-Биби Жамбылского района Жамбылской области в 18 км от города Тараза. Является памятником архитектуры республиканского значения.\n Основание мавзолея — кубическое. По его четырём углам размещены массивные колонны. В оформлении использовались небольшие ниши, малые колонки, своды, стрельчатые арки, терракотовая облицовочная плитка. В узорах мавзолея сочетаются традиционные виды орнаментального искусства древних племён Казахстана, включающие геометрический, зооморфный и солярный мотивы, уходящие корнями в искусство андроновских и сакских племён.",
      "imagePaths": [
        "assets/locations/The-Republic-of-Kazakhstan/Zhambyl/Aisha-Bibi-Mausoleum/",
      ],
      "isLiked": true,
    },
    {
      "title": "Тектурмас",
      "subtitle": "Тараз, Казахстан",
      "description":
          "Мавзолей (кумбез) Тектурмас (каз. Тектұрмас күмбезі) — памятник архитектуры XIV—XV века, расположенный на юго-восточной окраине города Тараза на правом берегу реки Талас на вершине холма Тектурмас. Зодчий и строитель мавзолея неизвестны. Среди местных жителей мавзолей считается местом захоронения святого (аулие) Султан-Махмуд-хана. \n Здание было значительно разрушено. По фотографиям 1890-х годов мавзолей представлял собой купольное, четырёхугольное в плане сооружение из жжёного кирпича. Углы мавзолея завершались пилястрами, на стенах имелись следы штукатурки. Из декоративной отделки мавзолея была найдена лишь одна орнаментированная терракотовая плитка, судя по которой археолог Михаил Массон предположил, что мавзолей был воздвигнут в XV веке. \nВход в виде арки обращён на запад к городу Таразу.",
      "imagePaths": [
        "assets/locations/The-Republic-of-Kazakhstan/Zhambyl/Tekturmas-Mausoleum/",
      ],
      "isLiked": false,
    },
    {
      "title": "Мавзолей Бабаджи Хатун",
      "subtitle": "Тараз, Казахстан",
      "description":
          "Мавзолей Бабаджи хатун (каз. Бабажы қатын кесенесі) — мавзолей эпохи Караханидов (XII век), расположенный в селе Айша-биби Жамбылского района Жамбылской области Казахстана в 18 км от города Тараза. Автор и строители неизвестны. С 1982 года находится под охраной государства.\nЛегенда о строительстве мавзолея Бабаджи хатун непосредственно связана с легендой о строительстве мавзолея Айша-биби. Существуют 28 различных версий этой легенды. Согласно самой распространённой — Айша-биби была дочерью известного учёного и поэта XI века хакима Сулеймана Бакыргани. После его смерти она воспитывалась у шейха Айкожы. Однажды правитель Тараза Карахан Мухаммед (в честь которого возведён мавзолей Карахана в Таразе) попросил её руки, однако её воспитатель не дал согласие. Тогда она обманным путём поехала в Тараз. К несчастью, её жених никогда больше не смог её увидеть, так как она погибла на берегу реки Аса от укуса змеи, спрятавшейся в головном уборе. Скорбя по смерти девушки, Карахан воздвиг мавзолей сказочной красоты на месте её гибели. Попутчица Айша-биби Бабаджи хатун стала хранительницей мавзолея и после смерти была похоронена в 20 шагах от Айша-биби в мавзолее Бабаджи хатун.\nМавзолей был исследован в 1897 году Василием Каллауром, в 1938—1939 годах — Александром Бернштамом, в 1953 году — Толеу Басеновым.\nВ 1982 году памятник был включён в список памятников истории и культуры Казахской ССР республиканского значения и взят под охрану государства.",
      "imagePaths": ["assets/locations/The-Republic-of-Kazakhstan/Zhambyl/Babaji-Khatun-Mausoleum/"],
      "isLiked": false,
    },
    {
      "title": "Мавзолей Карахана",
      "subtitle": "Тараз, Казахстан",
      "description":
          "Мавзолей Карахана (мавзолей Аулие-ата) (каз. Қарахан кесенесі) — памятник архитектуры XI века в казахстанском городе Таразе. Сооружён над могилой одного из представителей династии Караханидов. \n По местным устным преданиям, мавзолей сооружён над могилой Карахана, основателя династии Караханидов, который первым из тюрков принял ислам. \n«Абду-р-Рахим-Баб. Его сын Ша-Хасан, по произванию Кылыдж-Карахан… Его сын Абдул-Халык-хан. Могила его в Отраре (к югу от города Туркестана, а могила Аулие-ата — на реке Таласе. У Аулие-ата второй сын был по имени Касым-хан-Баба, дед его — Кыран-шейх, зять его Махмуд-хан-шейх, а дочь Биби-айша, могила которой находится в двух ташах от гор. Аулие-Ата».\nВ 1905 году (по другим данным в 1920 году) он был разрушен до основания и перестроен и при сохранении конструкционного принципа утратил первоначальное архитектурно-декоративное убранство. Внутри мавзолея сохранилось ступенчатое надгробие. Строительство финансировал ташкентский ишан Саид Бакханов.",
      "imagePaths": ["assets/locations/The-Republic-of-Kazakhstan/Zhambyl/Karahan-Mausoleum/"],
      "isLiked": false,
    },
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Гид по Жамбылской области",
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Category Tabs
            Row(
              children: ["Тараз", "Каратау", "Жанатас", "Шу"]
                  .map(
                    (e) => Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          print("$e tapped");
                        },
                        splashColor: theme.colorScheme.primary.withOpacity(0.2),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          child: Chip(
                            label: Text(
                              e,
                              style: TextStyle(
                                color: e == "Тараз" ? theme.colorScheme.surface : theme.colorScheme.onSurface,
                              ),
                            ),
                            backgroundColor: e == "Тараз" ? theme.colorScheme.primary : theme.colorScheme.surfaceDim,
                            labelPadding: EdgeInsets.symmetric(
                              horizontal: (e.length <= 4)
                                  ? 20
                                  : (e.length <= 7)
                                      ? 8
                                      : 4,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16),

            // Locations Grid
            Expanded(
              child: GridView.builder(
                itemCount: locations.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final location = locations[index];
                  return LocationCard(
                    location: location,
                    onTap: () {
                      _showLocationBottomSheet(context, location);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLocationBottomSheet(BuildContext context, Map<String, dynamic> location) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => TravelBottomSheet(location: location),
    );
  }
}
