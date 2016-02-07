require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test
  include TestHelpers

  def create_skills(number)
    number.times do |num|
      skill_inventory.create(
      title: "title#{1 + num}",
      description: "description#{1 + num}"
      )
    end
  end

  def test_it_can_create_a_skill
    create_skills(2)

    assert_equal 2, skill_inventory.all.count
    skill_inventory.create({
      title:       "crushing the code",
      description: "that ruby"
      })
    assert_equal 3, skill_inventory.all.count

    created_skill = skill_inventory.all.last
    assert_equal "crushing the code", created_skill.title
    assert_equal "that ruby", created_skill.description
  end

  def test_it_can_display_all_skills
    create_skills(3)

    skills = skill_inventory.all

    assert_equal Skill, skills.sample.class

    titles = skills.map { |skill| skill.title}
    descriptions = skills.map { |skill| skill.description }

    assert_equal ["title1", "title2", "title3"], titles
    assert_equal ["description1", "description2", "description3"], descriptions
  end

  def test_it_can_find_a_skill_by_id
    create_skills(3)

    skills = skill_inventory.all

    found_skill = skill_inventory.find(skills.last.id)

    assert_equal Skill, found_skill.class
    assert_equal "title3", found_skill.title
    assert_equal "description3", found_skill.description
  end

  def test_it_can_update_a_skill
    create_skills(2)

    skills = skill_inventory.all

    assert_equal 2, skills.count

    assert_equal "title1", skills.first.title
    assert_equal "description1", skills.first.description

    data = {
            title: "crushing the code",
      description: "again and again"
    }
    skill_inventory.update(data, skills.first.id)

    assert_equal 2, skills.count

    assert_equal "crushing the code", skill_inventory.all.first.title
    assert_equal "again and again", skill_inventory.all.first.description
  end

  def test_it_can_delete_a_skill
    create_skills(3)

    skills = skill_inventory.all

    assert_equal 3, skills.count

    id = skills[1].id

    skill_inventory.delete(id)

    assert_equal 2, skill_inventory.all.count
    assert skill_inventory.all.none? { |skill| skill.id == id}
  end
end
