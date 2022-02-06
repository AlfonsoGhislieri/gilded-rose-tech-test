# gilded-rose-tech-test

My solution to the Gilded Rose coding challenge: https://github.com/emilybache/GildedRose-Refactoring-Kata

## Setup
```
git clone https://github.com/AlfonsoGhislieri/gilded-rose-tech-test.git
cd gilded-rose-tech-test
bundle install
```

## Example of usage
```
irb -r ./lib/shop.rb

3.0.2 :001 > aged_brie = Item.new("Aged Brie", 5, 5) // Creates an item (Values are: name, sell_in, quality)
3.0.2 :002 > items = [aged_brie]
3.0.2 :003 > shop = Shop.new(items)
3.0.2 :004 > shop.update_quality // updates sell_in and quality depending on item
```

## Testing
```
rspec
```

### Approach

I decided to break this challenge down into small steps in order to build the program back up.

1. Write tests to cover all of the code
2. Break down the code to understand what each line did using comments
3. Remove nested if statements to help make the code easier to read and follow
4. Create helper methods (increase_quality and decrease_quality) to change the quality of the items and decongest the code
5. Make a basic if elsif else block for all the conditions
6. Create classes for each item in order to push the logic out of the shop class
7. Create a module to allow all classes to use same functions and avoid code repetition.
8. Added tests and implemented the conjured goods into the code
9. Final refactoring of shop class and update_quality method

