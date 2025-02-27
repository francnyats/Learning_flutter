void main() {
//   String x1 = 'boy';
//   String x2 = 'laughs';

// // string interpolation
//   print('$x1 $x2');

//   //final and const
//   //final initialized only when accessed

//   final cityName = 'Mumbai';
//   // cityName = 'Delhi';

//   var salary = 10000;
//   if (salary > 20000) {
//     print('you have a promotion');
//   } else {
//     print('you need to work hard');
//   }

//   int a = 2;
//   int b = 3;

//   a < b ? print('$a is smaller than $b') : print('$b is smaller');

  //for (var i = 0; 1 < 10; i++) {
  //print('hello');
  //}

  // List planetList = ["Mercury", "Venus", "Earth", "Mars"];

  // for (String planet in planetList) {
  //   print(planet);
  // }

  // var i = 1;

  // outerLoop: while (i < 3) {
  //   print(i);
  //   i++;
  // }

  // for (int i = 1; i < 4; i++) {
  //   for (int j = 1; j < 4; j++) {
  //     print("$i $j");
  //   }
  // }
  var area = findArea(l: 56, b: 67);
  print(area);
}

int findArea({required int l, required int b}) {
  int a = l * b;
  return a;
}

// use curly brackets to intiate named parameters

