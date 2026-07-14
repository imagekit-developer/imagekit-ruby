# frozen_string_literal: true

module Imagekitio
  module Models
    module Accounts
      # @see Imagekitio::Resources::Accounts::UsageAnalytics#get
      class UsageAnalyticsResponse < Imagekitio::Internal::Type::BaseModel
        # @!attribute bandwidth_bytes
        #   Total bandwidth, in bytes, utilized during the specified date range.
        #
        #   @return [Float]
        required :bandwidth_bytes, Float, api_name: :bandwidthBytes

        # @!attribute browser
        #   CDN traffic grouped by browser.
        #
        #   @return [Imagekitio::Models::Accounts::UsageAnalyticsResponse::Browser]
        required :browser, -> { Imagekitio::Accounts::UsageAnalyticsResponse::Browser }

        # @!attribute cache
        #   CDN cache hit, miss and error counts for the date range.
        #
        #   @return [Imagekitio::Models::Accounts::UsageAnalyticsResponse::Cache]
        required :cache, -> { Imagekitio::Accounts::UsageAnalyticsResponse::Cache }

        # @!attribute country
        #   CDN traffic grouped by country.
        #
        #   @return [Imagekitio::Models::Accounts::UsageAnalyticsResponse::Country]
        required :country, -> { Imagekitio::Accounts::UsageAnalyticsResponse::Country }

        # @!attribute device
        #   CDN traffic grouped by device and operating system (e.g. `Desktop - Apple Mac`,
        #   `Smartphone - Apple iPhone`).
        #
        #   @return [Imagekitio::Models::Accounts::UsageAnalyticsResponse::Device]
        required :device, -> { Imagekitio::Accounts::UsageAnalyticsResponse::Device }

        # @!attribute end_date
        #   End date of the computed analytics data.
        #
        #   @return [Date]
        required :end_date, Date, api_name: :endDate

        # @!attribute error_reasons
        #   Request count grouped by origin error reason. This covers failed origin fetches,
        #   such as an asset not found at origin or an origin timeout. It is not the HTTP
        #   status code returned to the client, see `statusCodes` for that.
        #
        #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::ErrorReason>]
        required :error_reasons,
                 -> {
                   Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::ErrorReason]
                 },
                 api_name: :errorReasons

        # @!attribute extensions
        #   Raw per-extension operation counts for the date range. These are raw operation
        #   counts, not billable extension units. For billable usage, use the
        #   `/v1/accounts/usage` endpoint.
        #
        #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::Extension>]
        required :extensions,
                 -> { Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::Extension] }

        # @!attribute format_
        #   CDN traffic grouped by response `Content-Type`.
        #
        #   @return [Imagekitio::Models::Accounts::UsageAnalyticsResponse::Format]
        required :format_, -> { Imagekitio::Accounts::UsageAnalyticsResponse::Format }, api_name: :format

        # @!attribute generated_at
        #   Date and time when the analytics data was computed. Use this to gauge how fresh
        #   the returned data is. The date and time is in ISO8601 format.
        #
        #   @return [Time]
        required :generated_at, Time, api_name: :generatedAt

        # @!attribute request_count
        #   Total number of requests made during the specified date range.
        #
        #   @return [Float]
        required :request_count, Float, api_name: :requestCount

        # @!attribute start_date
        #   Start date of the computed analytics data.
        #
        #   @return [Date]
        required :start_date, Date, api_name: :startDate

        # @!attribute status_codes
        #   Request count grouped by HTTP status code.
        #
        #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::StatusCode>]
        required :status_codes,
                 -> {
                   Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::StatusCode]
                 },
                 api_name: :statusCodes

        # @!attribute top404_assets
        #   Top URLs that returned a 404 response.
        #
        #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::Top404Asset>]
        required :top404_assets,
                 -> {
                   Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::Top404Asset]
                 },
                 api_name: :top404Assets

        # @!attribute top_images
        #   Top image assets by traffic.
        #
        #   @return [Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopImages]
        required :top_images,
                 -> {
                   Imagekitio::Accounts::UsageAnalyticsResponse::TopImages
                 },
                 api_name: :topImages

        # @!attribute top_image_transforms
        #   Top image transformation strings by traffic.
        #
        #   @return [Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopImageTransforms]
        required :top_image_transforms,
                 -> { Imagekitio::Accounts::UsageAnalyticsResponse::TopImageTransforms },
                 api_name: :topImageTransforms

        # @!attribute top_other_assets
        #   Top non-image, non-video assets by traffic.
        #
        #   @return [Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopOtherAssets]
        required :top_other_assets,
                 -> { Imagekitio::Accounts::UsageAnalyticsResponse::TopOtherAssets },
                 api_name: :topOtherAssets

        # @!attribute top_referrers
        #   Top HTTP referrers by traffic.
        #
        #   @return [Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopReferrers]
        required :top_referrers,
                 -> { Imagekitio::Accounts::UsageAnalyticsResponse::TopReferrers },
                 api_name: :topReferrers

        # @!attribute top_user_agents
        #   Top user agents by traffic.
        #
        #   @return [Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopUserAgents]
        required :top_user_agents,
                 -> { Imagekitio::Accounts::UsageAnalyticsResponse::TopUserAgents },
                 api_name: :topUserAgents

        # @!attribute top_videos
        #   Top video assets by traffic.
        #
        #   @return [Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopVideos]
        required :top_videos,
                 -> {
                   Imagekitio::Accounts::UsageAnalyticsResponse::TopVideos
                 },
                 api_name: :topVideos

        # @!attribute top_video_transforms
        #   Top video transformation strings by traffic.
        #
        #   @return [Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopVideoTransforms]
        required :top_video_transforms,
                 -> { Imagekitio::Accounts::UsageAnalyticsResponse::TopVideoTransforms },
                 api_name: :topVideoTransforms

        # @!attribute url_endpoints
        #   CDN traffic grouped by configured URL endpoint. Traffic that does not match any
        #   named URL endpoint pattern is grouped under `Default`.
        #
        #   @return [Imagekitio::Models::Accounts::UsageAnalyticsResponse::URLEndpoints]
        required :url_endpoints,
                 -> { Imagekitio::Accounts::UsageAnalyticsResponse::URLEndpoints },
                 api_name: :urlEndpoints

        # @!attribute video_processing
        #   Raw observed video transcode output duration, in seconds, grouped by resolution
        #   and codec. These are raw seconds, not billable Video Processing Units (VPU). For
        #   billable VPU totals, use the `/v1/accounts/usage` endpoint.
        #
        #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::VideoProcessing>]
        required :video_processing,
                 -> {
                   Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::VideoProcessing]
                 },
                 api_name: :videoProcessing

        # @!method initialize(bandwidth_bytes:, browser:, cache:, country:, device:, end_date:, error_reasons:, extensions:, format_:, generated_at:, request_count:, start_date:, status_codes:, top404_assets:, top_images:, top_image_transforms:, top_other_assets:, top_referrers:, top_user_agents:, top_videos:, top_video_transforms:, url_endpoints:, video_processing:)
        #   Some parameter documentations has been truncated, see
        #   {Imagekitio::Models::Accounts::UsageAnalyticsResponse} for more details.
        #
        #   @param bandwidth_bytes [Float] Total bandwidth, in bytes, utilized during the specified date range.
        #
        #   @param browser [Imagekitio::Models::Accounts::UsageAnalyticsResponse::Browser] CDN traffic grouped by browser.
        #
        #   @param cache [Imagekitio::Models::Accounts::UsageAnalyticsResponse::Cache] CDN cache hit, miss and error counts for the date range.
        #
        #   @param country [Imagekitio::Models::Accounts::UsageAnalyticsResponse::Country] CDN traffic grouped by country.
        #
        #   @param device [Imagekitio::Models::Accounts::UsageAnalyticsResponse::Device] CDN traffic grouped by device and operating system (e.g. `Desktop - Apple Mac`,
        #
        #   @param end_date [Date] End date of the computed analytics data.
        #
        #   @param error_reasons [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::ErrorReason>] Request count grouped by origin error reason. This covers failed origin fetches,
        #
        #   @param extensions [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::Extension>] Raw per-extension operation counts for the date range. These are raw operation c
        #
        #   @param format_ [Imagekitio::Models::Accounts::UsageAnalyticsResponse::Format] CDN traffic grouped by response `Content-Type`.
        #
        #   @param generated_at [Time] Date and time when the analytics data was computed. Use this to gauge how fresh
        #
        #   @param request_count [Float] Total number of requests made during the specified date range.
        #
        #   @param start_date [Date] Start date of the computed analytics data.
        #
        #   @param status_codes [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::StatusCode>] Request count grouped by HTTP status code.
        #
        #   @param top404_assets [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::Top404Asset>] Top URLs that returned a 404 response.
        #
        #   @param top_images [Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopImages] Top image assets by traffic.
        #
        #   @param top_image_transforms [Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopImageTransforms] Top image transformation strings by traffic.
        #
        #   @param top_other_assets [Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopOtherAssets] Top non-image, non-video assets by traffic.
        #
        #   @param top_referrers [Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopReferrers] Top HTTP referrers by traffic.
        #
        #   @param top_user_agents [Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopUserAgents] Top user agents by traffic.
        #
        #   @param top_videos [Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopVideos] Top video assets by traffic.
        #
        #   @param top_video_transforms [Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopVideoTransforms] Top video transformation strings by traffic.
        #
        #   @param url_endpoints [Imagekitio::Models::Accounts::UsageAnalyticsResponse::URLEndpoints] CDN traffic grouped by configured URL endpoint. Traffic that does not match any
        #
        #   @param video_processing [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::VideoProcessing>] Raw observed video transcode output duration, in seconds, grouped by resolution

        # @see Imagekitio::Models::Accounts::UsageAnalyticsResponse#browser
        class Browser < Imagekitio::Internal::Type::BaseModel
          # @!attribute by_bandwidth
          #   Top browsers sorted by bandwidth utilized.
          #
          #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::Browser::ByBandwidth>]
          required :by_bandwidth,
                   -> {
                     Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::Browser::ByBandwidth]
                   },
                   api_name: :byBandwidth

          # @!attribute by_requests
          #   Top browsers sorted by request count.
          #
          #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::Browser::ByRequest>]
          required :by_requests,
                   -> {
                     Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::Browser::ByRequest]
                   },
                   api_name: :byRequests

          # @!method initialize(by_bandwidth:, by_requests:)
          #   CDN traffic grouped by browser.
          #
          #   @param by_bandwidth [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::Browser::ByBandwidth>] Top browsers sorted by bandwidth utilized.
          #
          #   @param by_requests [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::Browser::ByRequest>] Top browsers sorted by request count.

          class ByBandwidth < Imagekitio::Models::Accounts::RequestBandwidthEntry
            # @!attribute name
            #   Browser name (e.g. `Chrome`).
            #
            #   @return [String]
            required :name, String

            # @!method initialize(name:)
            #   @param name [String] Browser name (e.g. `Chrome`).
          end

          class ByRequest < Imagekitio::Models::Accounts::RequestBandwidthEntry
            # @!attribute name
            #   Browser name (e.g. `Chrome`).
            #
            #   @return [String]
            required :name, String

            # @!method initialize(name:)
            #   @param name [String] Browser name (e.g. `Chrome`).
          end
        end

        # @see Imagekitio::Models::Accounts::UsageAnalyticsResponse#cache
        class Cache < Imagekitio::Internal::Type::BaseModel
          # @!attribute error_count
          #   Number of requests where the CDN encountered a cache error or exceeded capacity
          #   while serving the response.
          #
          #   @return [Float]
          required :error_count, Float, api_name: :errorCount

          # @!attribute hit_count
          #   Number of requests served from cache, including full hits and revalidated hits.
          #
          #   @return [Float]
          required :hit_count, Float, api_name: :hitCount

          # @!attribute miss_count
          #   Number of requests that were not found in cache and had to be fetched from
          #   origin.
          #
          #   @return [Float]
          required :miss_count, Float, api_name: :missCount

          # @!method initialize(error_count:, hit_count:, miss_count:)
          #   Some parameter documentations has been truncated, see
          #   {Imagekitio::Models::Accounts::UsageAnalyticsResponse::Cache} for more details.
          #
          #   CDN cache hit, miss and error counts for the date range.
          #
          #   @param error_count [Float] Number of requests where the CDN encountered a cache error or exceeded capacity
          #
          #   @param hit_count [Float] Number of requests served from cache, including full hits and revalidated hits.
          #
          #   @param miss_count [Float] Number of requests that were not found in cache and had to be fetched from origi
        end

        # @see Imagekitio::Models::Accounts::UsageAnalyticsResponse#country
        class Country < Imagekitio::Internal::Type::BaseModel
          # @!attribute by_bandwidth
          #   Top requesting countries sorted by total bandwidth utilized.
          #
          #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::Country::ByBandwidth>]
          required :by_bandwidth,
                   -> {
                     Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::Country::ByBandwidth]
                   },
                   api_name: :byBandwidth

          # @!attribute by_requests
          #   Top requesting countries sorted by request count.
          #
          #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::Country::ByRequest>]
          required :by_requests,
                   -> {
                     Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::Country::ByRequest]
                   },
                   api_name: :byRequests

          # @!method initialize(by_bandwidth:, by_requests:)
          #   CDN traffic grouped by country.
          #
          #   @param by_bandwidth [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::Country::ByBandwidth>] Top requesting countries sorted by total bandwidth utilized.
          #
          #   @param by_requests [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::Country::ByRequest>] Top requesting countries sorted by request count.

          class ByBandwidth < Imagekitio::Models::Accounts::RequestBandwidthEntry
            # @!attribute code
            #   ISO country code.
            #
            #   @return [String]
            required :code, String

            # @!attribute name
            #   Country name.
            #
            #   @return [String]
            required :name, String

            # @!method initialize(code:, name:)
            #   @param code [String] ISO country code.
            #
            #   @param name [String] Country name.
          end

          class ByRequest < Imagekitio::Models::Accounts::RequestBandwidthEntry
            # @!attribute code
            #   ISO country code.
            #
            #   @return [String]
            required :code, String

            # @!attribute name
            #   Country name.
            #
            #   @return [String]
            required :name, String

            # @!method initialize(code:, name:)
            #   @param code [String] ISO country code.
            #
            #   @param name [String] Country name.
          end
        end

        # @see Imagekitio::Models::Accounts::UsageAnalyticsResponse#device
        class Device < Imagekitio::Internal::Type::BaseModel
          # @!attribute by_bandwidth
          #   Top device/OS combinations sorted by bandwidth utilized.
          #
          #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::Device::ByBandwidth>]
          required :by_bandwidth,
                   -> {
                     Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::Device::ByBandwidth]
                   },
                   api_name: :byBandwidth

          # @!attribute by_requests
          #   Top device/OS combinations sorted by request count.
          #
          #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::Device::ByRequest>]
          required :by_requests,
                   -> {
                     Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::Device::ByRequest]
                   },
                   api_name: :byRequests

          # @!method initialize(by_bandwidth:, by_requests:)
          #   CDN traffic grouped by device and operating system (e.g. `Desktop - Apple Mac`,
          #   `Smartphone - Apple iPhone`).
          #
          #   @param by_bandwidth [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::Device::ByBandwidth>] Top device/OS combinations sorted by bandwidth utilized.
          #
          #   @param by_requests [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::Device::ByRequest>] Top device/OS combinations sorted by request count.

          class ByBandwidth < Imagekitio::Models::Accounts::RequestBandwidthEntry
            # @!attribute name
            #   Device category combined with operating system or vendor (e.g.
            #   `Desktop - Windows PC`).
            #
            #   @return [String]
            required :name, String

            # @!method initialize(name:)
            #   Some parameter documentations has been truncated, see
            #   {Imagekitio::Models::Accounts::UsageAnalyticsResponse::Device::ByBandwidth} for
            #   more details.
            #
            #   @param name [String] Device category combined with operating system or vendor (e.g. `Desktop - Window
          end

          class ByRequest < Imagekitio::Models::Accounts::RequestBandwidthEntry
            # @!attribute name
            #   Device category combined with operating system or vendor (e.g.
            #   `Desktop - Windows PC`).
            #
            #   @return [String]
            required :name, String

            # @!method initialize(name:)
            #   Some parameter documentations has been truncated, see
            #   {Imagekitio::Models::Accounts::UsageAnalyticsResponse::Device::ByRequest} for
            #   more details.
            #
            #   @param name [String] Device category combined with operating system or vendor (e.g. `Desktop - Window
          end
        end

        class ErrorReason < Imagekitio::Internal::Type::BaseModel
          # @!attribute name
          #   Description of the error reason.
          #
          #   @return [String]
          required :name, String

          # @!attribute request_count
          #   Number of requests that failed with this error reason.
          #
          #   @return [Float]
          required :request_count, Float, api_name: :requestCount

          # @!method initialize(name:, request_count:)
          #   @param name [String] Description of the error reason.
          #
          #   @param request_count [Float] Number of requests that failed with this error reason.
        end

        class Extension < Imagekitio::Internal::Type::BaseModel
          # @!attribute name
          #   Extension identifier.
          #
          #   @return [String]
          required :name, String

          # @!attribute operation_count
          #   Number of times this extension ran during the date range.
          #
          #   @return [Float]
          required :operation_count, Float, api_name: :operationCount

          # @!method initialize(name:, operation_count:)
          #   @param name [String] Extension identifier.
          #
          #   @param operation_count [Float] Number of times this extension ran during the date range.
        end

        # @see Imagekitio::Models::Accounts::UsageAnalyticsResponse#format_
        class Format < Imagekitio::Internal::Type::BaseModel
          # @!attribute by_bandwidth
          #   Top content types sorted by bandwidth utilized.
          #
          #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::Format::ByBandwidth>]
          required :by_bandwidth,
                   -> {
                     Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::Format::ByBandwidth]
                   },
                   api_name: :byBandwidth

          # @!attribute by_requests
          #   Top content types sorted by request count.
          #
          #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::Format::ByRequest>]
          required :by_requests,
                   -> {
                     Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::Format::ByRequest]
                   },
                   api_name: :byRequests

          # @!method initialize(by_bandwidth:, by_requests:)
          #   CDN traffic grouped by response `Content-Type`.
          #
          #   @param by_bandwidth [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::Format::ByBandwidth>] Top content types sorted by bandwidth utilized.
          #
          #   @param by_requests [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::Format::ByRequest>] Top content types sorted by request count.

          class ByBandwidth < Imagekitio::Models::Accounts::RequestBandwidthEntry
            # @!attribute name
            #   MIME type (e.g. `image/webp`).
            #
            #   @return [String]
            required :name, String

            # @!method initialize(name:)
            #   @param name [String] MIME type (e.g. `image/webp`).
          end

          class ByRequest < Imagekitio::Models::Accounts::RequestBandwidthEntry
            # @!attribute name
            #   MIME type (e.g. `image/webp`).
            #
            #   @return [String]
            required :name, String

            # @!method initialize(name:)
            #   @param name [String] MIME type (e.g. `image/webp`).
          end
        end

        class StatusCode < Imagekitio::Internal::Type::BaseModel
          # @!attribute name
          #   HTTP status code.
          #
          #   @return [String]
          required :name, String

          # @!attribute request_count
          #   Number of requests that received this status code.
          #
          #   @return [Float]
          required :request_count, Float, api_name: :requestCount

          # @!method initialize(name:, request_count:)
          #   @param name [String] HTTP status code.
          #
          #   @param request_count [Float] Number of requests that received this status code.
        end

        class Top404Asset < Imagekitio::Internal::Type::BaseModel
          # @!attribute name
          #   URL that returned a 404 response.
          #
          #   @return [String]
          required :name, String

          # @!attribute request_count
          #   Number of requests to this URL that returned a 404 response.
          #
          #   @return [Float]
          required :request_count, Float, api_name: :requestCount

          # @!method initialize(name:, request_count:)
          #   @param name [String] URL that returned a 404 response.
          #
          #   @param request_count [Float] Number of requests to this URL that returned a 404 response.
        end

        # @see Imagekitio::Models::Accounts::UsageAnalyticsResponse#top_images
        class TopImages < Imagekitio::Internal::Type::BaseModel
          # @!attribute by_bandwidth
          #   Top image assets sorted by bandwidth utilized.
          #
          #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopImages::ByBandwidth>]
          required :by_bandwidth,
                   -> {
                     Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::TopImages::ByBandwidth]
                   },
                   api_name: :byBandwidth

          # @!attribute by_requests
          #   Top image assets sorted by request count.
          #
          #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopImages::ByRequest>]
          required :by_requests,
                   -> {
                     Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::TopImages::ByRequest]
                   },
                   api_name: :byRequests

          # @!method initialize(by_bandwidth:, by_requests:)
          #   Top image assets by traffic.
          #
          #   @param by_bandwidth [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopImages::ByBandwidth>] Top image assets sorted by bandwidth utilized.
          #
          #   @param by_requests [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopImages::ByRequest>] Top image assets sorted by request count.

          class ByBandwidth < Imagekitio::Models::Accounts::RequestBandwidthEntry
            # @!attribute name
            #   URL of the image asset.
            #
            #   @return [String]
            required :name, String

            # @!method initialize(name:)
            #   @param name [String] URL of the image asset.
          end

          class ByRequest < Imagekitio::Models::Accounts::RequestBandwidthEntry
            # @!attribute name
            #   URL of the image asset.
            #
            #   @return [String]
            required :name, String

            # @!method initialize(name:)
            #   @param name [String] URL of the image asset.
          end
        end

        # @see Imagekitio::Models::Accounts::UsageAnalyticsResponse#top_image_transforms
        class TopImageTransforms < Imagekitio::Internal::Type::BaseModel
          # @!attribute by_bandwidth
          #   Top image transformation strings sorted by bandwidth utilized.
          #
          #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopImageTransforms::ByBandwidth>]
          required :by_bandwidth,
                   -> {
                     Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::TopImageTransforms::ByBandwidth]
                   },
                   api_name: :byBandwidth

          # @!attribute by_requests
          #   Top image transformation strings sorted by request count.
          #
          #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopImageTransforms::ByRequest>]
          required :by_requests,
                   -> {
                     Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::TopImageTransforms::ByRequest]
                   },
                   api_name: :byRequests

          # @!method initialize(by_bandwidth:, by_requests:)
          #   Top image transformation strings by traffic.
          #
          #   @param by_bandwidth [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopImageTransforms::ByBandwidth>] Top image transformation strings sorted by bandwidth utilized.
          #
          #   @param by_requests [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopImageTransforms::ByRequest>] Top image transformation strings sorted by request count.

          class ByBandwidth < Imagekitio::Models::Accounts::RequestBandwidthEntry
            # @!attribute name
            #   Image transformation string (e.g. `tr:w-400,h-400`).
            #
            #   @return [String]
            required :name, String

            # @!method initialize(name:)
            #   @param name [String] Image transformation string (e.g. `tr:w-400,h-400`).
          end

          class ByRequest < Imagekitio::Models::Accounts::RequestBandwidthEntry
            # @!attribute name
            #   Image transformation string (e.g. `tr:w-400,h-400`).
            #
            #   @return [String]
            required :name, String

            # @!method initialize(name:)
            #   @param name [String] Image transformation string (e.g. `tr:w-400,h-400`).
          end
        end

        # @see Imagekitio::Models::Accounts::UsageAnalyticsResponse#top_other_assets
        class TopOtherAssets < Imagekitio::Internal::Type::BaseModel
          # @!attribute by_bandwidth
          #   Top non-image, non-video assets sorted by bandwidth utilized.
          #
          #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopOtherAssets::ByBandwidth>]
          required :by_bandwidth,
                   -> {
                     Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::TopOtherAssets::ByBandwidth]
                   },
                   api_name: :byBandwidth

          # @!attribute by_requests
          #   Top non-image, non-video assets sorted by request count.
          #
          #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopOtherAssets::ByRequest>]
          required :by_requests,
                   -> {
                     Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::TopOtherAssets::ByRequest]
                   },
                   api_name: :byRequests

          # @!method initialize(by_bandwidth:, by_requests:)
          #   Top non-image, non-video assets by traffic.
          #
          #   @param by_bandwidth [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopOtherAssets::ByBandwidth>] Top non-image, non-video assets sorted by bandwidth utilized.
          #
          #   @param by_requests [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopOtherAssets::ByRequest>] Top non-image, non-video assets sorted by request count.

          class ByBandwidth < Imagekitio::Models::Accounts::RequestBandwidthEntry
            # @!attribute name
            #   URL of the non-image, non-video asset.
            #
            #   @return [String]
            required :name, String

            # @!method initialize(name:)
            #   @param name [String] URL of the non-image, non-video asset.
          end

          class ByRequest < Imagekitio::Models::Accounts::RequestBandwidthEntry
            # @!attribute name
            #   URL of the non-image, non-video asset.
            #
            #   @return [String]
            required :name, String

            # @!method initialize(name:)
            #   @param name [String] URL of the non-image, non-video asset.
          end
        end

        # @see Imagekitio::Models::Accounts::UsageAnalyticsResponse#top_referrers
        class TopReferrers < Imagekitio::Internal::Type::BaseModel
          # @!attribute by_bandwidth
          #   Top HTTP referrers sorted by bandwidth utilized.
          #
          #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopReferrers::ByBandwidth>]
          required :by_bandwidth,
                   -> {
                     Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::TopReferrers::ByBandwidth]
                   },
                   api_name: :byBandwidth

          # @!attribute by_requests
          #   Top HTTP referrers sorted by request count.
          #
          #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopReferrers::ByRequest>]
          required :by_requests,
                   -> {
                     Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::TopReferrers::ByRequest]
                   },
                   api_name: :byRequests

          # @!method initialize(by_bandwidth:, by_requests:)
          #   Top HTTP referrers by traffic.
          #
          #   @param by_bandwidth [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopReferrers::ByBandwidth>] Top HTTP referrers sorted by bandwidth utilized.
          #
          #   @param by_requests [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopReferrers::ByRequest>] Top HTTP referrers sorted by request count.

          class ByBandwidth < Imagekitio::Models::Accounts::RequestBandwidthEntry
            # @!attribute name
            #   Referrer URL.
            #
            #   @return [String]
            required :name, String

            # @!method initialize(name:)
            #   @param name [String] Referrer URL.
          end

          class ByRequest < Imagekitio::Models::Accounts::RequestBandwidthEntry
            # @!attribute name
            #   Referrer URL.
            #
            #   @return [String]
            required :name, String

            # @!method initialize(name:)
            #   @param name [String] Referrer URL.
          end
        end

        # @see Imagekitio::Models::Accounts::UsageAnalyticsResponse#top_user_agents
        class TopUserAgents < Imagekitio::Internal::Type::BaseModel
          # @!attribute by_bandwidth
          #   Top user agents sorted by bandwidth utilized.
          #
          #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopUserAgents::ByBandwidth>]
          required :by_bandwidth,
                   -> {
                     Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::TopUserAgents::ByBandwidth]
                   },
                   api_name: :byBandwidth

          # @!attribute by_requests
          #   Top user agents sorted by request count.
          #
          #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopUserAgents::ByRequest>]
          required :by_requests,
                   -> {
                     Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::TopUserAgents::ByRequest]
                   },
                   api_name: :byRequests

          # @!method initialize(by_bandwidth:, by_requests:)
          #   Top user agents by traffic.
          #
          #   @param by_bandwidth [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopUserAgents::ByBandwidth>] Top user agents sorted by bandwidth utilized.
          #
          #   @param by_requests [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopUserAgents::ByRequest>] Top user agents sorted by request count.

          class ByBandwidth < Imagekitio::Models::Accounts::RequestBandwidthEntry
            # @!attribute name
            #   User agent string.
            #
            #   @return [String]
            required :name, String

            # @!method initialize(name:)
            #   @param name [String] User agent string.
          end

          class ByRequest < Imagekitio::Models::Accounts::RequestBandwidthEntry
            # @!attribute name
            #   User agent string.
            #
            #   @return [String]
            required :name, String

            # @!method initialize(name:)
            #   @param name [String] User agent string.
          end
        end

        # @see Imagekitio::Models::Accounts::UsageAnalyticsResponse#top_videos
        class TopVideos < Imagekitio::Internal::Type::BaseModel
          # @!attribute by_bandwidth
          #   Top video assets sorted by bandwidth utilized.
          #
          #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopVideos::ByBandwidth>]
          required :by_bandwidth,
                   -> {
                     Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::TopVideos::ByBandwidth]
                   },
                   api_name: :byBandwidth

          # @!attribute by_requests
          #   Top video assets sorted by request count.
          #
          #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopVideos::ByRequest>]
          required :by_requests,
                   -> {
                     Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::TopVideos::ByRequest]
                   },
                   api_name: :byRequests

          # @!method initialize(by_bandwidth:, by_requests:)
          #   Top video assets by traffic.
          #
          #   @param by_bandwidth [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopVideos::ByBandwidth>] Top video assets sorted by bandwidth utilized.
          #
          #   @param by_requests [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopVideos::ByRequest>] Top video assets sorted by request count.

          class ByBandwidth < Imagekitio::Models::Accounts::RequestBandwidthEntry
            # @!attribute name
            #   URL of the video asset.
            #
            #   @return [String]
            required :name, String

            # @!method initialize(name:)
            #   @param name [String] URL of the video asset.
          end

          class ByRequest < Imagekitio::Models::Accounts::RequestBandwidthEntry
            # @!attribute name
            #   Full URL of the video asset (e.g. `https://ik.imagekit.io/demo/clip.mp4`).
            #
            #   @return [String]
            required :name, String

            # @!method initialize(name:)
            #   @param name [String] Full URL of the video asset (e.g. `https://ik.imagekit.io/demo/clip.mp4`).
          end
        end

        # @see Imagekitio::Models::Accounts::UsageAnalyticsResponse#top_video_transforms
        class TopVideoTransforms < Imagekitio::Internal::Type::BaseModel
          # @!attribute by_bandwidth
          #   Top video transformation strings sorted by bandwidth utilized.
          #
          #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopVideoTransforms::ByBandwidth>]
          required :by_bandwidth,
                   -> {
                     Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::TopVideoTransforms::ByBandwidth]
                   },
                   api_name: :byBandwidth

          # @!attribute by_requests
          #   Top video transformation strings sorted by request count.
          #
          #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopVideoTransforms::ByRequest>]
          required :by_requests,
                   -> {
                     Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::TopVideoTransforms::ByRequest]
                   },
                   api_name: :byRequests

          # @!method initialize(by_bandwidth:, by_requests:)
          #   Top video transformation strings by traffic.
          #
          #   @param by_bandwidth [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopVideoTransforms::ByBandwidth>] Top video transformation strings sorted by bandwidth utilized.
          #
          #   @param by_requests [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::TopVideoTransforms::ByRequest>] Top video transformation strings sorted by request count.

          class ByBandwidth < Imagekitio::Models::Accounts::RequestBandwidthEntry
            # @!attribute name
            #   Video transformation string (e.g. `tr:h-720,f-mp4`).
            #
            #   @return [String]
            required :name, String

            # @!method initialize(name:)
            #   @param name [String] Video transformation string (e.g. `tr:h-720,f-mp4`).
          end

          class ByRequest < Imagekitio::Models::Accounts::RequestBandwidthEntry
            # @!attribute name
            #   Video transformation string (e.g. `tr:h-720,f-mp4`).
            #
            #   @return [String]
            required :name, String

            # @!method initialize(name:)
            #   @param name [String] Video transformation string (e.g. `tr:h-720,f-mp4`).
          end
        end

        # @see Imagekitio::Models::Accounts::UsageAnalyticsResponse#url_endpoints
        class URLEndpoints < Imagekitio::Internal::Type::BaseModel
          # @!attribute by_bandwidth
          #   Top URL endpoints sorted by bandwidth utilized.
          #
          #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::URLEndpoints::ByBandwidth>]
          required :by_bandwidth,
                   -> {
                     Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::URLEndpoints::ByBandwidth]
                   },
                   api_name: :byBandwidth

          # @!attribute by_requests
          #   Top URL endpoints sorted by request count.
          #
          #   @return [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::URLEndpoints::ByRequest>]
          required :by_requests,
                   -> {
                     Imagekitio::Internal::Type::ArrayOf[Imagekitio::Accounts::UsageAnalyticsResponse::URLEndpoints::ByRequest]
                   },
                   api_name: :byRequests

          # @!method initialize(by_bandwidth:, by_requests:)
          #   CDN traffic grouped by configured URL endpoint. Traffic that does not match any
          #   named URL endpoint pattern is grouped under `Default`.
          #
          #   @param by_bandwidth [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::URLEndpoints::ByBandwidth>] Top URL endpoints sorted by bandwidth utilized.
          #
          #   @param by_requests [Array<Imagekitio::Models::Accounts::UsageAnalyticsResponse::URLEndpoints::ByRequest>] Top URL endpoints sorted by request count.

          class ByBandwidth < Imagekitio::Models::Accounts::RequestBandwidthEntry
            # @!attribute name
            #   URL endpoint name, or `Default` for traffic that does not match a named
            #   endpoint.
            #
            #   @return [String]
            required :name, String

            # @!method initialize(name:)
            #   Some parameter documentations has been truncated, see
            #   {Imagekitio::Models::Accounts::UsageAnalyticsResponse::URLEndpoints::ByBandwidth}
            #   for more details.
            #
            #   @param name [String] URL endpoint name, or `Default` for traffic that does not match a named endpoint
          end

          class ByRequest < Imagekitio::Models::Accounts::RequestBandwidthEntry
            # @!attribute name
            #   URL endpoint name, or `Default` for traffic that does not match a named
            #   endpoint.
            #
            #   @return [String]
            required :name, String

            # @!method initialize(name:)
            #   Some parameter documentations has been truncated, see
            #   {Imagekitio::Models::Accounts::UsageAnalyticsResponse::URLEndpoints::ByRequest}
            #   for more details.
            #
            #   @param name [String] URL endpoint name, or `Default` for traffic that does not match a named endpoint
          end
        end

        class VideoProcessing < Imagekitio::Internal::Type::BaseModel
          # @!attribute codec
          #   Video codec used for the output (e.g. `h264`, `av1`).
          #
          #   @return [String]
          required :codec, String

          # @!attribute duration_seconds
          #   Total output duration, in seconds, for this resolution and codec combination.
          #
          #   @return [Float]
          required :duration_seconds, Float, api_name: :durationSeconds

          # @!attribute resolution
          #   Output resolution tier (e.g. `SD`, `HD`, `4K`).
          #
          #   @return [String]
          required :resolution, String

          # @!method initialize(codec:, duration_seconds:, resolution:)
          #   @param codec [String] Video codec used for the output (e.g. `h264`, `av1`).
          #
          #   @param duration_seconds [Float] Total output duration, in seconds, for this resolution and codec combination.
          #
          #   @param resolution [String] Output resolution tier (e.g. `SD`, `HD`, `4K`).
        end
      end
    end
  end
end
