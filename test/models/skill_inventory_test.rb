require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test
  include TestHelpers

  def test_can_create_a_skill
    data = {
      title:       "some title",
      description: "some description"
    }

    skill_inventory.create(data)

    skill = skill_inventory.all.last

    assert skill.id
    assert_equal "some title", skill.title
    assert_equal "some description", skill.description
  end

  def test_it_calls_all_skills
    data1 = {
      title:       "some title",
      description: "some description"
    }

    data2 = {
      title:       "another title",
      description: "another description"
    }

    skill_inventory.create(data1)
    skill_inventory.create(data2)

    skills = skill_inventory.all
    assert_equal Skill, skills.sample.class
    assert_equal 2, skills.size

    assert_equal "another title", skills.last.title
    assert_equal "some description", skills.first.description
  end

  def test_it_can_find_a_skill_by_its_id
    data1 = {
      title:       "some title",
      description: "some description"
    }

    data2 = {
      title:       "another title",
      description: "another description"
    }

    skill_inventory.create(data1)
    skill_inventory.create(data2)

    assert_equal "another title", skill_inventory.find(2).title
  end
end
