require'rspec'
require './lib/dish'
require './lib/potluck'

RSpec.describe Potluck do
  it 'can make a dish' do
    dish = Dish.new("Couscous Salad", :appetizer)
    expect(dish.name).to eq("Couscous Salad")
    expect(dish.category).to eq(:appetizer)
  end

  it 'can make a potluck' do
    potluck = Potluck.new("7-13-18")
    expect(potluck.date).to eq("7-13-18")
    expect(potluck.dishes).to be_empty
  end

  it 'can add a dish' do
    potluck = Potluck.new("7-13-18")
    expect(potluck.dishes).to be_empty
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    potluck.add_dish(couscous_salad)
    potluck.add_dish(cocktail_meatballs)
    expect(potluck.dishes.length).to be(2)
  end

  it 'can get all from category' do
    potluck = Potluck.new("7-13-18")
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    summer_pizza = Dish.new("Summer Pizza", :appetizer)
    roast_pork = Dish.new("Roast Pork", :entre)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    candy_salad = Dish.new("Candy Salad", :dessert)
    potluck.add_dish(couscous_salad)
    potluck.add_dish(summer_pizza)
    potluck.add_dish(roast_pork)
    potluck.add_dish(cocktail_meatballs)
    potluck.add_dish(candy_salad)
    expect(potluck.get_all_from_category(:appetizer).length).to be(2)
    expect(potluck.get_all_from_category(:appetizer).first.name).to eq("Couscous Salad")
  end

  it 'can provide the alphabetized menu and ratio' do
    potluck = Potluck.new("7-13-18")
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    summer_pizza = Dish.new("Summer Pizza", :appetizer)
    roast_pork = Dish.new("Roast Pork", :entre)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    candy_salad = Dish.new("Candy Salad", :dessert)
    bean_dip = Dish.new("Bean Dip", :appetizer)
    potluck.add_dish(couscous_salad)
    potluck.add_dish(summer_pizza)
    potluck.add_dish(roast_pork)
    potluck.add_dish(cocktail_meatballs)
    potluck.add_dish(candy_salad)
    potluck.add_dish(bean_dip)
    expect(potluck.ratio(:appetizer)).to eq(50.0)
  end
end
