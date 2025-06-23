import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Suggestion extends StatefulWidget{
  @override
  State<Suggestion> createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {

  var lead=[Colors.blue,Colors.green,Colors.orange, Colors.red];
  var title=["Underweight (BMI <18.5)","Normal weight (18.5 ≤ BMI < 24.9)","Overweight (25 ≤ BMI < 29.9)","Obese (BMI ≥ 30)"];
  var subtitle=["1. You are underweight. Consider a balanced high-protein diet and consult a nutritionist.\n2. Focus on calorie-rich healthy foods like nuts, dairy, and whole grains.\n3. Strength training exercises may help increase muscle mass.","1. Your BMI is in the healthy range. Keep maintaining your lifestyle.\n2. Continue regular exercise and balanced nutrition.\n3. Stay hydrated and get regular check-ups to stay on track.","1. You are slightly overweight. Moderate physical activity and mindful eating can help.\n2. Include more fruits, vegetables, and low-fat meals in your diet.\n3. Track your daily steps and try to reduce screen time.","1. Your BMI indicates obesity. It's important to seek professional health advice.\n2. Consider a structured weight loss plan including exercise and dietary changes.\n3. Avoid processed foods, and monitor portion sizes."];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("             Suggestions",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor:Color(0xFF43cea2),
      ),
      backgroundColor: Color(0xFFF3F4F6),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 11,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: lead[index],
                ),
                title: Text(title[index]),
                subtitle: Text(subtitle[index]),
              ),

            ),
          );
        },
        itemCount: lead.length,
        ),
      ),

    );
  }
}