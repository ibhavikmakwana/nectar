import 'package:flutter/material.dart';
import 'package:nectar/values/base_colors.dart';
import 'package:nectar/widgets/buttons/nectar_button.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
          style: const TextStyle(
            color: BaseColors.gray1,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        child: Container(
          color: BaseColors.grayishLimeGreen,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    _CategoryWidget(),
                    _BrandWidget(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: NectarButton(
                  onPressed: () {},
                  text: 'Apply Filter',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryWidget extends StatelessWidget {
  List<String> _categories = [
    'Eggs',
    'Noodles & Pasta',
    'Chips & Crisps',
    'Fast Food',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Text(
            'Categories',
            style: const TextStyle(
              color: BaseColors.gray1,
              fontSize: 24,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _categories.length,
          itemBuilder: (_, index) {
            return CheckboxListTile(
              value: index == 0,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(_categories[index]),
              onChanged: (value) {},
            );
          },
        ),
      ],
    );
  }
}

class _BrandWidget extends StatelessWidget {
  List<String> _brands = [
    'Individual Callection',
    'Cocola',
    'Ifad',
    'Kazi Farmas',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Text(
            'Brand',
            style: const TextStyle(
              color: BaseColors.gray1,
              fontSize: 24,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _brands.length,
          itemBuilder: (_, index) {
            return CheckboxListTile(
              value: index == 0,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(_brands[index]),
              onChanged: (value) {},
            );
          },
        ),
      ],
    );
  }
}
