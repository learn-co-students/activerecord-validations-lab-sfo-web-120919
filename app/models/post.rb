class Post < ActiveRecord::Base

# All posts have a title
  validates :title, presence: true
# Post content is at least 250 characters long
  validates :content, length: { minimum: 250}
# Post summary is a maximum of 250 characters
  validates :summary, length: { maximum: 250}
# Post category is either Fiction or Non-Fiction 
# This step requires an inclusion validator, 
# which was not outlined in the README lesson. 
# You'll need to refer to the Rails guide to 
# look up how to use it.
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validate :clickbait
  
  def clickbait
    if !title.nil? && (!title.include?("You Won't" || "Secret" || "Top" || "Guess")) 
      errors.add(:clickbait, "That is not a clickbait worthy title. Try again.")
    end
  end


end
