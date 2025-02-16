class Person < ApplicationRecord
  # Relationships
  belongs_to :mother, class_name: 'Person', optional: true
  belongs_to :father, class_name: 'Person', optional: true
  belongs_to :spouse, class_name: 'Person', optional: true
  
  has_many :children_as_mother, class_name: 'Person', foreign_key: 'mother_id'
  has_many :children_as_father, class_name: 'Person', foreign_key: 'father_id'
  
  # Validations
  validates :name, presence: true, uniqueness: true
  validates :gender, presence: true, inclusion: { in: ['Male', 'Female'] }

  def siblings
    return [] unless mother
    mother.children_as_mother.where.not(id: id)
  end

  def brothers
    siblings.where(gender: 'Male')
  end

  def sisters
    siblings.where(gender: 'Female')
  end
end
