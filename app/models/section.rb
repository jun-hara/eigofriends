class Section < ApplicationRecord
  belongs_to :lesson
  has_rich_text :content

  validates :header, presence: true

  def concatenate_header
    # call when using header as a css selector
    # e.g. 'section header' -> 'section-header'
    if header
      concatenated_header = header.gsub(" ","-")
      return concatenated_header
    end
  end
end
