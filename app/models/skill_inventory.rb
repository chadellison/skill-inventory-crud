class SkillInventory
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(skill)
    dataset.insert(skill)
  end

  def all
    dataset.map { |skill| Skill.new(skill) }
  end

  def find(id)
    data = dataset.detect { |skill_data| skill_data[:id] == id }
    Skill.new(data)
  end

  def update(skill, id)
    dataset.where(:id => id).update(skill)
  end

  def delete(id)
    dataset.where(:id => id).delete
  end

  private

  def dataset
    database.from(:skills)
  end
end
