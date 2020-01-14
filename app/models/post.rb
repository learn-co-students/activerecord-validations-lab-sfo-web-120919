class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates_with TitleValidator
    belongs_to :author
    validates :title, presence: true
    validates :content, length: {minimum: 15}
    validates :summary, length: {maximum: 50}
    validates :category, acceptance: {accept: ['Fiction']}
end
