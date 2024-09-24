import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  const CardBody({
    super.key,
    required this.item,
    required this.handleDelete,
    required this.index,
  });

  final item;
  final Function handleDelete;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: index % 2 == 0
            ? const Color(0xffDFDFDF)
            : const Color.fromARGB(255, 167, 228, 215),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xff4B4B4B),
              ),
            ),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  return handleDelete(item.id);
                }
              },
              child: const Icon(
                Icons.delete_outline_rounded,
                size: 30,
                color: Color(0xff4B4B4B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
