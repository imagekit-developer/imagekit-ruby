# frozen_string_literal: true

require_relative "../../test_helper"

class BuildTransformationStringTest < Minitest::Test
  def setup
    @client = Imagekit::Client.new(
      private_key: "test-key"
    )
  end

  def test_should_return_empty_string_for_empty_transformation_array
    result = @client.helper.build_transformation_string(nil)
    assert_equal("", result)

    result = @client.helper.build_transformation_string([])
    assert_equal("", result)
  end

  def test_should_generate_transformation_string_for_width_only
    transformation = [
      Imagekit::Models::Transformation.new(
        width: 300.0
      )
    ]

    result = @client.helper.build_transformation_string(transformation)
    expected = "w-300"
    assert_equal(expected, result)
  end

  def test_should_generate_transformation_string_for_multiple_parameters
    transformation = [
      Imagekit::Models::Transformation.new(
        width: 300.0,
        height: 200.0
      )
    ]

    result = @client.helper.build_transformation_string(transformation)
    expected = "w-300,h-200"
    assert_equal(expected, result)
  end

  def test_should_generate_transformation_string_for_chained_transformations
    transformation = [
      Imagekit::Models::Transformation.new(
        width: 300.0
      ),
      Imagekit::Models::Transformation.new(
        height: 200.0
      )
    ]

    result = @client.helper.build_transformation_string(transformation)
    expected = "w-300:h-200"
    assert_equal(expected, result)
  end

  def test_should_handle_empty_transformation_object
    transformation = [
      Imagekit::Models::Transformation.new
    ]

    result = @client.helper.build_transformation_string(transformation)
    expected = ""
    assert_equal(expected, result)
  end

  def test_should_handle_transformation_with_overlay
    transformation = [
      Imagekit::Models::Transformation.new(
        overlay: Imagekit::Models::TextOverlay.new(
          text: "Hello"
        )
      )
    ]

    result = @client.helper.build_transformation_string(transformation)
    expected = "l-text,i-Hello,l-end"
    assert_equal(expected, result)
  end

  def test_should_handle_raw_transformation_parameter
    transformation = [
      Imagekit::Models::Transformation.new(
        raw: "custom-transform-123"
      )
    ]

    result = @client.helper.build_transformation_string(transformation)
    expected = "custom-transform-123"
    assert_equal(expected, result)
  end

  def test_should_handle_mixed_parameters_with_raw
    transformation = [
      Imagekit::Models::Transformation.new(
        width: 300.0,
        raw: "custom-param-123"
      )
    ]

    result = @client.helper.build_transformation_string(transformation)
    expected = "w-300,custom-param-123"
    assert_equal(expected, result)
  end

  def test_should_handle_quality_parameter
    transformation = [
      Imagekit::Models::Transformation.new(
        quality: 80.0
      )
    ]

    result = @client.helper.build_transformation_string(transformation)
    expected = "q-80"
    assert_equal(expected, result)
  end

  def test_should_handle_aspect_ratio_parameter
    transformation = [
      Imagekit::Models::Transformation.new(
        aspect_ratio: "4:3"
      )
    ]

    result = @client.helper.build_transformation_string(transformation)
    expected = "ar-4:3"
    assert_equal(expected, result)
  end
end
