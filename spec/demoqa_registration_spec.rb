require 'spec_helper'
require 'faker'

describe 'testing the demoqa registration page' do

  before(:all) do
    @driver = SeleniumDemoReg.new
    @driver.access_registration_form
    @firstname = Faker::Name.first_name
    @lastname = Faker::Name.last_name
    @marital_status = ["single","married","divorced"]
    @hobby = ["dance","reading","cricket "]
    @day = "25"
    @month = "12"
    @year = "2014"
    @country = Faker::Address.country
    @phone_number = Faker::Company.swedish_organisation_number
    @user_name = Faker::FunnyName.name
    @details = Faker::MostInterestingManInTheWorld.quote
    @password = Faker::Internet.password
  end

  context 'positive paths for the registration form and register' do

    it 'should land on the registration for page' do
      expect(@driver.current_url).to eq 'http://demoqa.com/registration/'
    end

    it 'should accept a first name' do
      @driver.set_first_name_field(@firstname)
      @driver.get_first_name_field_value
      @driver.first_name_field_displayed
    end

    it 'should accept a last name' do
      @driver.set_last_name_field(@lastname)
      @driver.get_last_name_field_value
      @driver.last_name_field_displayed
    end

    it 'should accept a marital status selection of Single, Married, or Divorced' do
      @marital_status.each { |x| @driver.select_marital_option(x) }
    end

    it 'should accept a hobby status selection of Dance, Reading, or Cricket' do
      @hobby.each { |x| @driver.select_hobby_option(x) }
    end

    it 'should have a country default of Afghanistan' do
      expect(@driver.get_first_country).to eq "Afghanistan"
    end

    it 'accept a new DOB' do
      @driver.dob_month_list_select(@month)
      @driver.dob_day_list_select(@day)
      @driver.dob_year_list_select(@year)
    end

    it 'should accept a new country value' do
      @driver.get_selected_country
      @driver.country_dropdown_list_select(@country)
    end

    it 'should accept a valid phone number' do
      expect(@driver.phone_number_length(@phone_number)).to eq 10
      @driver.set_phone_number_field(@phone_number)
      @driver.get_phone_number_field_value
    end

    it 'should accept a username' do
      @driver.set_user_name_field(@user_name)
      @driver.get_user_name_field_value
    end

    it 'should accept a about yourself text' do
      @driver.set_about_yourself_field(@details)
      @driver.get_about_yourself_value
    end

    it 'should accept a password' do
      @driver.set_password_field(@password)
      @driver.get_password_value
    end

    it 'should accept a password confirmation' do
      @driver.set_confirmation_password_field(@password)
      @driver.get_confirmation_password_value
    end
  end
end
