require './lib/dish'

class Potluck

  attr_reader :date, :dishes

  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(cat)
    all_from_cat = []
    dishes.each do |dish|
      all_from_cat << dish if dish.category == cat
    end
    all_from_cat
  end

  def menu
    sorted_menu = @dishes.sort_by {|dish| dish.name }
    grouped_menu = sorted_menu.group_by { |dish| dish.category }
    grouped_menu
  end

  # def sort_menu
  #   sorted_menu = @dishes.sort_by {|dish| dish.name }.sort_by { |dish| dish.category }
  #   sorted_menu
  # end

  def ratio(cat)
    ( self.get_all_from_category(cat).length.to_f / @dishes.length.to_f ) * 100
  end

end
