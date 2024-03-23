import 'package:chatboat/view_model/constant.dart';
import 'package:flutter/material.dart';

class GenieHistory extends StatelessWidget {
  const GenieHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      decoration: const BoxDecoration(
        color: Color.fromARGB(246, 255, 255, 255),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 9),
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'History',
                  style: boatTextStyle(fontWeight: FontWeight.w700, size: 20),
                ),
                Container(
                  height: 30,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: bgColor),
                  child: Center(
                    child: RichText(
                      text: const TextSpan(
                        text: '1',
                        children: [TextSpan(text: '/'), TextSpan(text: '50')],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Divider(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    horizontalTitleGap: 0,
                    title: Text(
                      'Create Welcome Form',
                      style: boatTextStyle(
                          fontWeight: FontWeight.w600,
                          size: 13,
                          color: blackColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        'write code html and css and java and create form ',
                        maxLines: 2,
                        style: boatTextStyle(
                            fontWeight: FontWeight.w500,
                            size: 12,
                            color: blackColor),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            height: 35,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: radius10,
                color: whiteColor,
                border: Border.all(color: bgColor),
                boxShadow: [BoxShadow(color: greyColor)]),
            child: const Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.delete_outline),
                Text('Clear History'),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
