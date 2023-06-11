import 'package:flutter/material.dart';
import 'package:jet_news/news_model.dart';

class DetailsPage extends StatelessWidget {
  final Article result;

  const DetailsPage({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.all(13),
        child: SingleChildScrollView(
          child: Column(
            
            children: [
              Container(
                child: Text(result.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black
                ),)

              ),
              SizedBox(height: 20,),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  result.urlToImage,
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Expanded(
                  child: Text(
                    result.content,
                    
                    style: const TextStyle(
                      
                      
                      fontSize: 16,
                    ), 
                    overflow: TextOverflow.visible,
                
                  ), 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
