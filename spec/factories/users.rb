FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'test00'}
    password_confirmation {password}
    last_name             {'てすと'}
    first_name            {'確認用'}
    last_name_kana        {'テスト'}
    first_name_kana       {'テスト'}
    birth_day             {'1999-9-9'}
  end
end