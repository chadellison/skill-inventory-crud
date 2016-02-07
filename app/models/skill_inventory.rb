class SkillInventory
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(skill)
    dataset.insert(skill)
    # Skill.new(skill)
    # database.transaction do
    #   database['skills'] ||= []
    #   database['total'] ||= 0
    #   database['total'] += 1
    #   database['skills'] << { "id" => database['total'], "title" => skill[:title], "description" => skill[:description] }
    # end
  end

  def raw_skills
    database.transaction do
      database['skills'] || []
    end
  end

  def dataset
    database.from(:skills)
  end

  def all
    dataset.map { |skill| Skill.new(skill) }
    # raw_skills.map { |data| Skill.new(data) }
  end

  def raw_skill(id)
    raw_skills.detect { |skill| skill["id"] == id }
  end

  def find(id)
    # Skill.new(raw_skill(id))
    data = dataset.detect { |skill_data| skill_data[:id] == id }

    Skill.new(data)
  end

  def update(skill, id)
    dataset.where(:id => id).update(skill)
    # database.transaction do
    #   target_skill = database['skills'].find { |skill| skill["id"] == id.to_i }
    #
    #   target_skill["title"] = skill[:title]
    #   target_skill["description"] = skill[:description]
    # end
  end

  def delete(id)
    dataset.where(:id => id).delete(skill)
    # database.transaction do
    #   database["skills"].delete_if { |skill| skill["id"] == id }
    # end
  end
end
