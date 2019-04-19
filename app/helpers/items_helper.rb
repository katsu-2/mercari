module ItemsHelper
  def inserting_to_commma(price)
    "#{price.to_s(:delimited, delimiter: ',')}"
  end
end
