import 'package:bmi_app/splashscreeb.dart';
import 'package:bmi_app/suggestion.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF43cea2)),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController= TextEditingController();
  var htController= TextEditingController();
  var inchController= TextEditingController();

  var op=0.0;

  double? bmi;

  @override
  Widget build(BuildContext context) {
    final screenWidth= MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth<400;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF43cea2),
        title: Center(child: Text("BMI App",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
      ),
      backgroundColor: Color(0xFFF3F4F6),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30,),
              TextField(
                controller: wtController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Weight (in kgs)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1,
                    )
                  ),
                ),
              ),
          
              SizedBox(height: 30,),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: screenWidth*0.42,
                    child: TextField(
                      controller: htController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Height (in feet)",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
          
                  SizedBox(width: 40,),
          
                  Container(
                    width: screenWidth*0.42,
                    child: TextField(
                      controller: inchController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Height (in inches)",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1,
                          )
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 40,),
          
              Container(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  var wt= double.parse(wtController.text.toString());
                  var ht= int.parse(htController.text.toString());
                  var inch= int.parse(inchController.text.toString());
                  if(wt!=null && ht!=null && inch!=null){
          
                  var tinch= ht*12+inch;
                  var tcm= tinch*2.54;
                  var tm= tcm/100;
          
                  setState(() {
                    bmi= wt/(tm*tm);
                    op=1.0;
          
                  });};
          
                }, child: Text("Calculate"),),
              ),
            SizedBox(height: 30,),
              Container(
                height: 400,
                child: SfRadialGauge(
                  axes: [
                    RadialAxis(minimum: 0.0,maximum: 40.0,
                    ranges: [
                      GaugeRange(startValue: 0.0, endValue:18.4 ,color: Colors.blue.shade900,),
                      GaugeRange(startValue: 18.5, endValue: 24.9,color: Colors.green),
                      GaugeRange(startValue: 25.0, endValue: 29.9,color: Colors.orange,),
                      GaugeRange(startValue: 30.0, endValue: 40.0,color: Colors.red.shade900),
                    ],
                    pointers: [
                      NeedlePointer(
                        value: bmi?? 0,
                        enableAnimation: true,
                        animationDuration: 1500,
                        animationType: AnimationType.ease,
                      ),
                    ],
                      annotations: [
                        GaugeAnnotation(widget: Container(child:Text("BMI\n${bmi?.toStringAsFixed(1)}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))),angle: 90,positionFactor: 0.5,)
                      ],
                    ),
          
                  ],
                ),
              ),

              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  setState(() {
                    htController.clear();
                    wtController.clear();
                    inchController.clear();
                    op=0.0;
                  });
                }, child: Text("Clear All")),
              ),


              IgnorePointer(
                ignoring: op==0,
                child: AnimatedOpacity(
                    opacity: op,
                    duration: Duration(seconds: 2),
                curve: Curves.decelerate,
          
          
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: (){
                        setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Suggestion();
                        }));
                        });
                      }, child: Text("See Suggestions"),),
                    ),),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
