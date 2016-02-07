require_relative '../test_helper'

class UserAddsSkillTest < FeatureTest
  def test_user_can_add_skills
    visit "/skills/new"

    fill_in "skill[title]", with: "capy's title"
    fill_in "skill[description]", with: "capy's description"

    click_button 'submit'

    assert "/skills", current_path

    within "h3" do
      assert page.has_content? "capy's title"
    end
  end
end
