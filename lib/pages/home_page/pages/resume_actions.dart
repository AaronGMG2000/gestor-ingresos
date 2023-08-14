import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class ResumeActions extends StatelessWidget {
  const ResumeActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gutter(),
          AutoSizeText(
            'Balance',
            maxLines: 1,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.8)),
          ),
          const Text(
            'Q 1,953.85',
            maxLines: 1,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _Item('Estado', Icons.account_balance_wallet_outlined),
              _Item('Ingresos', Icons.arrow_downward_outlined),
              _Item('Egresos', Icons.arrow_upward_outlined),
              _Item('Categorias', Icons.category_outlined),
            ],
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String title;
  final IconData icon;
  const _Item(this.title, this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, top: 20),
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration:
                    BoxDecoration(color: Colors.black.withOpacity(0.5), borderRadius: BorderRadius.circular(10)),
                child: Icon(icon, color: Colors.white),
              ),
            ),
          ),
          const Gutter(),
          AutoSizeText(
            title,
            maxLines: 1,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }
}
