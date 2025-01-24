import 'package:flutter/material.dart';

import '../models/articleModel.dart';
import '../screens/article_page.dart';

class Newslist extends StatelessWidget {
  const Newslist({
    super.key,
    required this.articlemodel,
  });
  final Articlemodel articlemodel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ArticlePage(blogUrl: articlemodel.url!,);
          }),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: articlemodel.image != null && articlemodel.image!.isNotEmpty
                  ? Image.network(
                      articlemodel.image!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/images/error.png');
                },
                    )
                  : Image.asset('assets/images/error.png' ,fit: BoxFit.cover,),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              articlemodel.tittle ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color.fromARGB(255, 96, 96, 96),
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              articlemodel.subTittle ?? ' NO Content To Show.....',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color.fromARGB(255, 143, 140, 140),
                fontSize: 14,
              ),
            ),

            const Divider(height: 20,thickness: 2,indent: 15,endIndent: 15,)
          ],
        ),
      ),
    );
  }
}
