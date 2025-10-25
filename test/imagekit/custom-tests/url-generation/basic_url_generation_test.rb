# frozen_string_literal: true

require_relative "../../test_helper"

class BasicURLGenerationTest < Minitest::Test
  def setup
    @client = Imagekit::Client.new(
      private_key: "My Private API Key"
    )
  end

  def test_should_return_an_empty_string_when_src_is_not_provided
    url = @client.helper.build_url(
      Imagekit::Models::SrcOptions.new(
        src: "",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query
      )
    )

    assert_equal("", url)
  end

  def test_should_generate_a_valid_url_when_src_is_slash
    url = @client.helper.build_url(
      Imagekit::Models::SrcOptions.new(
        src: "/",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint"
    assert_equal(expected, url)
  end

  def test_should_generate_a_valid_url_when_src_is_provided_with_transformation
    url = @client.helper.build_url(
      Imagekit::Models::SrcOptions.new(
        src: "/test_path.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path.jpg"
    assert_equal(expected, url)
  end

  def test_should_generate_a_valid_url_when_a_src_is_provided_without_transformation
    url = @client.helper.build_url(
      Imagekit::Models::SrcOptions.new(
        src: "https://ik.imagekit.io/test_url_endpoint/test_path_alt.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path_alt.jpg"
    assert_equal(expected, url)
  end

  def test_should_generate_a_valid_url_when_undefined_transformation_parameters_are_provided_with_path
    url = @client.helper.build_url(
      Imagekit::Models::SrcOptions.new(
        src: "/test_path_alt.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path_alt.jpg"
    assert_equal(expected, url)
  end

  def test_by_default_transformation_position_should_be_query
    transformation = [
      Imagekit::Models::Transformation.new(
        height: 300.0,
        width: 400.0
      ),
      Imagekit::Models::Transformation.new(
        rotation: 90.0
      )
    ]

    url = @client.helper.build_url(
      Imagekit::Models::SrcOptions.new(
        src: "/test_path.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path.jpg?tr=h-300,w-400:rt-90"
    assert_equal(expected, url)
  end

  def test_should_generate_the_url_without_sdk_version
    transformation = [
      Imagekit::Models::Transformation.new(
        height: 300.0,
        width: 400.0
      )
    ]

    url = @client.helper.build_url(
      Imagekit::Models::SrcOptions.new(
        src: "/test_path.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation: transformation,
        transformation_position: :path
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/tr:h-300,w-400/test_path.jpg"
    assert_equal(expected, url)
  end

  def test_should_generate_the_correct_url_with_a_valid_src_and_transformation
    transformation = [
      Imagekit::Models::Transformation.new(
        height: 300.0,
        width: 400.0
      )
    ]

    url = @client.helper.build_url(
      Imagekit::Models::SrcOptions.new(
        src: "/test_path.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path.jpg?tr=h-300,w-400"
    assert_equal(expected, url)
  end

  def test_should_add_transformation_as_query_when_src_has_absolute_url_even_if_transformation_position_is_path
    transformation = [
      Imagekit::Models::Transformation.new(
        height: 300.0,
        width: 400.0
      )
    ]

    url = @client.helper.build_url(
      Imagekit::Models::SrcOptions.new(
        src: "https://my.custom.domain.com/test_path.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :path,
        transformation: transformation
      )
    )

    expected = "https://my.custom.domain.com/test_path.jpg?tr=h-300,w-400"
    assert_equal(expected, url)
  end

  def test_should_generate_correct_url_when_src_has_query_params
    transformation = [
      Imagekit::Models::Transformation.new(
        height: 300.0,
        width: 400.0
      )
    ]

    url = @client.helper.build_url(
      Imagekit::Models::SrcOptions.new(
        src: "https://ik.imagekit.io/imagekit_id/new-endpoint/test_path.jpg?t1=v1",
        url_endpoint: "https://ik.imagekit.io/imagekit_id/new-endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/imagekit_id/new-endpoint/test_path.jpg?t1=v1&tr=h-300,w-400"
    assert_equal(expected, url)
  end

  def test_should_generate_the_correct_url_when_the_provided_path_contains_multiple_leading_slashes
    transformation = [
      Imagekit::Models::Transformation.new(
        height: 300.0,
        width: 400.0
      )
    ]

    url = @client.helper.build_url(
      Imagekit::Models::SrcOptions.new(
        src: "///test_path.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path.jpg?tr=h-300,w-400"
    assert_equal(expected, url)
  end

  def test_should_generate_the_correct_url_when_the_url_endpoint_is_overridden
    transformation = [
      Imagekit::Models::Transformation.new(
        height: 300.0,
        width: 400.0
      )
    ]

    url = @client.helper.build_url(
      Imagekit::Models::SrcOptions.new(
        src: "/test_path.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint_alt",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint_alt/test_path.jpg?tr=h-300,w-400"
    assert_equal(expected, url)
  end

  def test_should_generate_the_correct_url_with_transformation_position_as_query_parameter_when_src_is_provided
    transformation = [
      Imagekit::Models::Transformation.new(
        height: 300.0,
        width: 400.0
      )
    ]

    url = @client.helper.build_url(
      Imagekit::Models::SrcOptions.new(
        src: "/test_path.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path.jpg?tr=h-300,w-400"
    assert_equal(expected, url)
  end

  def test_should_generate_the_correct_url_with_a_valid_src_parameter_and_transformation
    transformation = [
      Imagekit::Models::Transformation.new(
        height: 300.0,
        width: 400.0
      )
    ]

    url = @client.helper.build_url(
      Imagekit::Models::SrcOptions.new(
        src: "https://ik.imagekit.io/test_url_endpoint/test_path_alt.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path_alt.jpg?tr=h-300,w-400"
    assert_equal(expected, url)
  end

  def test_should_merge_query_parameters_correctly_in_the_generated_url
    transformation = [
      Imagekit::Models::Transformation.new(
        height: 300.0,
        width: 400.0
      )
    ]

    query_parameters = {
      t2: "v2",
      t3: "v3"
    }

    url = @client.helper.build_url(
      Imagekit::Models::SrcOptions.new(
        src: "https://ik.imagekit.io/test_url_endpoint/test_path_alt.jpg?t1=v1",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        query_parameters: query_parameters,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path_alt.jpg?t1=v1&t2=v2&t3=v3&tr=h-300,w-400"
    assert_equal(expected, url)
  end

  def test_should_generate_the_correct_url_with_chained_transformations
    transformation = [
      Imagekit::Models::Transformation.new(
        height: 300.0,
        width: 400.0
      ),
      Imagekit::Models::Transformation.new(
        rotation: 90.0
      )
    ]

    url = @client.helper.build_url(
      Imagekit::Models::SrcOptions.new(
        src: "/test_path.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path.jpg?tr=h-300,w-400:rt-90"
    assert_equal(expected, url)
  end

  def test_should_generate_the_correct_url_with_chained_transformations_including_raw_transformation
    transformation = [
      Imagekit::Models::Transformation.new(
        height: 300.0,
        width: 400.0
      ),
      Imagekit::Models::Transformation.new(
        raw: "rndm_trnsf-abcd"
      )
    ]

    url = @client.helper.build_url(
      Imagekit::Models::SrcOptions.new(
        src: "/test_path.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path.jpg?tr=h-300,w-400:rndm_trnsf-abcd"
    assert_equal(expected, url)
  end

  def test_should_generate_the_correct_url_when_border_transformation_is_applied
    transformation = [
      Imagekit::Models::Transformation.new(
        height: 300.0,
        width: 400.0,
        border: "20_FF0000"
      )
    ]

    url = @client.helper.build_url(
      Imagekit::Models::SrcOptions.new(
        src: "/test_path.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path.jpg?tr=h-300,w-400,b-20_FF0000"
    assert_equal(expected, url)
  end

  def test_should_generate_the_correct_url_when_transformation_has_empty_key_and_value
    transformation = [
      Imagekit::Models::Transformation.new(
        raw: ""
      )
    ]

    url = @client.helper.build_url(
      Imagekit::Models::SrcOptions.new(
        src: "/test_path.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/test_path.jpg"
    assert_equal(expected, url)
  end

  def test_should_generate_a_valid_url_when_cname_is_used
    url = @client.helper.build_url(
      Imagekit::Models::SrcOptions.new(
        src: "/test_path.jpg",
        url_endpoint: "https://custom.domain.com",
        transformation_position: :query
      )
    )

    expected = "https://custom.domain.com/test_path.jpg"
    assert_equal(expected, url)
  end

  def test_should_generate_a_valid_url_when_cname_with_path_is_used
    url = @client.helper.build_url(
      Imagekit::Models::SrcOptions.new(
        src: "/test_path.jpg",
        url_endpoint: "https://custom.domain.com/url-pattern",
        transformation_position: :query
      )
    )

    expected = "https://custom.domain.com/url-pattern/test_path.jpg"
    assert_equal(expected, url)
  end
end
