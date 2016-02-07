require_relative "../test_helper"

class UserDeletesASkill < FeatureTest
  def test_user_can_delete_a_skill
    skill_inventory.create({title: "skateboarding", description: "doing kickflips"})

    visit "/skills"

    assert page.has_content? "skateboarding"
    click_button "Delete"
    within '#skills' do
      refute page.has_content? "skateboarding"
    end
  end
end
