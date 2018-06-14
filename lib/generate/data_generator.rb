require 'faker'

class DataGenerator

  def gen_first_name
    Faker::Name.first_name
  end

  def gen_last_name
    Faker::Name.last_name
  end

  def gen_marital_status
    ["single","married","divorced"].sample
  end

  def gen_hobby
    ["dance","reading","cricket "].sample
  end

  def gen_day
    rand(1..31).to_s
  end

  def gen_month
    rand(1..12).to_s
  end

  def gen_year
    rand(1950..2014).to_s
  end

  def gen_country
    Faker::Address.country
  end

  def gen_phone_number
    Faker::Company.swedish_organisation_number
  end

  def gen_user_name
    Faker::FunnyName.name.gsub(" ","")
  end

  def gen_details
    Faker::MostInterestingManInTheWorld.quote
  end

  def gen_password
    Faker::Internet.password
  end
end

# test = DataGenerator.new
# p test.gen_month.class
