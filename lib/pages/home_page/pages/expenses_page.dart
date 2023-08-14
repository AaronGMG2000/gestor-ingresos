import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestor_ingresos/services/extensions.dart';
import 'package:gestor_ingresos/widgets/index.dart';

class ExpensesPage extends StatelessWidget {
  const ExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DragContainer(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: AutoSizeText(
            'Expenses',
            maxLines: 1,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        const Row(
          children: [
            _Item(title: 'Comida', icon: Icons.fastfood, amount: 100, backgroundColor: Colors.red),
            _Item(title: 'Ropa', icon: Icons.shopping_bag, amount: 100, backgroundColor: Colors.blue),
            _Item(title: 'Transporte', icon: Icons.directions_bus, amount: 100, backgroundColor: Colors.green),
            _Item(title: 'Otros', icon: Icons.more_horiz, amount: 100, backgroundColor: Colors.orange)
          ],
        ).inScrollH,
        const SizedBox(height: 25),
        const Align(
          alignment: Alignment.centerLeft,
          child: AutoSizeText(
            'Ingresos',
            maxLines: 1,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        const Row(
          children: [
            _Item(title: 'Salario', icon: Icons.money, amount: 100, backgroundColor: Colors.green),
            _Item(title: 'Ventas', icon: Icons.shopping_bag, amount: 100, backgroundColor: Colors.blue),
            _Item(title: 'depositos', icon: Icons.directions_bus, amount: 100, backgroundColor: Colors.red),
            _Item(title: 'Otros', icon: Icons.more_horiz, amount: 100, backgroundColor: Colors.orange),
          ],
        ).inScrollH,
      ],
    );
  }
}

class _Item extends StatelessWidget {
  final String title;
  final IconData icon;
  final double amount;
  final Color backgroundColor;
  const _Item({
    Key? key,
    required this.title,
    required this.icon,
    required this.amount,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
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
                  decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(10)),
                  child: Icon(icon, color: Colors.white),
                ),
              ),
            ),
            const Gutter(),
            const AutoSizeText(
              'Item',
              maxLines: 1,
              style: TextStyle(fontSize: 14),
            ),
            AutoSizeText(
              'Q ${amount.toStringAsFixed(2)}',
              maxLines: 1,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
