FactoryBot.define do

  factory :caisse do
    start_date { '2021-10-30' }
    end_date { '2021-11-30' }
    amount {'150000'}
  end

  

  factory :need do
      name { 'food' }
      amount {'35000'}
      priority {'Very important'}
    end

  factory :need_2, class: Need do
      name { 'fluel' }
      amount {'55000'}
      priority {'Very important'}
  end

  factory :expense do
      day {'Wednesday'}
      need { 'fluel' }
      amount {'5000'}
      date { '2021-10-31' }
      description {'I just buy pizza'}
  end

end