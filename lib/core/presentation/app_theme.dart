import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getAppTheme(BuildContext context, bool isDarkTheme) {
  return ThemeData(
    useMaterial3: false,
    primaryColor: const Color(0xFF575b87),
    fontFamily: GoogleFonts.tajawal().fontFamily,


    // scaffoldBackgroundColor: isDarkTheme ? Colors.black : kcScaffoldBackgroundColor,
    textTheme: 
    
    
    GoogleFonts.tajawalTextTheme(

    )

    // Theme.of(context)
    //     .textTheme
    //     .copyWith(
    //       titleSmall:
    //           Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 11),
    //     )
    //     .apply(
    //       bodyColor: isDarkTheme ? Colors.white : Colors.black,
    //       displayColor: Colors.grey,
    //     )
        
        
        
        ,
  
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(
          isDarkTheme ? Colors.orange : Colors.purple),
    ),
    listTileTheme: ListTileThemeData(
        iconColor: isDarkTheme ? Colors.orange : Colors.purple),
    appBarTheme: AppBarTheme(
        backgroundColor: isDarkTheme ? 
        Colors.black : Colors.white,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color:
          isDarkTheme ? 
        Colors.white : Colors.black ,
        fontSize: 18
        ,
        ),
        iconTheme:
            IconThemeData(color: isDarkTheme ? Colors.white : Colors.black54)),
  );
}