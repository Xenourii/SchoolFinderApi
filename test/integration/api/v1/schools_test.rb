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

  describe "#create" do
    it "returns 200 if when school is successfully created" do
      assert_difference "School.all.count" do
        post api_v1_schools_path, {school: {
          name: "new school",
          }},
          {'HTTP_AUTHORIZATION' => 'valid_token'}

        assert_equal 201, last_response.status
        assert_equal "new school", json_response['school']['name']
      end
    end

    it "doesn't create a new school when no name given" do

      assert_no_difference "School.all.count" do
        post api_v1_schools_path, {school: {
          name: ""
          }},
          {'HTTP_AUTHORIZATION' => 'valid_token'}

        assert_equal 422, last_response.status
      end
    end
  end

  describe "#update" do

    it "returns 200 when school is successfully updated" do
      assert_no_difference "School.all.count" do
        patch api_v1_school_path(1), {school: {
          name: "updatedName"
          }},
          {'HTTP_AUTHORIZATION' => 'valid_token'}

          assert_equal 200, last_response.status
          assert_equal "updatedName", json_response['school']['name']
      end
    end

    it "truncate the name school when the name length > 255" do

      tooLongName260Char = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit." +
        " Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus" +
        " et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis," +
        " ultricies nec, pellentesque eu, pretium quis, sem."
      expectedNameLength = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit." +
        " Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus" +
        " et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis," +
        " ultricies nec, pellentesque eu, pretium quis,"
      patch api_v1_school_path(1), {school: {
        name: tooLongName260Char
        }},
        {'HTTP_AUTHORIZATION' => 'valid_token'}

        assert_equal 200, last_response.status
        assert_equal expectedNameLength, json_response['school']['name']
    end
  end

  describe "#destroy" do

    it "delete the school" do
      assert_difference "School.all.count", -1 do
        delete api_v1_school_path(1), nil, {'HTTP_AUTHORIZATION' => 'valid_token'}

        assert_equal 200, last_response.status
      end
    end
  end

end
