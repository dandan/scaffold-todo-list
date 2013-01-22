
# Disclaimer:
#
# I have written my own generic steps, which could have been done using pickle, or perhaps a better
# tool.
#
# I have not used pickle for a long time, and had a try of it for this task.
# After 30 minutes of playing around with it I gave up because:
# 1. It does not play nicely with Rubymine (rubymine gets very confused by pickle's step definitions)
# 2. I struggled to get the model paths to work the way I wanted
# 3. I find it too magical.

# Generic model creation
Given 'the following "$pluralised_model" exist:' do |pluralised_model, table|
  table.hashes.map do |params_hash|
    FactoryGirl.create(pluralised_model.singularize, params_hash)
  end
end

# Generic go to a path
When 'I visit "$path"' do |path|
  visit(path)
end

# Look for a set of models
Then /^I should see the following "(\d+)" "(categories|lists|tasks)":$/ do |count, pluralized_model, table|
  model_name = pluralized_model.singularize
  all(".#{model_name}").count.should == count.to_i
  table.hashes.each do |category_hash|
    category_hash.each_pair do |name, value|
      page.should have_css(".#{model_name} .#{name}_field", text: category_hash[value])
    end
  end
end

# Look for a count of models
Then /^I should see "(\d+)" "(categories|lists|tasks)"$/ do |count, pluralized_model|
  model_name = pluralized_model.singularize
  all(".#{model_name}").count.should == count.to_i
end

When 'I click on the first "$link" link' do |link|
  first('a', text: link).click
end

When 'I click the "$button" button' do |button|
  click_button(button)
end

Then 'I should be at the path "$path"' do |path|
  page.current_path.should == path
end

Then 'I should see the main heading is "$heading"' do |heading|
  page.should have_css('h1', text: heading)
end

Then 'I should see the "$field_name" field is: "$field_value"' do |field_name, field_value|
  page.should have_css(".#{field_name}_field", text: field_value)
end

Then 'I should see the "$field_id" input field value is: "$field_value"' do |field_id, field_value|
  page.find("##{field_id}").value.should == field_value
end

When 'I fill in "$field_id" field with "$field_id"' do |field_id, text|
  fill_in field_id, :with => text
end

Then 'I should see the flash notice: "$message"' do |message|
  page.should have_css('#notice', text: message)
end