class Article < ApplicationRecord
    validates :title, presence: true, length: {minimum: 2, maximum: 6}
    validates :title, presence: true


end