# README #

This README would normally document whatever steps are necessary to get your application up and running.

### What is this repository for? ###

* Quick summary
* Version
* [Learn Markdown](https://bitbucket.org/tutorials/markdowndemo)

### How do I get set up? ###

* Summary of set up
* Configuration
* Dependencies
* Database configuration
* How to run tests
* Deployment instructions

### Contribution guidelines ###

* Writing tests
* Code review
* Other guidelines

### Who do I talk to? ###

* Repo owner or admin
* Other community or team contact

DELIMITER //
CREATE PROCEDURE country_hos
(IN con CHAR(20))
BEGIN
  SELECT Name, HeadOfState FROM Country
  WHERE Continent = con;
END //
DELIMITER ;

Stored Procedures: 

  getFavoritesForCustomer
    Select rec.* from customers cust join has_favorite fav on cust.id = fav.customer_id join recipes rec on rec.id = fav.recipe_id where cust.id=input_id;

  getFridgeForCustomer
  Select ingredients.name, units.name, frid.* from has_ingredient_in_fridge frid join ingredients on frid.ingredient_id = ingredients.id join units on frid.unit_id = units.id where customer_id=input_id;

### Database Sample Data ###

* Users
email: blub@blub.com 
pw: sdfsadf

or

email: a@b.c
pw: 123

* Recipes
Lady am Spieß
Steak
Lasagne

* Ingredients
Reis
Nudeln
Lady