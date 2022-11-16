class Lesson < ApplicationRecord
  has_many :sections, dependent: :delete_all
  has_many :comments, dependent: :delete_all

  validates :title, presence: true, uniqueness: true

  def visible?
    return status === "visible"
  end
  
  def get_sections
    return self.sections.select { |section| section.persisted? }
  end
end
