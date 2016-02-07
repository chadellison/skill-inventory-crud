require_relative '../test_helper'

class UserEditsASkillTest < FeatureTest
  def test_user_can_edit_a_skill
    skill_inventory.create({ title: "Original skill", description: "Original description"})

    id = skill_inventory.all.last.id
    visit "/skills/#{id}/edit"

    fill_in "skill[title]", with: "A new title"
    fill_in "skill[description]", with: "A new description"

    click_button 'Submit'

    assert_equal "/skills/#{id}", current_path

    within "h1" do
      assert page.has_content? "A new title"
    end
    within "p" do
      assert page.has_content? "A new description"
    end
  end
end
