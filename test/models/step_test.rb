require "test_helper"

class StepTest < ActiveSupport::TestCase
  test 'step must belong to a model' do
    step = Step.new(title: 'a' * 9, description: 'a' * 40, duration: 20, order: 0)

    assert_not step.save

    step = Step.new(recipe: recipes(:one), title: 'a' * 9, description: 'a' * 40, duration: 20, order: 0)

    assert step.save
  end
  test 'step must have a title which is 6-18 chars long' do
    step = Step.new(recipe: recipes(:one), description: 'a' * 40, duration: 20, order: 0)
    assert_not step.save

    step = Step.new(recipe: recipes(:one), title: 'a' * 5, description: 'a' * 40, duration: 20, order: 0)
    assert_not step.save

    step = Step.new(recipe: recipes(:one), title: 'a' * 19, description: 'a' * 40, duration: 20, order: 0)
    assert_not step.save

    step = Step.new(recipe: recipes(:one), title: 'a' * 12, description: 'a' * 40, duration: 20, order: 0)
    assert step.save
  end
  test 'step must have a description which is 15-120 chars long' do
    step = Step.new(recipe: recipes(:one), title: 'a' * 12, duration: 20, order: 0)
    assert_not step.save

    step = Step.new(recipe: recipes(:one), title: 'a' * 12, description: 'a' * 14, duration: 20, order: 0)
    assert_not step.save

    step = Step.new(recipe: recipes(:one), title: 'a' * 12, description: 'a' * 121, duration: 20, order: 0)
    assert_not step.save

    step = Step.new(recipe: recipes(:one), title: 'a' * 12, description: 'a' * 250, duration: 20, order: 0)
    assert_not step.save

    step = Step.new(recipe: recipes(:one), title: 'a' * 12, description: 'a' * 60, duration: 20, order: 0)
    assert step.save
  end
  test 'step must have a time consumption and it should be in 1-180' do
    step = Step.new(recipe: recipes(:one), title: 'a' * 12, description: 'a' * 60, order: 0)
    assert_not step.save

    step = Step.new(recipe: recipes(:one), title: 'a' * 12, duration: -50, description: 'a' * 60, order: 0)
    assert_not step.save

    step = Step.new(recipe: recipes(:one), title: 'a' * 12, duration: 185, description: 'a' * 60, order: 0)
    assert_not step.save

    step = Step.new(recipe: recipes(:one), title: 'a' * 12, duration: 80, description: 'a' * 60, order: 0)
    assert step.save
  end
  test "step must have an order and it can't be less than 0" do
    step = Step.new(recipe: recipes(:one), title: 'a' * 12, duration: 80, description: 'a' * 60)
    assert_not step.save

    step = Step.new(recipe: recipes(:one), title: 'a' * 12, duration: 80, description: 'a' * 60, order: -1)
    assert_not step.save

    step = Step.new(recipe: recipes(:one), title: 'a' * 12, duration: 80, description: 'a' * 60, order: -5)
    assert_not step.save

    step = Step.new(recipe: recipes(:one), title: 'a' * 12, duration: 80, description: 'a' * 60, order: 1)
    assert step.save

    step = Step.new(recipe: recipes(:one), title: 'a' * 12, duration: 80, description: 'a' * 60, order: 0)
    assert step.save
  end
end
