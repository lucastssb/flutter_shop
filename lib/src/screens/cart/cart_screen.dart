import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const routerName = '/cart-screen';

  @override
  Widget build(BuildContext context) {
    print('Building');
    return Scaffold(
        body: Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: Container(
            child: Draggable(
              data: 100,
              feedback: Container(
                width: 100,
                height: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.brown,
                ),
              ),
              child: Container(
                width: 100,
                height: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                child: Text('Hello'),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: DragTarget<int>(
            builder: (context, candidates, rejects) {
              print(candidates);
              return Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.blue,
                child:
                    Text('Info: ' + candidates.toString() + rejects.toString()),
              );
            },
            onAccept: (value) {
              print('Value: ' + value.toString());
            },
            onMove: (value) {
              print('Valueeeee: ' + value.toString());
            },
            onWillAccept: (value) {
              return true;
            },
          ),
        )
      ],
    ));
  }
}
