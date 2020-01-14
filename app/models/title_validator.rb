class TitleValidator < ActiveModel::Validator
    def validate(record)
      record.title and unless record.title.match?(/You Won't Believe These True Facts/)
        record.errors[:title] << "Boring title!"
      end
    end
  end