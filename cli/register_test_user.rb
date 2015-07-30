require 'selenium-webdriver'

text = [
  ['last_name',     'test_%d'],
  ['first_name',    'test_%d'],
  ['nick_name',     'test_%d'],
  ['user_mail',     'test_%d@example.com'],
  ['user_password', 'testtest'],
  ['user_password_confirm', 'testtest'],
]

select = [
  ['user_pref',         1],
  ['user_birth[year]',  30],
  ['user_birth[month]', 1],
  ['user_birth[day]',   1],
]

radio = [
  ['user_sex',   0],
  ['user_grade', 1],
]

driver = Selenium::WebDriver.for :firefox

start = 0
num = 30

num.times do |i|

  driver.navigate.to 'http://xxxxx'

  text.each do |id, data|
    element = driver.find_element(:id, id)
    s = sprintf(data, start + i);
    element.send_keys(s);
  end

  select.each do |id, data|
    element = Selenium::WebDriver::Support::Select.new(driver.find_element(:name => id));
    element.select_by(:index, data)
  end

  radio.each do |id, data|
    elements = driver.find_elements(:name, id)
    elements[data].click
  end

  driver.find_element(:xpath, '/html/body/div[3]/div[2]/div/div/form/div/input').click
  driver.find_element(:xpath, '/html/body/div[3]/div[2]/div/div/form/div/input[2]').click
  
end
