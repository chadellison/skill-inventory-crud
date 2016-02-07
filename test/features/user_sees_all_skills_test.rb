require_relative "../test_helper"

class UserSeesAllSkillsTest < FeatureTest
  include TestHelpers
  def test_user_sees_all_skills
    data = {
      title: "skill",
      description: "description"
    }

    skill = skill_inventory.create(data)

    visit "/skills"

    within "h3" do
      assert page.has_content? "skill"
    end
  end
end
