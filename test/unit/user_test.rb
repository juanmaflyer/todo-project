require 'test_helper'

class UserTest < ActiveSupport::TestCase

  fixtures :users
  def setup
	User.create(:login=>"jack",:email=>"juanmaflyer@gmail.com",:password=>"asdfg",:password_confirmation=>"asdfg")
	User.create(:login=>"juanmaflyer",:email=>"other@mail.com",:password=>"asdfg",:password_confirmation=>"asdfg")

  end
  
  test "email vacio" do
	user = User.new(:login=>"testusr",:email=>"",:password=>"asdfg",:password_confirmation=>"asdfg")
	assert !user.save
  end
  
  test "formato email invalido" do
	user = User.new(:login=>"testusr",:email=>"fucku(at)your(dot)self",:password=>"asdfg",:password_confirmation=>"asdfg")
	assert !user.save
  end
  
  test "email already taken" do
	user = User.new(:login=>"testusr",:email=>"juanmaflyer@gmail.com",:password=>"asdfg",:password_confirmation=>"asdfg")
	assert !user.save
  end
  
  test "login name already taken" do
	user = User.new(:login=>"juanmaflyer",:email=>"stubs@gmail.com",:password=>"asdfg",:password_confirmation=>"asdfg")
	assert !user.save
  end
  
  test "password muy corto" do
	user = User.new(:login=>"testusr",:email=>"foo@example.com",:password=>"123",:password_confirmation=>"123")
	assert !user.save
  end
  
  test "password confirmacion no es igual a password" do
	user = User.new(:login=>"testusr",:email=>"foo@example.com",:password=>"distinto",:password_confirmation=>"asdfg")
	assert !user.save
  end
end
