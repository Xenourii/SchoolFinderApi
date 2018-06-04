require 'test_helper'

feature "Schools" do

  describe "#index" do
    it "return 200 if the user is valid" do
      get api_v1_schools_path, nil, {'HTTP_AUTHORIZATION' => 'valid_token'}

      assert_equal 200, last_response.status
    end

    it "return the correct number of schools" do
      get api_v1_schools_path, nil, {'HTTP_AUTHORIZATION' => 'valid_token'}

      assert_equal 2, json_response['schools'].count
    end

    it "return the correct schools" do
      get api_v1_schools_path, nil, {'HTTP_AUTHORIZATION' => 'valid_token'}

      assert_equal "Pierre Termier", json_response['schools'][0]['name']
      assert_equal "Ynov", json_response['schools'][1]['name']
    end

    it "return only private schools" do
      get api_v1_schools_path, {status: 'private'}, {'HTTP_AUTHORIZATION' => 'valid_token'}

      assert_equal 200, last_response.status
      assert_equal "Ynov", json_response['schools'][0]['name']
    end

    it "return only public schools" do
      get api_v1_schools_path, {status: 'public'}, {'HTTP_AUTHORIZATION' => 'valid_token'}

      assert_equal 200, last_response.status
      assert_equal "Pierre Termier", json_response['schools'][0]['name']
    end

    it "returns 401 error if the user is not authentified" do
      get api_v1_schools_path

      assert_equal 401, last_response.status
    end

    it "returns 401  when auth_token is unkown" do
      get api_v1_schools_path, headers: {'HTTP_AUTHORIZATION' => '12345AZERTY'}

      assert_equal 401, last_response.status
    end
  end

  describe "#show" do

  end

  describe "#destroy" do
    it "delete the school" do
      delete api_v1_school_path(1), nil, {'HTTP_AUTHORIZATION' => 'valid_token'}

      assert_equal 200, last_response.status
    end
  end

end
