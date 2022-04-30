import 'package:flutter/material.dart';
import 'package:mengo/colors/colors.dart';


class Finish extends StatefulWidget {
  const Finish({Key? key}) : super(key: key);

  @override
  _FinishState createState() => _FinishState();
}

class _FinishState extends State<Finish> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MengoColors.white,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: MengoColors.mainOrange,
            )),
        title: Row(
          children: [
            Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 50,
                  ),
                  child: Text(
                    "Top bar config",
                    style: TextStyle(color: MengoColors.mainOrange, fontSize: 27),
                  ),
                )),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/mainBackground.png"),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 95),
            child: Container(
              margin: const EdgeInsets.fromLTRB(85, 0, 0, 500),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/logo.png"),
                ),
              ),
            ),
          ),
          Center(
            child: Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 130),
                width: 350,
                height: 400,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(12, 150, 12, 0),
                    child: Form(
                      key: _key,
                      child: Text("Congratulation here is your link \nlink"),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    border: Border.all(
                      color: MengoColors.mainOrange,
                      width: 4,
                    )),
              ),
            ),
          ),

        ],
      ),
    );
  }




}
