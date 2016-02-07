require_relative '../test_helper'

class UserSeesAllSkills < FeatureTest
  def test_can_see_all_tasks
    skill_inventory.create({
      title:       "capy's ai abilities",
      description: "capy can play chess"
      })

    visit "/skills"

    within "h3" do
      assert page.has_content? "capy's ai abilities"
    end
  end
end
