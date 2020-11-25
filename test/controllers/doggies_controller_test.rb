require 'test_helper'

class DoggiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doggy = doggies(:one)
  end

  test "should get index" do
    get doggies_url, as: :json
    assert_response :success
  end

  test "should create doggy" do
    assert_difference('Doggie.count') do
      post doggies_url, params: { doggy: { age: @doggy.age, breed: @doggy.breed, name: @doggy.name } }, as: :json
    end

    assert_response 201
  end

  test "should show doggy" do
    get doggy_url(@doggy), as: :json
    assert_response :success
  end

  test "should update doggy" do
    patch doggy_url(@doggy), params: { doggy: { age: @doggy.age, breed: @doggy.breed, name: @doggy.name } }, as: :json
    assert_response 200
  end

  test "should destroy doggy" do
    assert_difference('Doggie.count', -1) do
      delete doggy_url(@doggy), as: :json
    end

    assert_response 204
  end
end
