class Prompt < ApplicationRecord
  searchkick

  validates_presence_of :content
end
