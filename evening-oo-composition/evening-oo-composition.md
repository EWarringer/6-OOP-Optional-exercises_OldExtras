##OMG We Need Emergency Brussels Sprouts!!

We have run out of Brussels sprouts! A recent drought in the West Coast has caused a market downturn in our favorite ingredient. This is a problem.

Luckily, we have contacts in Belgium that can send us an emergency shipments of Brussels sprouts. We have requisitioned a special [Concorde](http://en.wikipedia.org/wiki/Concorde) airplane for speed of delivery. However, we have to share our cargo with someone else who wants [Cheesy Poofs](https://www.youtube.com/watch?v=-XlYj1iyAlk).

###Learning Goals
* Understanding the concept of Class Composition
* Implement methods to achieve desired calculations

###Instructions

Here are your assumptions:
* Each ingredient has a name and weight
  * A single Brussels sprout weighs 20 grams.
  * A single Cheesy Poof weighs 0.5 grams.
* Each container has a weight, a maximum carrying capacity (max weight it can hold), and the ingredients it carries.
  * Each container can only carry one type of ingredient.
  * Brussels sprouts friendly containers weigh 90 kg and can carry a maximum weight of 140 kg.
  * Cheese Poof containers weigh 20 kg and can carry a maximum weight of 10 kg (they are very sturdy).
* The Concorde has a maximum carrying capacity (max cargo weight) and containers.
* The containers loaded into the airplane are always full.
* Do not worry about dimensions of the plane and whether or not containers would physically fit. Just assume that they will.
* Do not worry about fuel.

Write `Ingredient`, `Container` and `Airplane` classes to help answer the following questions:

For each of the following scenarios, how many Brussels sprouts can be loaded? What is the weight of these Brussels Sprouts (exclude the weight of their containers)? How many Brussels sprout containers are there?

1. A Concorde with a carrying capacity of 9000 kg that must also deliver 2,200 kg of Cheesy Poofs.
2. A Concorde with a carrying capacity of 9000 kg that must also deliver 450 kg of Cheesy Poofs.
3. A Concorde with a carrying capacity of 13000 kg that must also deliver 2,200 kg of Cheesy Poofs.
4. A Concorde with a carrying capacity of 13000 kg that must also deliver 450 kg of Cheesy Poofs.


###Tips
* Write your `Ingredient` class first, then your `Container` class, and finally your `Airplane` class.
* 1000 grams = 1 kg
* Use a [class method](https://learn.launchacademy.com/lessons/class-instance-methods) to create a `Container` object that holds as many ingredients as it can without exceeding the container's carrying capacity given a specific ingredient.
* The number of brussels sprouts that a container holds should be whole numbers and not decimals.
* Remember that the weight of a container is both how much the container weighs and the weight of its total contents.
* Use a class method to create an `Airplane` object with the correct number of both Cheesy Poof containers and Brussels sprouts containers.

###Output
Running `code.rb` should produce the following answers:
1. Brussels Sprout: 70000 (1400.0 kg) in 10 containers
2. Brussels Sprout: 231000 (4620.0 kg) in 33 containers
3. Brussels Sprout: 189000 (3780.0 kg) in 27 containers
4. Brussels Sprout: 350000 (7000.0 kg) in 50 containers
