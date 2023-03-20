# PizzaShop
This is a pizzashop API built with Ruby on Rails. It features three models: Restaurant, Pizza, and RestaurantPizza. The Restaurant model has a name and an address, while the Pizza model has a name and an ingredient. The RestaurantPizza model serves as a join table between Restaurant and Pizza, and has a price attribute.



## Topics
- Models
- Associations
- Validations
- Routes, Controllers, and REST

## Instructions

## Installation
To get started, clone the repository and navigate to the project directory:


    git clone https://github.com/abdishukri-105/pizza-shop

cd pizza-shop

Then, install the required dependencies using Bundler:

    bundle install

 run the migrations:


    
    rails db:migrate
## Usage
Start the server with:


    rails server


## Table

#### Restaurant Table
| Column | Type   |
| ------ | ------ |
| name   | String |
#### Pizzas Table
| Column | Type    |
| ------ | ------- |
| name   | String  |
|ingredient| String |
#### restaurant_pizzas Table
| Column | Type    |
| ------ | ------- |
| pizza_id|integer |
| price  | Integer |
|restaurant_id|integer|


### Validations
Add validations to the `RestaurantPizza` model:
- must have a `price` between 1 and 30

### Routes

`GET /restaurants`

Response
```
[
  {
    "id": 1,
    "name": "Sottocasa NYC",
    "address": "298 Atlantic Ave, Brooklyn, NY 11201"
  },
  {
    "id": 2,
    "name": "PizzArte",
    "address": "69 W 55th St, New York, NY 10019"
  }
]
```
`GET /restaurants/:id`

If the `Restaurant` exists, returns
```
{
  "id": 1,
  "name": "Sottocasa NYC",
  "address": "298 Atlantic Ave, Brooklyn, NY 11201",
  "pizzas": [
    {
      "id": 1,
      "name": "Cheese",
      "ingredients": "Dough, Tomato Sauce, Cheese"
    },
    {
      "id": 2,
      "name": "Pepperoni",
      "ingredients": "Dough, Tomato Sauce, Cheese, Pepperoni"
    }
  ]
}
```
If the `Restaurant` does not exist, returns the following JSON data
```
{
  "error": "Restaurant not found"
}
```
`DELETE /restaurants/:id`

If the `Restaurant` exists, it should be removed from the database, along with
any `RestaurantPizza`s that are associated with it (a `RestaurantPizza` belongs
to a `Restaurant`, so you need to delete the `RestaurantPizza`s before the
`Restaurant` can be deleted).
After deleting the `Restaurant`, return an _empty_ response body, along with the
appropriate HTTP status code.
If the `Restaurant` does not exist, returns the following JSON data, along with
the appropriate HTTP status code:
```
{
  "error": "Restaurant not found"
}
```
`GET /pizzas`
Returns
```
[
  {
    "id": 1,
    "name": "Cheese",
    "ingredients": "Dough, Tomato Sauce, Cheese"
  },
  {
    "id": 2,
    "name": "Pepperoni",
    "ingredients": "Dough, Tomato Sauce, Cheese, Pepperoni"
  }
]
```
`POST /restaurant_pizzas`

This route  creates a new `RestaurantPizza` that is associated with an
existing `Pizza` and `Restaurant`. It  accepts an object with the following
properties in the body of the request:
```
{
  "price": 5,
  "pizza_id": 1,
  "restaurant_id": 3
}
```
If the `RestaurantPizza` is created successfully, it sends back a response with the data
related to the `Pizza`:
```
{
  "id": 1,
  "name": "Cheese",
  "ingredients": "Dough, Tomato Sauce, Cheese"
}
```
If the `RestaurantPizza` is **not** created successfully, returns the following
JSON data, along with the appropriate HTTP status code:
```
{
  "errors": ["validation errors"]
}
```
## LICENSE
This repository is distributed under the ISC License
## Author
This repository is maintained by:
- Abdishukri Mohamed