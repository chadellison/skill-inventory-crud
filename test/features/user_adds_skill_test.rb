require_relative '../test_helper'

class UserAddsSkillTest < FeatureTest
  def test_skill_creation_with_valid_attributes
    visit "/skills/new"

    fill_in "skill[title]", with: "skateboarding"
    fill_in "skill[description]", with: "doing kickflips"

    click_button "submit"

    assert_equal "/skills", current_path

    within '#skills' do
      assert page.has_content? 'skateboarding'
    end
  end
end
