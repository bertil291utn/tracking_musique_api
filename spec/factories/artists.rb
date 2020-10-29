FactoryBot.define do
  ids = %w[003vvx7Niy0yvhvHt4a68B 0C0XlULifJtAgn6ZNCW2eu 1sTsuZTdANkiFd7T34H3nb 7cX4PJz1old9fyFI8RlfgW]
  factory :artist do
    user
    id_string { ids.sample }
  end
end
