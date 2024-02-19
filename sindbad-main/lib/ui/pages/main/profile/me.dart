import 'package:flutter/material.dart';
import 'package:sindbad/ui/widget/btn.dart';
import 'package:sindbad/ui/widget/text_field.dart';
import 'package:sindbad/utils/color.dart';

class MyProfilePage extends StatelessWidget{
  final Function(int) setIndexPage;

  const MyProfilePage({super.key, required this.setIndexPage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setIndexPage(4);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    weight: 30,
                  ),
                ),
                Spacer(),
                Text(
                  'Мои данные',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Image.asset(
                    'assets/ic_bell.png',
                    width: 22,
                    height: 22,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Stack(children: [
              Container(padding: EdgeInsets.all(8), child: Image.asset('assets/ic_face.png', width: 100,)),
              Positioned(bottom: 0,right: 0, child: Container(padding: EdgeInsets.all(8), decoration: BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle), child: Image.asset('assets/ic_edit.png', width: 24,),))
            ],),
            MTextField(hint: 'Имя и фамилия',margin: EdgeInsets.only(top: 20),),
            MTextField(hint: 'Телефон',margin: EdgeInsets.only(top: 10),),
            MTextField(hint: 'E-mail',margin: EdgeInsets.only(top: 10),),
            Spacer(),
            MButton(onTap: (){}, text: 'Сохранить', bgColor: MColor.blue)
      ],),
    );
  }
}