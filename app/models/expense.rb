class Expense < ApplicationRecord
    belongs_to :caiss
  
    validates :day, presence: true
    validates :need, presence: true
    validates :amount, presence: true
    validates :date, presence: true
    validates :description, presence: true
  
    validate do |expense|
      @caiss = Budget.find(expense.caiss_id)
      if expense.date < @caiss.start_date or expense.date > @caiss.end_date
        errors.add(:date, I18n.t('models.expense.notice'))
      end
    end
  end
  