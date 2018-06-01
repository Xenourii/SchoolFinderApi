require 'test_helper'

feature "Schools" do

  describe "#index" do
    # it "shows the schools if user is authentified" do
    #
    #   user = User.create!(
    #     email: "user_1@domain.com",
    #     password: "password1234",
    #     password_confirmation: "password1234"
    #   )
    #
    #   post api_v1_user_session_path, {
    #     email: user.email,
    #     password: user.password
    #   }
    #
    #   get api_v1_schools_path, {
    #     auth_token: json_response['auth_token']
    #   }
    #
    #   assert_equal 200, last_response.status
    #
    # end

    it "returns 401 error if the user is not authentified" do
      get api_v1_schools_path

      assert_equal 401, last_response.status
    end

    it "returns 401  when auth_token is unkown" do
      get api_v1_schools_path, nil, {'HTTP_AUTHORIZATION' => '12345AZERTY'}
      
      assert_equal 401, last_response.status
    end

    it "return 200 when the user is valid" do
      get api_v1_schools_path, nil, {'HTTP_AUTHORIZATION' => 'valid_token'}

      assert_equal 200, last_response.status
    end

  end
end
