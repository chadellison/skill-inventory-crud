require_relative "../test_helper"

class UserSeesAllSkillsTest < FeatureTest
  def test_user_sees_all_skills
    visit "/skills"

    within "h3" do
      assert page.has_content? ""
    end
  end
end
