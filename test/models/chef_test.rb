require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.new(name: "Daniel Boloud", email: "dboloud@danielboloud.com")
end
test "chef is required" do
  assert @chef.valid?
end

test "chefname is required" do
  @chef.chefname = " "
  assert_not @chef.valid?
end

test "name must be >= 2" do
    @chef.chefname = "a"
    assert_not @chef.valid?
  end
  
  test "name must be <= 50 characters"
  @chef.chefname ="a"*26 
    assert_not @chef.valid?
end

test "email is required" do
  @chef.email = " "
  assert_not @chef.valid?
end

test "email should be valid" do
  @chef.email = "a"*101 + "@example.com"
  assert_not @chef.valid?
end

test "email should be unique" do
  dup_chef = @chef.dup 
  dup_chef.email = @chef.email.upcase
  @chef.save
  assert_not dup_chef.valid?
end

test "email address validation" do
  vaild_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eem.au laura+joe@monk.cm]
  valid_addresses.each do |va|
    @chef.email = va
    assert @chef.email.valid?, '{#va.inspect} should be a valid email address'
  end 
  
  test "email should reject invalid email addresses" do 
     invalid_addresses = %w[user@eee,com user_at_eee.org user.name@example. eem@i_am_.au laurajoe@monk+fish.com]
     invalid_addresses.each do |ia|
     @chef.email = ia
    assert_not @chef.email.valid?, '{#va.inspect} is not a valid email address'
    
  end

end





