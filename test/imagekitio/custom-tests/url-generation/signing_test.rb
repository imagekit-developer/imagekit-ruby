# frozen_string_literal: true

require_relative "../../test_helper"

class SigningTest < Minitest::Test
  def setup
    @client = Imagekitio::Client.new(
      private_key: "dummy-key"
    )
  end

  def test_should_generate_a_signed_url_when_signed_is_true_without_expires_in
    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "sdk-testing-files/future-search.png",
        url_endpoint: "https://ik.imagekit.io/demo/",
        signed: true
      )
    )

    expected = "https://ik.imagekit.io/demo/sdk-testing-files/future-search.png?ik-s=32dbbbfc5f945c0403c71b54c38e76896ef2d6b0"
    assert_equal(expected, url)
  end

  def test_should_generate_a_signed_url_when_signed_is_true_with_expires_in
    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "sdk-testing-files/future-search.png",
        url_endpoint: "https://ik.imagekit.io/demo/",
        signed: true,
        expires_in: 3600.0
      )
    )

    # Expect ik-t exist in the URL. We don't assert signature because it will keep changing.
    assert_includes(url, "ik-t")
  end

  def test_should_generate_a_signed_url_when_expires_in_is_above_0_and_even_if_signed_is_false
    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "sdk-testing-files/future-search.png",
        url_endpoint: "https://ik.imagekit.io/demo/",
        signed: false,
        expires_in: 3600.0
      )
    )

    # Expect ik-t exist in the URL. We don't assert signature because it will keep changing.
    assert_includes(url, "ik-t")
  end

  def test_should_generate_signed_url_with_special_characters_in_filename
    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "sdk-testing-files/हिन्दी.png",
        url_endpoint: "https://ik.imagekit.io/demo/",
        signed: true
      )
    )

    expected = "https://ik.imagekit.io/demo/sdk-testing-files/%E0%A4%B9%E0%A4%BF%E0%A4%A8%E0%A5%8D%E0%A4%A6%E0%A5%80.png?ik-s=3fff2f31da1f45e007adcdbe95f88c8c330e743c"
    assert_equal(expected, url)
  end

  def test_should_generate_signed_url_with_text_overlay_containing_special_characters
    transformation = [
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::TextOverlay.new(
          text: "हिन्दी",
          transformation: [
            Imagekitio::Models::TextOverlayTransformation.new(
              font_color: "red",
              font_size: "32",
              font_family: "sdk-testing-files/Poppins-Regular_Q15GrYWmL.ttf"
            )
          ]
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "sdk-testing-files/हिन्दी.png",
        url_endpoint: "https://ik.imagekit.io/demo/",
        transformation: transformation,
        signed: true
      )
    )

    expected = "https://ik.imagekit.io/demo/sdk-testing-files/%E0%A4%B9%E0%A4%BF%E0%A4%A8%E0%A5%8D%E0%A4%A6%E0%A5%80.png?tr=l-text,ie-4KS54KS%2F4KSo4KWN4KSm4KWA,co-red,fs-32,ff-sdk-testing-files@@Poppins-Regular_Q15GrYWmL.ttf,l-end&ik-s=ac9f24a03080102555e492185533c1ae6bd93fa7"
    assert_equal(expected, url)
  end

  def test_should_generate_signed_url_with_text_overlay_and_special_characters_using_path_transformation_position
    transformation = [
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::TextOverlay.new(
          text: "हिन्दी",
          transformation: [
            Imagekitio::Models::TextOverlayTransformation.new(
              font_color: "red",
              font_size: "32",
              font_family: "sdk-testing-files/Poppins-Regular_Q15GrYWmL.ttf"
            )
          ]
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "sdk-testing-files/हिन्दी.png",
        url_endpoint: "https://ik.imagekit.io/demo/",
        transformation_position: :path,
        transformation: transformation,
        signed: true
      )
    )

    expected = "https://ik.imagekit.io/demo/tr:l-text,ie-4KS54KS%2F4KSo4KWN4KSm4KWA,co-red,fs-32,ff-sdk-testing-files@@Poppins-Regular_Q15GrYWmL.ttf,l-end/sdk-testing-files/%E0%A4%B9%E0%A4%BF%E0%A4%A8%E0%A5%8D%E0%A4%A6%E0%A5%80.png?ik-s=69f2ecbb7364bbbad24616e1f7f1bac5a560fc71"
    assert_equal(expected, url)
  end

  def test_should_generate_signed_url_with_query_parameters
    query_params = {
      "version" => "1.0",
      "cache" => "false"
    }

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "sdk-testing-files/future-search.png",
        url_endpoint: "https://ik.imagekit.io/demo/",
        query_parameters: query_params,
        signed: true
      )
    )

    expected = "https://ik.imagekit.io/demo/sdk-testing-files/future-search.png?version=1.0&cache=false&ik-s=f2e5a1b8b6a0b03fd63789dfc6413a94acef9fd8"
    assert_equal(expected, url)
  end

  def test_should_generate_signed_url_with_transformations_and_query_parameters
    transformation = [
      Imagekitio::Models::Transformation.new(
        width: 300.0,
        height: 200.0
      )
    ]

    query_params = {
      "version" => "2.0"
    }

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "sdk-testing-files/future-search.png",
        url_endpoint: "https://ik.imagekit.io/demo/",
        transformation: transformation,
        query_parameters: query_params,
        signed: true
      )
    )

    expected = "https://ik.imagekit.io/demo/sdk-testing-files/future-search.png?version=2.0&tr=w-300,h-200&ik-s=601d97a7834b7554f4dabf0d3fc3a219ceeb6b31"
    assert_equal(expected, url)
  end

  def test_should_not_sign_url_when_signed_is_false
    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "sdk-testing-files/future-search.png",
        url_endpoint: "https://ik.imagekit.io/demo/",
        signed: false
      )
    )

    expected = "https://ik.imagekit.io/demo/sdk-testing-files/future-search.png"
    assert_equal(expected, url)
    refute_includes(url, "ik-s=")
    refute_includes(url, "ik-t=")
  end

  def test_should_generate_signed_url_with_transformations_in_path_position_and_query_parameters
    transformation = [
      Imagekitio::Models::Transformation.new(
        width: 300.0,
        height: 200.0
      )
    ]

    query_params = {
      "version" => "2.0"
    }

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "sdk-testing-files/future-search.png",
        url_endpoint: "https://ik.imagekit.io/demo/",
        transformation: transformation,
        transformation_position: :path,
        query_parameters: query_params,
        signed: true
      )
    )

    expected = "https://ik.imagekit.io/demo/tr:w-300,h-200/sdk-testing-files/future-search.png?version=2.0&ik-s=dd1ee8f83d019bc59fd57a5fc4674a11eb8a3496"
    assert_equal(expected, url)
  end

  # Hash-based API test - verify that plain hashes work for signed URLs
  def test_should_work_with_plain_hashes_for_signed_url_with_transformations
    # Using plain hashes instead of model objects
    url = @client.helper.build_url(
      {
        src: "sdk-testing-files/future-search.png",
        url_endpoint: "https://ik.imagekit.io/demo/",
        transformation: [
          {
            width: 300,
            height: 200
          }
        ],
        query_parameters: {
          "version" => "2.0"
        },
        signed: true
      }
    )

    expected = "https://ik.imagekit.io/demo/sdk-testing-files/future-search.png?version=2.0&tr=w-300,h-200&ik-s=601d97a7834b7554f4dabf0d3fc3a219ceeb6b31"
    assert_equal(expected, url)
  end
end
