# frozen_string_literal: true

require_relative "../test_helper"

class ResponsiveImageAttributesTest < Minitest::Test
  def setup
    @client = Imagekit::Client.new(
      private_key: "private_key_test",
      password: "test_password"
    )
  end

  def test_bare_minimum_input
    result = @client.helper.get_responsive_image_attributes(
      src: "sample.jpg",
      url_endpoint: "https://ik.imagekit.io/demo"
    )

    # Expected object based on default device_breakpoints and image_breakpoints
    expected = {
      src: "https://ik.imagekit.io/demo/sample.jpg?tr=w-3840,c-at_max",
      src_set: "https://ik.imagekit.io/demo/sample.jpg?tr=w-640,c-at_max 640w, https://ik.imagekit.io/demo/sample.jpg?tr=w-750,c-at_max 750w, https://ik.imagekit.io/demo/sample.jpg?tr=w-828,c-at_max 828w, https://ik.imagekit.io/demo/sample.jpg?tr=w-1080,c-at_max 1080w, https://ik.imagekit.io/demo/sample.jpg?tr=w-1200,c-at_max 1200w, https://ik.imagekit.io/demo/sample.jpg?tr=w-1920,c-at_max 1920w, https://ik.imagekit.io/demo/sample.jpg?tr=w-2048,c-at_max 2048w, https://ik.imagekit.io/demo/sample.jpg?tr=w-3840,c-at_max 3840w",
      sizes: "100vw",
      width: nil
    }

    assert_equal(expected, result.to_h)
  end

  def test_sizes_provided_100vw
    result = @client.helper.get_responsive_image_attributes(
      src: "sample.jpg",
      url_endpoint: "https://ik.imagekit.io/demo",
      sizes: "100vw"
    )

    # With a sizes value of "100vw", the function should use the same breakpoints as in the bare minimum case
    expected = {
      src: "https://ik.imagekit.io/demo/sample.jpg?tr=w-3840,c-at_max",
      src_set: "https://ik.imagekit.io/demo/sample.jpg?tr=w-640,c-at_max 640w, https://ik.imagekit.io/demo/sample.jpg?tr=w-750,c-at_max 750w, https://ik.imagekit.io/demo/sample.jpg?tr=w-828,c-at_max 828w, https://ik.imagekit.io/demo/sample.jpg?tr=w-1080,c-at_max 1080w, https://ik.imagekit.io/demo/sample.jpg?tr=w-1200,c-at_max 1200w, https://ik.imagekit.io/demo/sample.jpg?tr=w-1920,c-at_max 1920w, https://ik.imagekit.io/demo/sample.jpg?tr=w-2048,c-at_max 2048w, https://ik.imagekit.io/demo/sample.jpg?tr=w-3840,c-at_max 3840w",
      sizes: "100vw",
      width: nil
    }

    assert_equal(expected, result.to_h)
  end

  def test_width_only_dpr_strategy
    result = @client.helper.get_responsive_image_attributes(
      src: "sample.jpg",
      url_endpoint: "https://ik.imagekit.io/demo",
      width: 400
    )

    # When width is provided without sizes attribute, the DPR strategy should be used
    expected = {
      src: "https://ik.imagekit.io/demo/sample.jpg?tr=w-828,c-at_max",
      src_set: "https://ik.imagekit.io/demo/sample.jpg?tr=w-640,c-at_max 1x, https://ik.imagekit.io/demo/sample.jpg?tr=w-828,c-at_max 2x",
      sizes: nil,
      width: 400.0
    }

    assert_equal(expected, result.to_h)
  end

  def test_custom_breakpoints
    result = @client.helper.get_responsive_image_attributes(
      src: "sample.jpg",
      url_endpoint: "https://ik.imagekit.io/demo",
      device_breakpoints: [200, 400, 800],
      image_breakpoints: [100]
    )

    # For custom breakpoints, the breakpoints will be derived from the provided arrays
    expected = {
      src: "https://ik.imagekit.io/demo/sample.jpg?tr=w-800,c-at_max",
      src_set: "https://ik.imagekit.io/demo/sample.jpg?tr=w-200,c-at_max 200w, https://ik.imagekit.io/demo/sample.jpg?tr=w-400,c-at_max 400w, https://ik.imagekit.io/demo/sample.jpg?tr=w-800,c-at_max 800w",
      sizes: "100vw",
      width: nil
    }

    assert_equal(expected, result.to_h)
  end

  def test_preserves_caller_transformations
    result = @client.helper.get_responsive_image_attributes(
      src: "sample.jpg",
      url_endpoint: "https://ik.imagekit.io/demo",
      width: 500,
      transformation: [Imagekit::Models::Transformation.new(height: 300.0)]
    )

    # The provided transformation should be preserved in the output
    expected = {
      src: "https://ik.imagekit.io/demo/sample.jpg?tr=h-300:w-1080,c-at_max",
      src_set: "https://ik.imagekit.io/demo/sample.jpg?tr=h-300:w-640,c-at_max 1x, https://ik.imagekit.io/demo/sample.jpg?tr=h-300:w-1080,c-at_max 2x",
      sizes: nil,
      width: 500.0
    }

    assert_equal(expected, result.to_h)
  end

  def test_both_sizes_and_width_passed
    result = @client.helper.get_responsive_image_attributes(
      src: "sample.jpg",
      url_endpoint: "https://ik.imagekit.io/demo",
      sizes: "50vw",
      width: 600
    )

    # Both sizes and width are provided, so the function should apply the sizes attribute while using width for DPR strategy
    expected = {
      src: "https://ik.imagekit.io/demo/sample.jpg?tr=w-3840,c-at_max",
      src_set: "https://ik.imagekit.io/demo/sample.jpg?tr=w-384,c-at_max 384w, https://ik.imagekit.io/demo/sample.jpg?tr=w-640,c-at_max 640w, https://ik.imagekit.io/demo/sample.jpg?tr=w-750,c-at_max 750w, https://ik.imagekit.io/demo/sample.jpg?tr=w-828,c-at_max 828w, https://ik.imagekit.io/demo/sample.jpg?tr=w-1080,c-at_max 1080w, https://ik.imagekit.io/demo/sample.jpg?tr=w-1200,c-at_max 1200w, https://ik.imagekit.io/demo/sample.jpg?tr=w-1920,c-at_max 1920w, https://ik.imagekit.io/demo/sample.jpg?tr=w-2048,c-at_max 2048w, https://ik.imagekit.io/demo/sample.jpg?tr=w-3840,c-at_max 3840w",
      sizes: "50vw",
      width: 600.0
    }

    assert_equal(expected, result.to_h)
  end

  def test_multiple_transformations
    result = @client.helper.get_responsive_image_attributes(
      src: "sample.jpg",
      url_endpoint: "https://ik.imagekit.io/demo",
      width: 450,
      transformation: [
        Imagekit::Models::Transformation.new(height: 300.0),
        Imagekit::Models::Transformation.new(ai_remove_background: true)
      ]
    )

    # Multiple caller transformations should be combined appropriately
    expected = {
      src: "https://ik.imagekit.io/demo/sample.jpg?tr=h-300:e-bgremove:w-1080,c-at_max",
      src_set: "https://ik.imagekit.io/demo/sample.jpg?tr=h-300:e-bgremove:w-640,c-at_max 1x, https://ik.imagekit.io/demo/sample.jpg?tr=h-300:e-bgremove:w-1080,c-at_max 2x",
      sizes: nil,
      width: 450.0
    }

    assert_equal(expected, result.to_h)
  end

  def test_sizes_causes_breakpoint_pruning_33vw_path
    result = @client.helper.get_responsive_image_attributes(
      src: "sample.jpg",
      url_endpoint: "https://ik.imagekit.io/demo",
      sizes: "(min-width: 800px) 33vw, 100vw"
    )

    # When specified with a sizes attribute that prunes breakpoints, the output should reflect the pruned values
    expected = {
      src: "https://ik.imagekit.io/demo/sample.jpg?tr=w-3840,c-at_max",
      src_set: "https://ik.imagekit.io/demo/sample.jpg?tr=w-256,c-at_max 256w, https://ik.imagekit.io/demo/sample.jpg?tr=w-384,c-at_max 384w, https://ik.imagekit.io/demo/sample.jpg?tr=w-640,c-at_max 640w, https://ik.imagekit.io/demo/sample.jpg?tr=w-750,c-at_max 750w, https://ik.imagekit.io/demo/sample.jpg?tr=w-828,c-at_max 828w, https://ik.imagekit.io/demo/sample.jpg?tr=w-1080,c-at_max 1080w, https://ik.imagekit.io/demo/sample.jpg?tr=w-1200,c-at_max 1200w, https://ik.imagekit.io/demo/sample.jpg?tr=w-1920,c-at_max 1920w, https://ik.imagekit.io/demo/sample.jpg?tr=w-2048,c-at_max 2048w, https://ik.imagekit.io/demo/sample.jpg?tr=w-3840,c-at_max 3840w",
      sizes: "(min-width: 800px) 33vw, 100vw",
      width: nil
    }

    assert_equal(expected, result.to_h)
  end

  def test_using_query_parameters_and_transformation_position
    result = @client.helper.get_responsive_image_attributes(
      src: "sample.jpg",
      url_endpoint: "https://ik.imagekit.io/demo",
      width: 450,
      transformation: [
        Imagekit::Models::Transformation.new(height: 300),
        Imagekit::Models::Transformation.new(ai_remove_background: true)
      ],
      query_parameters: {key: "value"},
      transformation_position: :path
    )

    # The function should respect the transformation position and query parameters
    expected = {
      src: "https://ik.imagekit.io/demo/tr:h-300:e-bgremove:w-1080,c-at_max/sample.jpg?key=value",
      src_set: "https://ik.imagekit.io/demo/tr:h-300:e-bgremove:w-640,c-at_max/sample.jpg?key=value 1x, https://ik.imagekit.io/demo/tr:h-300:e-bgremove:w-1080,c-at_max/sample.jpg?key=value 2x",
      sizes: nil,
      width: 450.0
    }

    assert_equal(expected, result.to_h)
  end

  def test_fallback_when_no_usable_vw_tokens
    result = @client.helper.get_responsive_image_attributes(
      src: "sample.jpg",
      url_endpoint: "https://ik.imagekit.io/demo",
      sizes: "100%"
    )

    # When sizes has no vw tokens, all breakpoints should be used
    expected = {
      src: "https://ik.imagekit.io/demo/sample.jpg?tr=w-3840,c-at_max",
      src_set: "https://ik.imagekit.io/demo/sample.jpg?tr=w-16,c-at_max 16w, https://ik.imagekit.io/demo/sample.jpg?tr=w-32,c-at_max 32w, https://ik.imagekit.io/demo/sample.jpg?tr=w-48,c-at_max 48w, https://ik.imagekit.io/demo/sample.jpg?tr=w-64,c-at_max 64w, https://ik.imagekit.io/demo/sample.jpg?tr=w-96,c-at_max 96w, https://ik.imagekit.io/demo/sample.jpg?tr=w-128,c-at_max 128w, https://ik.imagekit.io/demo/sample.jpg?tr=w-256,c-at_max 256w, https://ik.imagekit.io/demo/sample.jpg?tr=w-384,c-at_max 384w, https://ik.imagekit.io/demo/sample.jpg?tr=w-640,c-at_max 640w, https://ik.imagekit.io/demo/sample.jpg?tr=w-750,c-at_max 750w, https://ik.imagekit.io/demo/sample.jpg?tr=w-828,c-at_max 828w, https://ik.imagekit.io/demo/sample.jpg?tr=w-1080,c-at_max 1080w, https://ik.imagekit.io/demo/sample.jpg?tr=w-1200,c-at_max 1200w, https://ik.imagekit.io/demo/sample.jpg?tr=w-1920,c-at_max 1920w, https://ik.imagekit.io/demo/sample.jpg?tr=w-2048,c-at_max 2048w, https://ik.imagekit.io/demo/sample.jpg?tr=w-3840,c-at_max 3840w",
      sizes: "100%",
      width: nil
    }

    assert_equal(expected, result.to_h)
  end
end
