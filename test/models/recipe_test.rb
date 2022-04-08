require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test 'recipe should not be saved without any attributes' do
    recipe = Recipe.new
    assert_not recipe.save, 'recipe saved without attribute'
  end

  test 'recipe title must be at least 4 letters' do
    recipe = Recipe.new(user: users(:regular), title: 'a' * 1, about: 'a' * 20)

    assert_not recipe.save

    recipe = Recipe.new(user: users(:regular), title: 'a' * 3, about: 'a' * 20)
    assert_not recipe.save

    recipe = Recipe.new(user: users(:regular), title: 'a' * 4, about: 'a' * 20)

    assert recipe.save

    recipe = Recipe.new(user: users(:regular),  title: 'a' * 9, about: 'a' * 20)

    assert recipe.save
  end

  test 'recipe title should not be more than 20 chars' do
    recipe = Recipe.new(user: users(:regular), title: 'a' * 20, about: 'a' * 20)

    assert recipe.save

    recipe = Recipe.new(user: users(:regular), title: 'a' * 21, about: 'a' * 20)

    assert_not recipe.save

    recipe = Recipe.new(user: users(:regular), title: 'a' * 32, about: 'a' * 20)

    assert_not recipe.save
  end

  test 'recipe about needs to be at least 15 letters' do
    recipe = Recipe.new(user: users(:regular), title: 'a' * 8, about: 'a' * 10)

    assert_not recipe.save

    recipe = Recipe.new(user: users(:regular), title: 'a' * 8, about: 'a' * 14)

    assert_not recipe.save

    recipe = Recipe.new(user: users(:regular), title: 'a' * 8, about: 'a' * 30)

    assert recipe.save

  end

  test 'recipe needs to be maximum of 250 letters' do
    recipe = Recipe.new(user: users(:regular), title: 'a' * 8, about: 'a' * 145)

    assert recipe.save

    recipe = Recipe.new(user: users(:regular), title: 'a' * 8, about: 'a' * 330)

    assert_not recipe.save

    recipe = Recipe.new(user: users(:regular), title: 'a' * 8, about: 'a' * 251)

    assert_not recipe.save
  end

  test 'recipe must have a user' do
    recipe = Recipe.new(title: 'a' * 5, about: 'a' * 120)

    assert_not recipe.save

    recipe = Recipe.new(user: users(:regular), title: 'a' * 5, about: 'a' * 120)

    assert recipe.save
  end
end
