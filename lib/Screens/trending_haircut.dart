import 'package:cute_n_cuts/widgets/colors.dart';
import 'package:flutter/material.dart';

class TrendingHaircut extends StatelessWidget {
  TrendingHaircut({Key? key}) : super(key: key);

  final List<String> _images = [    
    'assets/images/Lock.png',    
    'assets/images/Lock.png',    
    'assets/images/Lock.png',    
    'assets/images/Lock.png',    
    'assets/images/Lock.png',    
    'assets/images/Lock.png',    
    'assets/images/Lock.png',    
    'assets/images/Lock.png',    
   
    ];

  @override
  Widget build(BuildContext context) {
    const crossAxisCount = 3;
    final rowCount = (_images.length / crossAxisCount).ceil();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: const Text('CUTE N CUTS'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05, left: MediaQuery.of(context).size.width * 0.03, right: MediaQuery.of(context).size.width * 0.03,),
            child: const Text(
              "Trending haircuts for this year",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              padding: const EdgeInsets.all(8),
              children: List.generate(
                _images.length,
                (index) => Container(
                  color: Colors.grey[200],
                  child: Image.asset(
                    _images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
