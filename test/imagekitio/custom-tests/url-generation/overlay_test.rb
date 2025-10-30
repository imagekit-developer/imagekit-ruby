# frozen_string_literal: true

require_relative "../../test_helper"

class OverlayTest < Minitest::Test
  def setup
    @client = Imagekitio::Client.new(
      private_key: "My Private API Key"
    )
  end

  # Basic overlay tests
  def test_should_ignore_overlay_when_type_property_is_missing
    transformation = [
      Imagekitio::Models::Transformation.new(
        width: 300.0
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/base-image.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :path,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/tr:w-300/base-image.jpg"
    assert_equal(expected, url)
  end

  def test_should_ignore_text_overlay_when_text_property_is_missing
    transformation = [
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::TextOverlay.new(
          text: ""
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/base-image.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :path,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/base-image.jpg"
    assert_equal(expected, url)
  end

  def test_should_ignore_image_overlay_when_input_property_is_missing
    transformation = [
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::ImageOverlay.new(
          input: ""
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/base-image.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :path,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/base-image.jpg"
    assert_equal(expected, url)
  end

  def test_should_ignore_video_overlay_when_input_property_is_missing
    transformation = [
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::VideoOverlay.new(
          input: ""
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/base-image.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :path,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/base-image.jpg"
    assert_equal(expected, url)
  end

  def test_should_ignore_subtitle_overlay_when_input_property_is_missing
    transformation = [
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::SubtitleOverlay.new(
          input: ""
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/base-image.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :path,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/base-image.jpg"
    assert_equal(expected, url)
  end

  def test_should_ignore_solid_color_overlay_when_color_property_is_missing
    transformation = [
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::SolidColorOverlay.new(
          color: ""
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/base-image.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :path,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/base-image.jpg"
    assert_equal(expected, url)
  end

  # Basic overlay functionality tests
  def test_should_generate_url_with_text_overlay_using_url_encoding
    transformation = [
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::TextOverlay.new(
          text: "Minimal Text"
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/base-image.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :path,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/tr:l-text,i-Minimal%20Text,l-end/base-image.jpg"
    assert_equal(expected, url)
  end

  def test_should_generate_url_with_image_overlay_from_input_file
    transformation = [
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::ImageOverlay.new(
          input: "logo.png"
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/base-image.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :path,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/tr:l-image,i-logo.png,l-end/base-image.jpg"
    assert_equal(expected, url)
  end

  def test_should_generate_url_with_video_overlay_from_input_file
    transformation = [
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::VideoOverlay.new(
          input: "play-pause-loop.mp4"
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/base-video.mp4",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :path,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/tr:l-video,i-play-pause-loop.mp4,l-end/base-video.mp4"
    assert_equal(expected, url)
  end

  def test_should_generate_url_with_subtitle_overlay_from_input_file
    transformation = [
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::SubtitleOverlay.new(
          input: "subtitle.srt"
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/base-video.mp4",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :path,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/tr:l-subtitle,i-subtitle.srt,l-end/base-video.mp4"
    assert_equal(expected, url)
  end

  def test_should_generate_url_with_solid_color_overlay_using_background_color
    transformation = [
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::SolidColorOverlay.new(
          color: "FF0000"
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/base-image.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :path,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/tr:l-image,i-ik_canvas,bg-FF0000,l-end/base-image.jpg"
    assert_equal(expected, url)
  end

  def test_should_generate_url_with_multiple_complex_overlays_including_nested_transformations
    transformation = [
      # Text overlay
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::TextOverlay.new(
          text: "Every thing",
          position: Imagekitio::Models::OverlayPosition.new(
            x: "10",
            y_: "20",
            focus: :center
          ),
          timing: Imagekitio::Models::OverlayTiming.new(
            start: 5.0,
            duration: "10",
            end_: 15.0
          ),
          transformation: [
            Imagekitio::Models::TextOverlayTransformation.new(
              width: "bw_mul_0.5",
              font_size: 20.0,
              font_family: "Arial",
              font_color: "0000ff",
              inner_alignment: :left,
              padding: 5.0,
              alpha: 7.0,
              typography: "b",
              background: "red",
              radius: 10.0,
              rotation: "N45",
              flip: :h,
              line_height: 20.0
            )
          ]
        )
      ),
      # Image overlay
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::ImageOverlay.new(
          input: "logo.png",
          position: Imagekitio::Models::OverlayPosition.new(
            x: "10",
            y_: "20",
            focus: :center
          ),
          timing: Imagekitio::Models::OverlayTiming.new(
            start: 5.0,
            duration: "10",
            end_: 15.0
          ),
          transformation: [
            Imagekitio::Models::Transformation.new(
              width: "bw_mul_0.5",
              height: "bh_mul_0.5",
              rotation: "N45",
              flip: :h,
              overlay: Imagekitio::Models::TextOverlay.new(
                text: "Nested text overlay"
              )
            )
          ]
        )
      ),
      # Video overlay
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::VideoOverlay.new(
          input: "play-pause-loop.mp4",
          position: Imagekitio::Models::OverlayPosition.new(
            x: "10",
            y_: "20",
            focus: :center
          ),
          timing: Imagekitio::Models::OverlayTiming.new(
            start: 5.0,
            duration: "10",
            end_: 15.0
          ),
          transformation: [
            Imagekitio::Models::Transformation.new(
              width: "bw_mul_0.5",
              height: "bh_mul_0.5",
              rotation: "N45",
              flip: :h
            )
          ]
        )
      ),
      # Subtitle overlay
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::SubtitleOverlay.new(
          input: "subtitle.srt",
          position: Imagekitio::Models::OverlayPosition.new(
            x: "10",
            y_: "20",
            focus: :center
          ),
          timing: Imagekitio::Models::OverlayTiming.new(
            start: 5.0,
            duration: "10",
            end_: 15.0
          ),
          transformation: [
            Imagekitio::Models::SubtitleOverlayTransformation.new(
              background: "red",
              color: "0000ff",
              font_family: "Arial",
              font_outline: "2_A1CCDD50",
              font_shadow: "A1CCDD_3"
            )
          ]
        )
      ),
      # Solid color overlay
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::SolidColorOverlay.new(
          color: "FF0000",
          position: Imagekitio::Models::OverlayPosition.new(
            x: "10",
            y_: "20",
            focus: :center
          ),
          timing: Imagekitio::Models::OverlayTiming.new(
            start: 5.0,
            duration: "10",
            end_: 15.0
          ),
          transformation: [
            Imagekitio::Models::SolidColorOverlayTransformation.new(
              width: "bw_mul_0.5",
              height: "bh_mul_0.5",
              alpha: 0.5,
              background: "red",
              gradient: true,
              radius: :max
            )
          ]
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/base-image.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :path,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/tr:l-text,i-Every%20thing,lx-10,ly-20,lfo-center,lso-5,leo-15,ldu-10,w-bw_mul_0.5,fs-20,ff-Arial,co-0000ff,ia-left,pa-5,al-7,tg-b,bg-red,r-10,rt-N45,fl-h,lh-20,l-end:l-image,i-logo.png,lx-10,ly-20,lfo-center,lso-5,leo-15,ldu-10,w-bw_mul_0.5,h-bh_mul_0.5,rt-N45,fl-h,l-text,i-Nested%20text%20overlay,l-end,l-end:l-video,i-play-pause-loop.mp4,lx-10,ly-20,lfo-center,lso-5,leo-15,ldu-10,w-bw_mul_0.5,h-bh_mul_0.5,rt-N45,fl-h,l-end:l-subtitle,i-subtitle.srt,lx-10,ly-20,lfo-center,lso-5,leo-15,ldu-10,bg-red,co-0000ff,ff-Arial,fol-2_A1CCDD50,fsh-A1CCDD_3,l-end:l-image,i-ik_canvas,bg-FF0000,lx-10,ly-20,lfo-center,lso-5,leo-15,ldu-10,w-bw_mul_0.5,h-bh_mul_0.5,al-0.5,bg-red,e-gradient,r-max,l-end/base-image.jpg"
    assert_equal(expected, url)
  end

  # Overlay encoding tests
  def test_should_use_plain_encoding_for_simple_image_paths_with_slashes_converted_to_double_at
    transformation = [
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::ImageOverlay.new(
          input: "/customer_logo/nykaa.png"
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/medium_cafe_B1iTdD0C.jpg",
        url_endpoint: "https://ik.imagekit.io/demo",
        transformation_position: :path,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/demo/tr:l-image,i-customer_logo@@nykaa.png,l-end/medium_cafe_B1iTdD0C.jpg"
    assert_equal(expected, url)
  end

  def test_should_use_base64_encoding_for_image_paths_containing_special_characters
    transformation = [
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::ImageOverlay.new(
          input: "/customer_logo/Ñykaa.png"
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/medium_cafe_B1iTdD0C.jpg",
        url_endpoint: "https://ik.imagekit.io/demo",
        transformation_position: :path,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/demo/tr:l-image,ie-Y3VzdG9tZXJfbG9nby%2FDkXlrYWEucG5n,l-end/medium_cafe_B1iTdD0C.jpg"
    assert_equal(expected, url)
  end

  def test_should_use_plain_encoding_for_simple_text_overlays
    transformation = [
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::TextOverlay.new(
          text: "Manu"
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/medium_cafe_B1iTdD0C.jpg",
        url_endpoint: "https://ik.imagekit.io/demo",
        transformation_position: :path,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/demo/tr:l-text,i-Manu,l-end/medium_cafe_B1iTdD0C.jpg"
    assert_equal(expected, url)
  end

  def test_should_convert_slashes_to_double_at_in_font_family_paths_for_custom_fonts
    transformation = [
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::TextOverlay.new(
          text: "Manu",
          transformation: [
            Imagekitio::Models::TextOverlayTransformation.new(
              font_family: "nested-path/Poppins-Regular_Q15GrYWmL.ttf"
            )
          ]
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/medium_cafe_B1iTdD0C.jpg",
        url_endpoint: "https://ik.imagekit.io/demo",
        transformation_position: :path,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/demo/tr:l-text,i-Manu,ff-nested-path@@Poppins-Regular_Q15GrYWmL.ttf,l-end/medium_cafe_B1iTdD0C.jpg"
    assert_equal(expected, url)
  end

  def test_should_use_url_encoding_for_text_overlays_with_spaces_and_safe_characters
    transformation = [
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::TextOverlay.new(
          text: "alnum123-._ "
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/medium_cafe_B1iTdD0C.jpg",
        url_endpoint: "https://ik.imagekit.io/demo",
        transformation_position: :path,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/demo/tr:l-text,i-alnum123-._%20,l-end/medium_cafe_B1iTdD0C.jpg"
    assert_equal(expected, url)
  end

  def test_should_use_base64_encoding_for_text_overlays_with_special_unicode_characters
    transformation = [
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::TextOverlay.new(
          text: "Let's use ©, ®, ™, etc"
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/medium_cafe_B1iTdD0C.jpg",
        url_endpoint: "https://ik.imagekit.io/demo",
        transformation_position: :path,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/demo/tr:l-text,ie-TGV0J3MgdXNlIMKpLCDCriwg4oSiLCBldGM%3D,l-end/medium_cafe_B1iTdD0C.jpg"
    assert_equal(expected, url)
  end

  def test_should_use_plain_encoding_when_explicitly_specified_for_text_overlay
    transformation = [
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::TextOverlay.new(
          text: "HelloWorld",
          encoding: :plain
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/sample.jpg",
        url_endpoint: "https://ik.imagekit.io/demo",
        transformation_position: :path,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/demo/tr:l-text,i-HelloWorld,l-end/sample.jpg"
    assert_equal(expected, url)
  end

  def test_should_use_base64_encoding_when_explicitly_specified_for_text_overlay
    transformation = [
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::TextOverlay.new(
          text: "HelloWorld",
          encoding: :base64
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/sample.jpg",
        url_endpoint: "https://ik.imagekit.io/demo",
        transformation_position: :path,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/demo/tr:l-text,ie-SGVsbG9Xb3JsZA%3D%3D,l-end/sample.jpg"
    assert_equal(expected, url)
  end

  def test_should_use_plain_encoding_when_explicitly_specified_for_image_overlay
    transformation = [
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::ImageOverlay.new(
          input: "/customer/logo.png",
          encoding: :plain
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/sample.jpg",
        url_endpoint: "https://ik.imagekit.io/demo",
        transformation_position: :path,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/demo/tr:l-image,i-customer@@logo.png,l-end/sample.jpg"
    assert_equal(expected, url)
  end

  def test_should_use_base64_encoding_when_explicitly_specified_for_image_overlay
    transformation = [
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::ImageOverlay.new(
          input: "/customer/logo.png",
          encoding: :base64
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/sample.jpg",
        url_endpoint: "https://ik.imagekit.io/demo",
        transformation_position: :path,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/demo/tr:l-image,ie-Y3VzdG9tZXIvbG9nby5wbmc%3D,l-end/sample.jpg"
    assert_equal(expected, url)
  end

  def test_should_use_base64_encoding_when_explicitly_specified_for_video_overlay
    transformation = [
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::VideoOverlay.new(
          input: "/path/to/video.mp4",
          encoding: :base64
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/sample.mp4",
        url_endpoint: "https://ik.imagekit.io/demo",
        transformation_position: :path,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/demo/tr:l-video,ie-cGF0aC90by92aWRlby5tcDQ%3D,l-end/sample.mp4"
    assert_equal(expected, url)
  end

  def test_should_use_plain_encoding_when_explicitly_specified_for_subtitle_overlay
    transformation = [
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::SubtitleOverlay.new(
          input: "/sub.srt",
          encoding: :plain
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/sample.mp4",
        url_endpoint: "https://ik.imagekit.io/demo",
        transformation_position: :path,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/demo/tr:l-subtitle,i-sub.srt,l-end/sample.mp4"
    assert_equal(expected, url)
  end

  def test_should_use_base64_encoding_when_explicitly_specified_for_subtitle_overlay
    transformation = [
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::SubtitleOverlay.new(
          input: "sub.srt",
          encoding: :base64
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/sample.mp4",
        url_endpoint: "https://ik.imagekit.io/demo",
        transformation_position: :path,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/demo/tr:l-subtitle,ie-c3ViLnNydA%3D%3D,l-end/sample.mp4"
    assert_equal(expected, url)
  end

  def test_should_properly_encode_overlay_text_when_transformations_are_in_query_parameters
    transformation = [
      Imagekitio::Models::Transformation.new(
        overlay: Imagekitio::Models::TextOverlay.new(
          text: "Minimal Text"
        )
      )
    ]

    url = @client.helper.build_url(
      Imagekitio::Models::SrcOptions.new(
        src: "/sample.jpg",
        url_endpoint: "https://ik.imagekit.io/demo",
        transformation_position: :query,
        transformation: transformation
      )
    )

    expected = "https://ik.imagekit.io/demo/sample.jpg?tr=l-text,i-Minimal%20Text,l-end"
    assert_equal(expected, url)
  end

  # Hash-based API test - verify that plain hashes work for overlays
  def test_should_work_with_plain_hashes_for_text_overlay
    # Using plain hashes for everything including overlay
    url = @client.helper.build_url(
      {
        src: "/base-image.jpg",
        url_endpoint: "https://ik.imagekit.io/test_url_endpoint",
        transformation_position: :path,
        transformation: [
          {
            width: 300,
            height: 200,
            overlay: {
              type: :text,
              text: "Hello World",
              position: {
                x: "10",
                y_: "20",
                focus: :center
              },
              transformation: [
                {
                  font_size: 20,
                  font_color: "FF0000"
                }
              ]
            }
          }
        ]
      }
    )

    expected = "https://ik.imagekit.io/test_url_endpoint/tr:w-300,h-200,l-text,i-Hello%20World,lx-10,ly-20,lfo-center,fs-20,co-FF0000,l-end/base-image.jpg"
    assert_equal(expected, url)
  end
end
