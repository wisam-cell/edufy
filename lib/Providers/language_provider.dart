import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
String language = 'en';

void changeLanguage(){
  language =language == 'ar' ? 'en' :'ar';
  notifyListeners(); // listen fkn consumers
}


}