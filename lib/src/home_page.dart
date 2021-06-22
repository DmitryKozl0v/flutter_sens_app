import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';



class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<List<double>> numbersList  = [[1.5, 1.0, 0.5]];
  List<List<int>> selectedList  = [[0, 0, 0]];
  bool itsDone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.replay_outlined), 
            onPressed: (){
              setState(() {
                numbersList = [[0.5, 1.0, 1.5]];
                selectedList = [[0, 0, 0]];
                itsDone = false;
              });
            }
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: (){}
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(child: Container(child: _list(context))),
    );
  }

  Widget _list(BuildContext context){

    return ListView.builder(
      itemBuilder: (context, i) {
        return Column(
          children: <Widget>[
            _buttonRow(i),
            SizedBox(height: 20,)
          ]
        );
      },
      itemCount: numbersList.length,
    );
  }

  Widget _buttonRow (int i){

    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _individualButton(i, 0),
          _middleValue(i, 1),
          _individualButton(i, 2),
        ],
      );
  }

  Widget _individualButton(int i, int j){

    final ButtonStyle selectedOutlinedButtonTheme = OutlinedButton.styleFrom(
      primary: Colors.white,
      side: BorderSide(color: Colors.lightGreenAccent[400], width: 2),
    );

    

    return OutlinedButton(
      onPressed:  ( listEquals(selectedList[i], [0,0,0]) && !itsDone )
                      ? () {
                        setState(() {
                          _createNewItems(i,j);
                        });
                      }
                      : null,
      child: Text(numbersList[i][j].toStringAsFixed(3)), 
      style: selectedList[i][j] == 1 
                ? selectedOutlinedButtonTheme
                : null,
    );
  }

  void _createNewItems(int i, int j){

    List<double> newValues = [];

    selectedList[i][j] = 1;
    selectedList.add([0, 0 ,0]);
    newValues.add(numbersList[i][j]);                      
    newValues.add(numbersList[i][1]);
    newValues.add((newValues[0] + newValues[1]) / 2);
    newValues.sort();
    numbersList.add(newValues);

    if(_isBelowFivePercent(newValues)){
      itsDone = true;
    }
  }

  Widget _middleValue(int i, int j){

    return Text(
      numbersList[i][1].toStringAsFixed(3), 
      style: TextStyle(
        fontWeight: FontWeight.w700,
        color: itsDone && i+1 == numbersList.length
                ? Colors.lightGreenAccent[400]
                : Colors.white,
      ),
    );
  }
}

bool _isBelowFivePercent (List<double> nL) {

  if((nL[1] / nL[0] <= 1.05) || (nL[1] / nL[2] >= 0.95)){
    return true;
  }
  return false;

}

