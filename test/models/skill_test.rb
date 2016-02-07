require_relative '../test_helper'

class SkillTest < Minitest::Test
  def test_it_correctly_creates_a_skill_object
    data = {
      id: 1,
      title: "this title",
      description: "this description"
    }

    skill = Skill.new(data)

    assert_equal 1, skill.id
    assert_equal "this title", skill.title
    assert_equal "this description", skill.description
  end
end
