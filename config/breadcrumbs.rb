


crumb :root do
  link "メルカリ", root_path
end

crumb :show do
  link "マイページ", user_path(current_user.id)
  parent :root
end

crumb :profile do
  link "プロフィール", mypages_profile_path
  parent :show
end

crumb :usershipping do
  link "発送元・お届け先住所の変更", mypages_editshipping_path
  parent :show
end

crumb :userconfirm do
  link "本人情報", mypages_information_path
  parent :show
end

crumb :userlogout do
  link "ログアウト", logouts_path
  parent :show
end

crumb :credit do
  link "支払い方法", mypages_credits_path
  parent :show
end

crumb :creditregistration do
  link "クレジットカード情報入力", new_credit_card_path
  parent :credit
end

crumb :itemshow do |item|
  link item.name, items_path
  parent :root
end

crumb :search do |keyword|
  link params[:keyword], search_items_path
  parent :root
end

crumb :category do |category|
  link category.name, category_path
  parent :root
end

crumb :middle_category do |middle_category|
  link middle_category.name, middle_category_path
  parent :category,middle_category.category
end

crumb :lower_category do |lower_category|
  link lower_category.name, lower_category_path
  parent :middle_category,lower_category.middle_category
end



crumb :brand do |brand|
  link brand.name, brand_path
  parent :root
end
