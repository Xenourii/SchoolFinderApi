require 'test_helper'

feature "Schools" do

  describe "#index" do
    it "return the list of all schools" do
      get api_v1_schools_path, nil, {'HTTP_AUTHORIZATION' => 'valid_token'}

      assert_equal 200, last_response.status
      assert_equal "hello", json_response['message']
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
end
