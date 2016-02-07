require_relative '../test_helper'

class EditsASkillTest < FeatureTest
  def test_can_edit_a_skill
    id = skill_inventory.create({
      title:       "capy's skills",
      description: "capy's description"
      })

    visit "/skills"

    click_link "Edit"

    assert "/skills/#{id}"

    fill_in "skill[title]", with: "capy's updated skill"
    fill_in "skill[description]", with: "capy has been upgraded"

    click_button "Submit"

    assert "/skills", current_path

    within "h1" do
      assert page.has_content? "capy's updated skill"
    end

    within "p" do
      assert page.has_content? "capy has been upgraded"
    end
  end
end
