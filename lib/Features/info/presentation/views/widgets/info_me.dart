import 'package:flutter/material.dart';

class InfoMe extends StatelessWidget {
  const InfoMe({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(

        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gilbert Jones',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4,),
                  Text(
                    'Glbertjones001@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey,
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text('121-224-7890', style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey,
                    ),),
                ],
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Edit',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff8E6CEF)),
                ),
              ),
            ],
          ),
        ),
    );
  }
}