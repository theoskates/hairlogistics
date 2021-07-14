import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  });
}

List<Product> products = [
  Product(
    id: 1,
    title: "Afro",
    price: 450,
    size: 12,
    description: dummyText,
    image: "assets/images/image_1.png",
    // color: Colors.brown,
  ),
  Product(
    id: 2,
    title: "Mesh",
    price: 760,
    size: 8,
    description: dummyText,
    image: "assets/images/image_10.png",
    // color: Color(0xFFD3A984),
  ),
  Product(
    id: 3,
    title: "Natural",
    price: 650,
    size: 8,
    description: dummyText,
    image: "assets/images/image_2.png",
    // color: Color(0xFFD3A100),
  ),
  Product(
    id: 4,
    title: "Louisa",
    price: 390,
    size: 10,
    description: dummyText,
    image: "assets/images/image_3.png",
    // color: Color(0xFF989493),
  ),
  Product(
    id: 5,
    title: "Mesh",
    price: 760,
    size: 8,
    description: dummyText,
    image: "assets/images/image_10.png",
    // color: Color(0xFFD3A984),
  ),
  Product(
    id: 6,
    title: "Louisa",
    price: 390,
    size: 10,
    description: dummyText,
    image: "assets/images/image_3.png",
    // color: Color(0xFF989493),
  ),
  Product(
    id: 7,
    title: "Afro",
    price: 450,
    size: 12,
    description: dummyText,
    image: "assets/images/image_1.png",
    // color: Colors.brown,
  ),
  Product(
    id: 8,
    title: "Louisa",
    price: 390,
    size: 10,
    description: dummyText,
    image: "assets/images/image_3.png",
    // color: Color(0xFF989493),
  ),
  Product(
    id: 9,
    title: "Side",
    price: 720,
    size: 11,
    description: dummyText,
    image: "assets/images/image_4.png",
    // color: Color(0xFFE6BA40),
  ),
  Product(
    id: 10,
    title: "Louisa",
    price: 390,
    size: 10,
    description: dummyText,
    image: "assets/images/image_3.png",
    // color: Color(0xFF989493),
  ),
  Product(
    id: 11,
    title: "Back",
    price: 410,
    size: 12,
    description: dummyText,
    image: "assets/images/image_5.png",
    // color: Color(0xFFFB7883),
  ),
  Product(
    id: 12,
    title: "Back",
    price: 410,
    size: 12,
    description: dummyText,
    image: "assets/images/image_5.png",
    // color: Color(0xFFFB7883),
  ),
  Product(
    id: 13,
    title: "Front",
    price: 600,
    size: 12,
    description: dummyText,
    image: "assets/images/image_6.png",
    // color: Color(0xFFAEAEAE),
  ),
  Product(
    id: 14,
    title: "Easy",
    price: 790,
    size: 8,
    description: dummyText,
    image: "assets/images/image_7.png",
    // color: Color(0xFFD3A984),
  ),
  Product(
    id: 15,
    title: "Mini",
    price: 380,
    size: 8,
    description: dummyText,
    image: "assets/images/image_8.png",
    // color: Color(0xFFD3A),
  ),
  Product(
    id: 16,
    title: "Back",
    price: 410,
    size: 12,
    description: dummyText,
    image: "assets/images/image_5.png",
    // color: Color(0xFFFB7883),
  ),
  Product(
    id: 17,
    title: "Locks",
    price: 900,
    size: 8,
    description: dummyText,
    image: "assets/images/image_9.png",
    // color: Color(0xFFD3A900),
  ),
  Product(
    id: 18,
    title: "Mesh",
    price: 760,
    size: 8,
    description: dummyText,
    image: "assets/images/image_10.png",
    // color: Color(0xFFD3A984),
  ),
  Product(
    id: 19,
    title: "nature",
    price: 500,
    size: 8,
    description: dummyText,
    image: "assets/images/image_11.png",
    // color: Color(0xFFD3A984),
  ),
  Product(
    id: 20,
    title: "Rasta",
    price: 400,
    size: 8,
    description: dummyText,
    image: "assets/images/image_12.png",
    // color: Color(0xFFD3A984),
  ),
  Product(
    id: 21,
    title: "Mesh",
    price: 760,
    size: 8,
    description: dummyText,
    image: "assets/images/image_10.png",
    // color: Color(0xFFD3A984),
  ),
  Product(
    id: 22,
    title: "Louisa",
    price: 390,
    size: 10,
    description: dummyText,
    image: "assets/images/image_3.png",
    // color: Color(0xFF989493),
  ),
];

String dummyText =
    "This beautiful hair is all you need if you don't want to go through the stress of spending so much time on your hair. The texture is super soft and easy to manage! This is a 14 inches (2 bundles) and a matching closure.";




