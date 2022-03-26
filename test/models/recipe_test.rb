require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  test "recipe should not be saved without any attributes" do
    recipe = Recipe.new
    assert_not recipe.save, "recipe saved without attribute"
  end

  test "recipe title must be at least 4 letters" do
    recipe0 = Recipe.new(about: "ashdasjkflsdjashjdklskfnasjfmksöldadknjmasöldf")
    recipe1 = Recipe.new(title: "a", about: "ashdasjkflsdjashjdklskfnasjfmksöldadknjmasöldf")
    recipe2 = Recipe.new(title: "aa", about: "ashdasjkflsdjashjdklskfnasjfmksöldadknjmasöldf")
    recipe3 = Recipe.new(title: "aaa", about: "ashdasjkflsdjashjdklskfnasjfmksöldadknjmasöldf")
    recipe4 = Recipe.new(title: "aaaa", about: "ashdasjkflsdjashjdklskfnasjfmksöldadknjmasöldf")
    recipe5 = Recipe.new(title: "aaaaa", about: "ashdasjkflsdjashjdklskfnasjfmksöldadknjmasöldf")
    assert_not recipe0.save, "no title saved"
    assert_not recipe1.save, "1 letter title saved"
    assert_not recipe2.save, "2 letter title saved"
    assert_not recipe3.save, "3 letter title saved"
    assert recipe4.save, "4 letter title not saved"
    assert recipe5.save, "5 letter title not saved"
  end

  test "recipe about needs to be at least 15 letters and maximum of 250 letters" do
    recipe0 = Recipe.new(title: "aaaaa")
    recipe1 = Recipe.new(title: "aaaaa", about: "123456789012")
    recipe2 = Recipe.new(title: "aaaaa", about: "123")
    recipe3 = Recipe.new(title: "aaaaa", about: "asdasdasdasahbfdjsklkjdaksfdlksjdkmffsdnjas")

    assert_not recipe0.save, "no about saved"
    assert_not recipe1.save, "12 letter about saved"
    assert_not recipe2.save, "3 letter about saved"
    assert recipe3.save, "enough letter about not saved"

  end
end
