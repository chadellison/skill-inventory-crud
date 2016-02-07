require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test
  include TestHelpers

  def test_can_create_a_skill
    data = {
      title:       "some title",
      description: "some description"
    }

    skill_inventory.create(data)

    last_skill = skill_inventory.all.last

    assert last_skill.id
    assert_equal "some title", last_skill.title
    assert_equal "some description", last_skill.description
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

    skill1_id =  skill_inventory.create(data1)
    skill2_id = skill_inventory.create(data2)

    assert_equal "some title", skill_inventory.find(skill1_id).title
    assert_equal "another title", skill_inventory.find(skill2_id).title

    assert_equal "some description", skill_inventory.find(skill1_id).description
    assert_equal "another description", skill_inventory.find(skill2_id).description
  end

  def test_it_can_update_a_skill
    data = {
      title:       "initial skill",
      description: "initial description"
    }

    new_data = {
      title:       "new data",
      description: "new description"
    }

    skill_id = skill_inventory.create(data)

    assert_equal "initial skill", skill_inventory.find(skill_id).title
    assert_equal "initial description", skill_inventory.find(skill_id).description

    skill_inventory.update(new_data, skill_id)

    updated_skill = skill_inventory.find(skill_id)

    assert_equal "new data", updated_skill.title
    assert_equal "new description", updated_skill.description
  end

  def test_it_can_delete_a_skill
    data = {
      title:       "skill",
      description: "description"
    }

    skill_id = skill_inventory.create(data)

    assert_equal 1, skill_inventory.all.count

    assert_equal "skill", skill_inventory.find(skill_id).title
    assert_equal "description", skill_inventory.find(skill_id).description

    skill_inventory.delete(skill_id)

    assert_equal 0, skill_inventory.all.count
  end
end
