# frozen_string_literal: true

require_relative "../test_helper"

class ResponsiveImageAttributesTest < Minitest::Test
  def setup
    @client = Imagekitio::Client.new(
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
      transformation: [Imagekitio::Models::Transformation.new(height: 300.0)]
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
        Imagekitio::Models::Transformation.new(height: 300.0),
        Imagekitio::Models::Transformation.new(ai_remove_background: true)
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
        Imagekitio::Models::Transformation.new(height: 300),
        Imagekitio::Models::Transformation.new(ai_remove_background: true)
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

  # Hash-based API test - verify that plain hashes work for responsive image attributes
  def test_should_work_with_plain_hashes_for_responsive_image_attributes
    # Using plain hashes instead of model objects
    result = @client.helper.get_responsive_image_attributes(
      {
        src: "sample.jpg",
        url_endpoint: "https://ik.imagekit.io/demo",
        width: 450,
        transformation: [
          {
            height: 300
          },
          {
            ai_remove_background: true
          }
        ]
      }
    )

    # Multiple caller transformations should be combined appropriately
    expected = {
      src: "https://ik.imagekit.io/demo/sample.jpg?tr=h-300:e-bgremove:w-1080,c-at_max",
      src_set: "https://ik.imagekit.io/demo/sample.jpg?tr=h-300:e-bgremove:w-640,c-at_max 1x, https://ik.imagekit.io/demo/sample.jpg?tr=h-300:e-bgremove:w-1080,c-at_max 2x",
      sizes: nil,
      width: 450
    }

    assert_equal(expected, result.to_h)
  end

  # Test to verify that srcset uses integer descriptors (640w) not float (640.0w)
  # This tests both model object and hash approaches
  def test_should_use_integer_descriptors_in_srcset_with_model_object
    # Using GetImageAttributesOptions model with Float array (as defined in schema)
    result = @client.helper.get_responsive_image_attributes(
      Imagekitio::Models::GetImageAttributesOptions.new(
        src: "sample.jpg",
        url_endpoint: "https://ik.imagekit.io/demo",
        device_breakpoints: [320.0, 640.0, 1280.0], # SDK converts to floats
        image_breakpoints: []
      )
    )

    src_set = result.src_set

    # Should have integer descriptors like "320w", NOT "320.0w"
    assert_includes(src_set, "320w")
    assert_includes(src_set, "640w")
    assert_includes(src_set, "1280w")

    # Should NOT have float descriptors
    refute_includes(src_set, "320.0w")
    refute_includes(src_set, "640.0w")
    refute_includes(src_set, "1280.0w")
  end

  def test_should_use_integer_descriptors_in_srcset_with_hash
    # Using plain hash with integer breakpoints
    result = @client.helper.get_responsive_image_attributes(
      {
        src: "sample.jpg",
        url_endpoint: "https://ik.imagekit.io/demo",
        device_breakpoints: [320, 640, 1280],
        image_breakpoints: []
      }
    )

    src_set = result.src_set

    # Should have integer descriptors like "320w", NOT "320.0w"
    assert_includes(src_set, "320w")
    assert_includes(src_set, "640w")
    assert_includes(src_set, "1280w")

    # Should NOT have float descriptors
    refute_includes(src_set, "320.0w")
    refute_includes(src_set, "640.0w")
    refute_includes(src_set, "1280.0w")
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

  # Test to verify signed URLs work correctly in responsive image attributes
  def test_should_generate_signed_urls_in_srcset
    result = @client.helper.get_responsive_image_attributes(
      {
        src: "sdk-testing-files/future-search.png",
        url_endpoint: "https://ik.imagekit.io/demo",
        device_breakpoints: [640, 1280],
        image_breakpoints: [],
        signed: true
      }
    )

    expected = {
      src: "https://ik.imagekit.io/demo/sdk-testing-files/future-search.png?tr=w-1280,c-at_max&ik-s=cce0258e8b27bee5d4b642bcee996c5fac11a907",
      src_set: "https://ik.imagekit.io/demo/sdk-testing-files/future-search.png?tr=w-640,c-at_max&ik-s=d326eadc97c62b0896dc1bb872355a47c8b71943 640w, https://ik.imagekit.io/demo/sdk-testing-files/future-search.png?tr=w-1280,c-at_max&ik-s=cce0258e8b27bee5d4b642bcee996c5fac11a907 1280w",
      sizes: "100vw",
      width: nil
    }

    assert_equal(expected, result.to_h)
  end
end
