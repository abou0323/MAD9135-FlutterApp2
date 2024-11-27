import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  late Future<List<Product>> _data;
  @override
  void initState() {
    super.initState();
    _data = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Product>>(
        future: _data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  // return ListTile(title: Text(data[index].name));
                  return Card(
                      color: Theme.of(context).colorScheme.secondary,
                      child: ListTile(
                        leading: Image.network(
                          data[index].thumbnail,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(data[index].name),
                        subtitle: Text(data[index].description),
                      ));
                });
          } else {
            return const Text('No data');
          }
        },
      ),
    );
  }

  Future<List<Product>> fetchData() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products?limit=15'));
    if (response.statusCode == HttpStatus.ok) {
      List jsonResponse = json.decode(response.body)['products'];
      return jsonResponse.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class Product {
  final int id;
  final String name;
  final String description;
  final String thumbnail;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> data) {
    return Product(
      id: data['id'],
      name: data['title'],
      description: data['description'],
      thumbnail: data['thumbnail'],
    );
  }
}
