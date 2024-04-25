List<Map> catList=[
  {
    "cat_name":"Salads",
    "product_list":[
      {
        "name":"Avocado Salad",
        "price":12.00,
        "rating":4.5,
        "image":"images/avocado.jpg",
        "calories":100,
        "quantity":1,
      },
      {
        "name":"Fruit Salad",
        "price":11.00,
        "rating":4.6,
        "image":"images/fruit.jpg",
        "calories":70,
        "quantity":1,
      },
      {
        "name":"Cucumber Salad",
        "price":12.00,
        "rating":4.2,
        "image":"images/cucumber.jpg",
        "calories":90,
        "quantity":1,
      },
      {
        "name":"Shrimp Salad",
        "price":15.00,
        "rating":5,
        "image":"images/shrimpsalad.jpg",
        "calories":120,
        "quantity":1,
      },
    ],
  },
  {
    "cat_name":"Hot Sale",
    "product_list":[
      {
        "name":"Fruit Salad",
        "price":11.00,
        "rating":4.6,
        "image":"images/fruit.jpg",
        "calories":70,
        "quantity":1,
      },
      {
        "name":"Avocado Salad",
        "price":12.00,
        "rating":4.5,
        "image":"images/avocado.jpg",
        "calories":100,
        "quantity":1,
      },
    ],
  },
  {
    "cat_name":"Popularity",
    "product_list":[
      {
        "name":"Shrimp Salad",
        "price":15.00,
        "rating":5,
        "image":"images/shrimpsalad.jpg",
        "calories":120,
        "quantity":1,
      },
      {
        "name":"Fruit Salad",
        "price":11.00,
        "rating":4.6,
        "image":"images/fruit.jpg",
        "calories":70,
        "quantity":1,
      },
      {
        "name":"Avocado Salad",
        "price":12.00,
        "rating":4.5,
        "image":"images/avocado.jpg",
        "calories":100,
        "quantity":1,
      },
      {
        "name":"Cucumber Salad",
        "price":12.00,
        "rating":4.2,
        "image":"images/cucumber.jpg",
        "calories":90,
        "quantity":1,
      },

    ],
  },
];

List<Map> cartList=[];

class Global
{
static num finalsum =0;
static num subsum=0;
static num delivery=3.50;
static num discount=0;
}