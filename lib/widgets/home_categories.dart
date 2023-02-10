import 'package:flutter/material.dart';

class CategoryGridView extends StatelessWidget {
  final List<String> icons;

  const CategoryGridView({super.key, required this.icons});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: GridView.count(
        crossAxisCount: 2,
        scrollDirection: Axis.horizontal,
        children: List.generate(10, (index) {
          String category = '';
          switch (index) {
            case 0:
              category = "Viễn tưởng";
              break;
            case 1:
              category = "Cổ tích";
              break;
            case 2:
              category = "Giật gân";
              break;
            case 3:
              category = "Tình cảm";
              break;
            case 4:
              category = "Tâm lý";
              break;
            case 5:
              category = "Nghệ thuật";
              break;
            case 6:
              category = "Khoa học";
              break;
            case 7:
              category = "Lịch sử";
              break;
            case 8:
              category = "Kinh dị";
              break;
            case 9:
              category = "Phiêu lưu";
              break;
          }
          return InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: AssetImage(icons[index]),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category,
                    style: const TextStyle(fontSize: 9),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
