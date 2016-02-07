require_relative '../test_helper'

class UserDeletesASkillTest < FeatureTest
  def test_can_delete_a_skill

    id = skill_inventory.create({
      title:       "capy skills",
      description: "capy has skills"
      })

    visit "/skills"

    assert page.has_content? "capy skills"

    click_button "Delete"

    refute page.has_content? "capy skills"
  end
end
