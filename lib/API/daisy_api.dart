import 'dart:developer';
import 'dart:nativewrappers/_internal/vm/bin/common_patch.dart';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String,String>?> getDaisyNumber() async{

const apikey ="";
const Service ="ds";

  final url =Uri.parse('https://daisysms.com/stubs/handler_api.php?api_key=$apiKey&action=getNumber&service=$service&max_price=5.0');
  

  try {
    final response = await http.get(url,
 
    );
    if(response.statusCode==200){
    final body =response.body;
    if(body.startsWith("ACCESS_NUMBER")){
      final parts=body.split(":");
        final id=parts[1];
        final number=parts[2];
        return {"id":id,"number":number};
    }
    else{
      print("Daisy API Error:$body");
      return null;
      
    }

    }
    else{
      print("Daisy API Error: ${response.statusCode}");
      return null;
    }
  }
  catch(e){
    print("API call Exception: $e");
    return null;
  }
}
