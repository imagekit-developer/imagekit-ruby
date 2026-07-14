# typed: strong

module Imagekitio
  module Models
    module Accounts
      class UsageAnalyticsResponse < Imagekitio::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Imagekitio::Accounts::UsageAnalyticsResponse,
              Imagekitio::Internal::AnyHash
            )
          end

        # Total bandwidth, in bytes, utilized during the specified date range.
        sig { returns(Float) }
        attr_accessor :bandwidth_bytes

        # CDN traffic grouped by browser.
        sig { returns(Imagekitio::Accounts::UsageAnalyticsResponse::Browser) }
        attr_reader :browser

        sig do
          params(
            browser:
              Imagekitio::Accounts::UsageAnalyticsResponse::Browser::OrHash
          ).void
        end
        attr_writer :browser

        # CDN cache hit, miss and error counts for the date range.
        sig { returns(Imagekitio::Accounts::UsageAnalyticsResponse::Cache) }
        attr_reader :cache

        sig do
          params(
            cache: Imagekitio::Accounts::UsageAnalyticsResponse::Cache::OrHash
          ).void
        end
        attr_writer :cache

        # CDN traffic grouped by country.
        sig { returns(Imagekitio::Accounts::UsageAnalyticsResponse::Country) }
        attr_reader :country

        sig do
          params(
            country:
              Imagekitio::Accounts::UsageAnalyticsResponse::Country::OrHash
          ).void
        end
        attr_writer :country

        # CDN traffic grouped by device and operating system (e.g. `Desktop - Apple Mac`,
        # `Smartphone - Apple iPhone`).
        sig { returns(Imagekitio::Accounts::UsageAnalyticsResponse::Device) }
        attr_reader :device

        sig do
          params(
            device: Imagekitio::Accounts::UsageAnalyticsResponse::Device::OrHash
          ).void
        end
        attr_writer :device

        # End date of the computed analytics data.
        sig { returns(Date) }
        attr_accessor :end_date

        # Request count grouped by origin error reason. This covers failed origin fetches,
        # such as an asset not found at origin or an origin timeout. It is not the HTTP
        # status code returned to the client, see `statusCodes` for that.
        sig do
          returns(
            T::Array[Imagekitio::Accounts::UsageAnalyticsResponse::ErrorReason]
          )
        end
        attr_accessor :error_reasons

        # Raw per-extension operation counts for the date range. These are raw operation
        # counts, not billable extension units. For billable usage, use the
        # `/v1/accounts/usage` endpoint.
        sig do
          returns(
            T::Array[Imagekitio::Accounts::UsageAnalyticsResponse::Extension]
          )
        end
        attr_accessor :extensions

        # CDN traffic grouped by response `Content-Type`.
        sig { returns(Imagekitio::Accounts::UsageAnalyticsResponse::Format) }
        attr_reader :format_

        sig do
          params(
            format_:
              Imagekitio::Accounts::UsageAnalyticsResponse::Format::OrHash
          ).void
        end
        attr_writer :format_

        # Date and time when the analytics data was computed. Use this to gauge how fresh
        # the returned data is. The date and time is in ISO8601 format.
        sig { returns(Time) }
        attr_accessor :generated_at

        # Total number of requests made during the specified date range.
        sig { returns(Float) }
        attr_accessor :request_count

        # Start date of the computed analytics data.
        sig { returns(Date) }
        attr_accessor :start_date

        # Request count grouped by HTTP status code.
        sig do
          returns(
            T::Array[Imagekitio::Accounts::UsageAnalyticsResponse::StatusCode]
          )
        end
        attr_accessor :status_codes

        # Top URLs that returned a 404 response.
        sig do
          returns(
            T::Array[Imagekitio::Accounts::UsageAnalyticsResponse::Top404Asset]
          )
        end
        attr_accessor :top404_assets

        # Top image assets by traffic.
        sig { returns(Imagekitio::Accounts::UsageAnalyticsResponse::TopImages) }
        attr_reader :top_images

        sig do
          params(
            top_images:
              Imagekitio::Accounts::UsageAnalyticsResponse::TopImages::OrHash
          ).void
        end
        attr_writer :top_images

        # Top image transformation strings by traffic.
        sig do
          returns(
            Imagekitio::Accounts::UsageAnalyticsResponse::TopImageTransforms
          )
        end
        attr_reader :top_image_transforms

        sig do
          params(
            top_image_transforms:
              Imagekitio::Accounts::UsageAnalyticsResponse::TopImageTransforms::OrHash
          ).void
        end
        attr_writer :top_image_transforms

        # Top non-image, non-video assets by traffic.
        sig do
          returns(Imagekitio::Accounts::UsageAnalyticsResponse::TopOtherAssets)
        end
        attr_reader :top_other_assets

        sig do
          params(
            top_other_assets:
              Imagekitio::Accounts::UsageAnalyticsResponse::TopOtherAssets::OrHash
          ).void
        end
        attr_writer :top_other_assets

        # Top HTTP referrers by traffic.
        sig do
          returns(Imagekitio::Accounts::UsageAnalyticsResponse::TopReferrers)
        end
        attr_reader :top_referrers

        sig do
          params(
            top_referrers:
              Imagekitio::Accounts::UsageAnalyticsResponse::TopReferrers::OrHash
          ).void
        end
        attr_writer :top_referrers

        # Top user agents by traffic.
        sig do
          returns(Imagekitio::Accounts::UsageAnalyticsResponse::TopUserAgents)
        end
        attr_reader :top_user_agents

        sig do
          params(
            top_user_agents:
              Imagekitio::Accounts::UsageAnalyticsResponse::TopUserAgents::OrHash
          ).void
        end
        attr_writer :top_user_agents

        # Top video assets by traffic.
        sig { returns(Imagekitio::Accounts::UsageAnalyticsResponse::TopVideos) }
        attr_reader :top_videos

        sig do
          params(
            top_videos:
              Imagekitio::Accounts::UsageAnalyticsResponse::TopVideos::OrHash
          ).void
        end
        attr_writer :top_videos

        # Top video transformation strings by traffic.
        sig do
          returns(
            Imagekitio::Accounts::UsageAnalyticsResponse::TopVideoTransforms
          )
        end
        attr_reader :top_video_transforms

        sig do
          params(
            top_video_transforms:
              Imagekitio::Accounts::UsageAnalyticsResponse::TopVideoTransforms::OrHash
          ).void
        end
        attr_writer :top_video_transforms

        # CDN traffic grouped by configured URL endpoint. Traffic that does not match any
        # named URL endpoint pattern is grouped under `Default`.
        sig do
          returns(Imagekitio::Accounts::UsageAnalyticsResponse::URLEndpoints)
        end
        attr_reader :url_endpoints

        sig do
          params(
            url_endpoints:
              Imagekitio::Accounts::UsageAnalyticsResponse::URLEndpoints::OrHash
          ).void
        end
        attr_writer :url_endpoints

        # Raw observed video transcode output duration, in seconds, grouped by resolution
        # and codec. These are raw seconds, not billable Video Processing Units (VPU). For
        # billable VPU totals, use the `/v1/accounts/usage` endpoint.
        sig do
          returns(
            T::Array[
              Imagekitio::Accounts::UsageAnalyticsResponse::VideoProcessing
            ]
          )
        end
        attr_accessor :video_processing

        sig do
          params(
            bandwidth_bytes: Float,
            browser:
              Imagekitio::Accounts::UsageAnalyticsResponse::Browser::OrHash,
            cache: Imagekitio::Accounts::UsageAnalyticsResponse::Cache::OrHash,
            country:
              Imagekitio::Accounts::UsageAnalyticsResponse::Country::OrHash,
            device:
              Imagekitio::Accounts::UsageAnalyticsResponse::Device::OrHash,
            end_date: Date,
            error_reasons:
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::ErrorReason::OrHash
              ],
            extensions:
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::Extension::OrHash
              ],
            format_:
              Imagekitio::Accounts::UsageAnalyticsResponse::Format::OrHash,
            generated_at: Time,
            request_count: Float,
            start_date: Date,
            status_codes:
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::StatusCode::OrHash
              ],
            top404_assets:
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::Top404Asset::OrHash
              ],
            top_images:
              Imagekitio::Accounts::UsageAnalyticsResponse::TopImages::OrHash,
            top_image_transforms:
              Imagekitio::Accounts::UsageAnalyticsResponse::TopImageTransforms::OrHash,
            top_other_assets:
              Imagekitio::Accounts::UsageAnalyticsResponse::TopOtherAssets::OrHash,
            top_referrers:
              Imagekitio::Accounts::UsageAnalyticsResponse::TopReferrers::OrHash,
            top_user_agents:
              Imagekitio::Accounts::UsageAnalyticsResponse::TopUserAgents::OrHash,
            top_videos:
              Imagekitio::Accounts::UsageAnalyticsResponse::TopVideos::OrHash,
            top_video_transforms:
              Imagekitio::Accounts::UsageAnalyticsResponse::TopVideoTransforms::OrHash,
            url_endpoints:
              Imagekitio::Accounts::UsageAnalyticsResponse::URLEndpoints::OrHash,
            video_processing:
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::VideoProcessing::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # Total bandwidth, in bytes, utilized during the specified date range.
          bandwidth_bytes:,
          # CDN traffic grouped by browser.
          browser:,
          # CDN cache hit, miss and error counts for the date range.
          cache:,
          # CDN traffic grouped by country.
          country:,
          # CDN traffic grouped by device and operating system (e.g. `Desktop - Apple Mac`,
          # `Smartphone - Apple iPhone`).
          device:,
          # End date of the computed analytics data.
          end_date:,
          # Request count grouped by origin error reason. This covers failed origin fetches,
          # such as an asset not found at origin or an origin timeout. It is not the HTTP
          # status code returned to the client, see `statusCodes` for that.
          error_reasons:,
          # Raw per-extension operation counts for the date range. These are raw operation
          # counts, not billable extension units. For billable usage, use the
          # `/v1/accounts/usage` endpoint.
          extensions:,
          # CDN traffic grouped by response `Content-Type`.
          format_:,
          # Date and time when the analytics data was computed. Use this to gauge how fresh
          # the returned data is. The date and time is in ISO8601 format.
          generated_at:,
          # Total number of requests made during the specified date range.
          request_count:,
          # Start date of the computed analytics data.
          start_date:,
          # Request count grouped by HTTP status code.
          status_codes:,
          # Top URLs that returned a 404 response.
          top404_assets:,
          # Top image assets by traffic.
          top_images:,
          # Top image transformation strings by traffic.
          top_image_transforms:,
          # Top non-image, non-video assets by traffic.
          top_other_assets:,
          # Top HTTP referrers by traffic.
          top_referrers:,
          # Top user agents by traffic.
          top_user_agents:,
          # Top video assets by traffic.
          top_videos:,
          # Top video transformation strings by traffic.
          top_video_transforms:,
          # CDN traffic grouped by configured URL endpoint. Traffic that does not match any
          # named URL endpoint pattern is grouped under `Default`.
          url_endpoints:,
          # Raw observed video transcode output duration, in seconds, grouped by resolution
          # and codec. These are raw seconds, not billable Video Processing Units (VPU). For
          # billable VPU totals, use the `/v1/accounts/usage` endpoint.
          video_processing:
        )
        end

        sig do
          override.returns(
            {
              bandwidth_bytes: Float,
              browser: Imagekitio::Accounts::UsageAnalyticsResponse::Browser,
              cache: Imagekitio::Accounts::UsageAnalyticsResponse::Cache,
              country: Imagekitio::Accounts::UsageAnalyticsResponse::Country,
              device: Imagekitio::Accounts::UsageAnalyticsResponse::Device,
              end_date: Date,
              error_reasons:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::ErrorReason
                ],
              extensions:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::Extension
                ],
              format_: Imagekitio::Accounts::UsageAnalyticsResponse::Format,
              generated_at: Time,
              request_count: Float,
              start_date: Date,
              status_codes:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::StatusCode
                ],
              top404_assets:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::Top404Asset
                ],
              top_images:
                Imagekitio::Accounts::UsageAnalyticsResponse::TopImages,
              top_image_transforms:
                Imagekitio::Accounts::UsageAnalyticsResponse::TopImageTransforms,
              top_other_assets:
                Imagekitio::Accounts::UsageAnalyticsResponse::TopOtherAssets,
              top_referrers:
                Imagekitio::Accounts::UsageAnalyticsResponse::TopReferrers,
              top_user_agents:
                Imagekitio::Accounts::UsageAnalyticsResponse::TopUserAgents,
              top_videos:
                Imagekitio::Accounts::UsageAnalyticsResponse::TopVideos,
              top_video_transforms:
                Imagekitio::Accounts::UsageAnalyticsResponse::TopVideoTransforms,
              url_endpoints:
                Imagekitio::Accounts::UsageAnalyticsResponse::URLEndpoints,
              video_processing:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::VideoProcessing
                ]
            }
          )
        end
        def to_hash
        end

        class Browser < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::UsageAnalyticsResponse::Browser,
                Imagekitio::Internal::AnyHash
              )
            end

          # Top browsers sorted by bandwidth utilized.
          sig do
            returns(
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::Browser::ByBandwidth
              ]
            )
          end
          attr_accessor :by_bandwidth

          # Top browsers sorted by request count.
          sig do
            returns(
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::Browser::ByRequest
              ]
            )
          end
          attr_accessor :by_requests

          # CDN traffic grouped by browser.
          sig do
            params(
              by_bandwidth:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::Browser::ByBandwidth::OrHash
                ],
              by_requests:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::Browser::ByRequest::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # Top browsers sorted by bandwidth utilized.
            by_bandwidth:,
            # Top browsers sorted by request count.
            by_requests:
          )
          end

          sig do
            override.returns(
              {
                by_bandwidth:
                  T::Array[
                    Imagekitio::Accounts::UsageAnalyticsResponse::Browser::ByBandwidth
                  ],
                by_requests:
                  T::Array[
                    Imagekitio::Accounts::UsageAnalyticsResponse::Browser::ByRequest
                  ]
              }
            )
          end
          def to_hash
          end

          class ByBandwidth < Imagekitio::Models::Accounts::RequestBandwidthEntry
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::UsageAnalyticsResponse::Browser::ByBandwidth,
                  Imagekitio::Internal::AnyHash
                )
              end

            # Browser name (e.g. `Chrome`).
            sig { returns(String) }
            attr_accessor :name

            sig { params(name: String).returns(T.attached_class) }
            def self.new(
              # Browser name (e.g. `Chrome`).
              name:
            )
            end

            sig { override.returns({ name: String }) }
            def to_hash
            end
          end

          class ByRequest < Imagekitio::Models::Accounts::RequestBandwidthEntry
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::UsageAnalyticsResponse::Browser::ByRequest,
                  Imagekitio::Internal::AnyHash
                )
              end

            # Browser name (e.g. `Chrome`).
            sig { returns(String) }
            attr_accessor :name

            sig { params(name: String).returns(T.attached_class) }
            def self.new(
              # Browser name (e.g. `Chrome`).
              name:
            )
            end

            sig { override.returns({ name: String }) }
            def to_hash
            end
          end
        end

        class Cache < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::UsageAnalyticsResponse::Cache,
                Imagekitio::Internal::AnyHash
              )
            end

          # Number of requests where the CDN encountered a cache error or exceeded capacity
          # while serving the response.
          sig { returns(Float) }
          attr_accessor :error_count

          # Number of requests served from cache, including full hits and revalidated hits.
          sig { returns(Float) }
          attr_accessor :hit_count

          # Number of requests that were not found in cache and had to be fetched from
          # origin.
          sig { returns(Float) }
          attr_accessor :miss_count

          # CDN cache hit, miss and error counts for the date range.
          sig do
            params(
              error_count: Float,
              hit_count: Float,
              miss_count: Float
            ).returns(T.attached_class)
          end
          def self.new(
            # Number of requests where the CDN encountered a cache error or exceeded capacity
            # while serving the response.
            error_count:,
            # Number of requests served from cache, including full hits and revalidated hits.
            hit_count:,
            # Number of requests that were not found in cache and had to be fetched from
            # origin.
            miss_count:
          )
          end

          sig do
            override.returns(
              { error_count: Float, hit_count: Float, miss_count: Float }
            )
          end
          def to_hash
          end
        end

        class Country < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::UsageAnalyticsResponse::Country,
                Imagekitio::Internal::AnyHash
              )
            end

          # Top requesting countries sorted by total bandwidth utilized.
          sig do
            returns(
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::Country::ByBandwidth
              ]
            )
          end
          attr_accessor :by_bandwidth

          # Top requesting countries sorted by request count.
          sig do
            returns(
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::Country::ByRequest
              ]
            )
          end
          attr_accessor :by_requests

          # CDN traffic grouped by country.
          sig do
            params(
              by_bandwidth:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::Country::ByBandwidth::OrHash
                ],
              by_requests:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::Country::ByRequest::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # Top requesting countries sorted by total bandwidth utilized.
            by_bandwidth:,
            # Top requesting countries sorted by request count.
            by_requests:
          )
          end

          sig do
            override.returns(
              {
                by_bandwidth:
                  T::Array[
                    Imagekitio::Accounts::UsageAnalyticsResponse::Country::ByBandwidth
                  ],
                by_requests:
                  T::Array[
                    Imagekitio::Accounts::UsageAnalyticsResponse::Country::ByRequest
                  ]
              }
            )
          end
          def to_hash
          end

          class ByBandwidth < Imagekitio::Models::Accounts::RequestBandwidthEntry
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::UsageAnalyticsResponse::Country::ByBandwidth,
                  Imagekitio::Internal::AnyHash
                )
              end

            # ISO country code.
            sig { returns(String) }
            attr_accessor :code

            # Country name.
            sig { returns(String) }
            attr_accessor :name

            sig { params(code: String, name: String).returns(T.attached_class) }
            def self.new(
              # ISO country code.
              code:,
              # Country name.
              name:
            )
            end

            sig { override.returns({ code: String, name: String }) }
            def to_hash
            end
          end

          class ByRequest < Imagekitio::Models::Accounts::RequestBandwidthEntry
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::UsageAnalyticsResponse::Country::ByRequest,
                  Imagekitio::Internal::AnyHash
                )
              end

            # ISO country code.
            sig { returns(String) }
            attr_accessor :code

            # Country name.
            sig { returns(String) }
            attr_accessor :name

            sig { params(code: String, name: String).returns(T.attached_class) }
            def self.new(
              # ISO country code.
              code:,
              # Country name.
              name:
            )
            end

            sig { override.returns({ code: String, name: String }) }
            def to_hash
            end
          end
        end

        class Device < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::UsageAnalyticsResponse::Device,
                Imagekitio::Internal::AnyHash
              )
            end

          # Top device/OS combinations sorted by bandwidth utilized.
          sig do
            returns(
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::Device::ByBandwidth
              ]
            )
          end
          attr_accessor :by_bandwidth

          # Top device/OS combinations sorted by request count.
          sig do
            returns(
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::Device::ByRequest
              ]
            )
          end
          attr_accessor :by_requests

          # CDN traffic grouped by device and operating system (e.g. `Desktop - Apple Mac`,
          # `Smartphone - Apple iPhone`).
          sig do
            params(
              by_bandwidth:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::Device::ByBandwidth::OrHash
                ],
              by_requests:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::Device::ByRequest::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # Top device/OS combinations sorted by bandwidth utilized.
            by_bandwidth:,
            # Top device/OS combinations sorted by request count.
            by_requests:
          )
          end

          sig do
            override.returns(
              {
                by_bandwidth:
                  T::Array[
                    Imagekitio::Accounts::UsageAnalyticsResponse::Device::ByBandwidth
                  ],
                by_requests:
                  T::Array[
                    Imagekitio::Accounts::UsageAnalyticsResponse::Device::ByRequest
                  ]
              }
            )
          end
          def to_hash
          end

          class ByBandwidth < Imagekitio::Models::Accounts::RequestBandwidthEntry
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::UsageAnalyticsResponse::Device::ByBandwidth,
                  Imagekitio::Internal::AnyHash
                )
              end

            # Device category combined with operating system or vendor (e.g.
            # `Desktop - Windows PC`).
            sig { returns(String) }
            attr_accessor :name

            sig { params(name: String).returns(T.attached_class) }
            def self.new(
              # Device category combined with operating system or vendor (e.g.
              # `Desktop - Windows PC`).
              name:
            )
            end

            sig { override.returns({ name: String }) }
            def to_hash
            end
          end

          class ByRequest < Imagekitio::Models::Accounts::RequestBandwidthEntry
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::UsageAnalyticsResponse::Device::ByRequest,
                  Imagekitio::Internal::AnyHash
                )
              end

            # Device category combined with operating system or vendor (e.g.
            # `Desktop - Windows PC`).
            sig { returns(String) }
            attr_accessor :name

            sig { params(name: String).returns(T.attached_class) }
            def self.new(
              # Device category combined with operating system or vendor (e.g.
              # `Desktop - Windows PC`).
              name:
            )
            end

            sig { override.returns({ name: String }) }
            def to_hash
            end
          end
        end

        class ErrorReason < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::UsageAnalyticsResponse::ErrorReason,
                Imagekitio::Internal::AnyHash
              )
            end

          # Description of the error reason.
          sig { returns(String) }
          attr_accessor :name

          # Number of requests that failed with this error reason.
          sig { returns(Float) }
          attr_accessor :request_count

          sig do
            params(name: String, request_count: Float).returns(T.attached_class)
          end
          def self.new(
            # Description of the error reason.
            name:,
            # Number of requests that failed with this error reason.
            request_count:
          )
          end

          sig { override.returns({ name: String, request_count: Float }) }
          def to_hash
          end
        end

        class Extension < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::UsageAnalyticsResponse::Extension,
                Imagekitio::Internal::AnyHash
              )
            end

          # Extension identifier.
          sig { returns(String) }
          attr_accessor :name

          # Number of times this extension ran during the date range.
          sig { returns(Float) }
          attr_accessor :operation_count

          sig do
            params(name: String, operation_count: Float).returns(
              T.attached_class
            )
          end
          def self.new(
            # Extension identifier.
            name:,
            # Number of times this extension ran during the date range.
            operation_count:
          )
          end

          sig { override.returns({ name: String, operation_count: Float }) }
          def to_hash
          end
        end

        class Format < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::UsageAnalyticsResponse::Format,
                Imagekitio::Internal::AnyHash
              )
            end

          # Top content types sorted by bandwidth utilized.
          sig do
            returns(
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::Format::ByBandwidth
              ]
            )
          end
          attr_accessor :by_bandwidth

          # Top content types sorted by request count.
          sig do
            returns(
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::Format::ByRequest
              ]
            )
          end
          attr_accessor :by_requests

          # CDN traffic grouped by response `Content-Type`.
          sig do
            params(
              by_bandwidth:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::Format::ByBandwidth::OrHash
                ],
              by_requests:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::Format::ByRequest::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # Top content types sorted by bandwidth utilized.
            by_bandwidth:,
            # Top content types sorted by request count.
            by_requests:
          )
          end

          sig do
            override.returns(
              {
                by_bandwidth:
                  T::Array[
                    Imagekitio::Accounts::UsageAnalyticsResponse::Format::ByBandwidth
                  ],
                by_requests:
                  T::Array[
                    Imagekitio::Accounts::UsageAnalyticsResponse::Format::ByRequest
                  ]
              }
            )
          end
          def to_hash
          end

          class ByBandwidth < Imagekitio::Models::Accounts::RequestBandwidthEntry
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::UsageAnalyticsResponse::Format::ByBandwidth,
                  Imagekitio::Internal::AnyHash
                )
              end

            # MIME type (e.g. `image/webp`).
            sig { returns(String) }
            attr_accessor :name

            sig { params(name: String).returns(T.attached_class) }
            def self.new(
              # MIME type (e.g. `image/webp`).
              name:
            )
            end

            sig { override.returns({ name: String }) }
            def to_hash
            end
          end

          class ByRequest < Imagekitio::Models::Accounts::RequestBandwidthEntry
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::UsageAnalyticsResponse::Format::ByRequest,
                  Imagekitio::Internal::AnyHash
                )
              end

            # MIME type (e.g. `image/webp`).
            sig { returns(String) }
            attr_accessor :name

            sig { params(name: String).returns(T.attached_class) }
            def self.new(
              # MIME type (e.g. `image/webp`).
              name:
            )
            end

            sig { override.returns({ name: String }) }
            def to_hash
            end
          end
        end

        class StatusCode < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::UsageAnalyticsResponse::StatusCode,
                Imagekitio::Internal::AnyHash
              )
            end

          # HTTP status code.
          sig { returns(String) }
          attr_accessor :name

          # Number of requests that received this status code.
          sig { returns(Float) }
          attr_accessor :request_count

          sig do
            params(name: String, request_count: Float).returns(T.attached_class)
          end
          def self.new(
            # HTTP status code.
            name:,
            # Number of requests that received this status code.
            request_count:
          )
          end

          sig { override.returns({ name: String, request_count: Float }) }
          def to_hash
          end
        end

        class Top404Asset < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::UsageAnalyticsResponse::Top404Asset,
                Imagekitio::Internal::AnyHash
              )
            end

          # URL that returned a 404 response.
          sig { returns(String) }
          attr_accessor :name

          # Number of requests to this URL that returned a 404 response.
          sig { returns(Float) }
          attr_accessor :request_count

          sig do
            params(name: String, request_count: Float).returns(T.attached_class)
          end
          def self.new(
            # URL that returned a 404 response.
            name:,
            # Number of requests to this URL that returned a 404 response.
            request_count:
          )
          end

          sig { override.returns({ name: String, request_count: Float }) }
          def to_hash
          end
        end

        class TopImages < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::UsageAnalyticsResponse::TopImages,
                Imagekitio::Internal::AnyHash
              )
            end

          # Top image assets sorted by bandwidth utilized.
          sig do
            returns(
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::TopImages::ByBandwidth
              ]
            )
          end
          attr_accessor :by_bandwidth

          # Top image assets sorted by request count.
          sig do
            returns(
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::TopImages::ByRequest
              ]
            )
          end
          attr_accessor :by_requests

          # Top image assets by traffic.
          sig do
            params(
              by_bandwidth:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopImages::ByBandwidth::OrHash
                ],
              by_requests:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopImages::ByRequest::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # Top image assets sorted by bandwidth utilized.
            by_bandwidth:,
            # Top image assets sorted by request count.
            by_requests:
          )
          end

          sig do
            override.returns(
              {
                by_bandwidth:
                  T::Array[
                    Imagekitio::Accounts::UsageAnalyticsResponse::TopImages::ByBandwidth
                  ],
                by_requests:
                  T::Array[
                    Imagekitio::Accounts::UsageAnalyticsResponse::TopImages::ByRequest
                  ]
              }
            )
          end
          def to_hash
          end

          class ByBandwidth < Imagekitio::Models::Accounts::RequestBandwidthEntry
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopImages::ByBandwidth,
                  Imagekitio::Internal::AnyHash
                )
              end

            # URL of the image asset.
            sig { returns(String) }
            attr_accessor :name

            sig { params(name: String).returns(T.attached_class) }
            def self.new(
              # URL of the image asset.
              name:
            )
            end

            sig { override.returns({ name: String }) }
            def to_hash
            end
          end

          class ByRequest < Imagekitio::Models::Accounts::RequestBandwidthEntry
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopImages::ByRequest,
                  Imagekitio::Internal::AnyHash
                )
              end

            # URL of the image asset.
            sig { returns(String) }
            attr_accessor :name

            sig { params(name: String).returns(T.attached_class) }
            def self.new(
              # URL of the image asset.
              name:
            )
            end

            sig { override.returns({ name: String }) }
            def to_hash
            end
          end
        end

        class TopImageTransforms < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::UsageAnalyticsResponse::TopImageTransforms,
                Imagekitio::Internal::AnyHash
              )
            end

          # Top image transformation strings sorted by bandwidth utilized.
          sig do
            returns(
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::TopImageTransforms::ByBandwidth
              ]
            )
          end
          attr_accessor :by_bandwidth

          # Top image transformation strings sorted by request count.
          sig do
            returns(
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::TopImageTransforms::ByRequest
              ]
            )
          end
          attr_accessor :by_requests

          # Top image transformation strings by traffic.
          sig do
            params(
              by_bandwidth:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopImageTransforms::ByBandwidth::OrHash
                ],
              by_requests:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopImageTransforms::ByRequest::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # Top image transformation strings sorted by bandwidth utilized.
            by_bandwidth:,
            # Top image transformation strings sorted by request count.
            by_requests:
          )
          end

          sig do
            override.returns(
              {
                by_bandwidth:
                  T::Array[
                    Imagekitio::Accounts::UsageAnalyticsResponse::TopImageTransforms::ByBandwidth
                  ],
                by_requests:
                  T::Array[
                    Imagekitio::Accounts::UsageAnalyticsResponse::TopImageTransforms::ByRequest
                  ]
              }
            )
          end
          def to_hash
          end

          class ByBandwidth < Imagekitio::Models::Accounts::RequestBandwidthEntry
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopImageTransforms::ByBandwidth,
                  Imagekitio::Internal::AnyHash
                )
              end

            # Image transformation string (e.g. `tr:w-400,h-400`).
            sig { returns(String) }
            attr_accessor :name

            sig { params(name: String).returns(T.attached_class) }
            def self.new(
              # Image transformation string (e.g. `tr:w-400,h-400`).
              name:
            )
            end

            sig { override.returns({ name: String }) }
            def to_hash
            end
          end

          class ByRequest < Imagekitio::Models::Accounts::RequestBandwidthEntry
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopImageTransforms::ByRequest,
                  Imagekitio::Internal::AnyHash
                )
              end

            # Image transformation string (e.g. `tr:w-400,h-400`).
            sig { returns(String) }
            attr_accessor :name

            sig { params(name: String).returns(T.attached_class) }
            def self.new(
              # Image transformation string (e.g. `tr:w-400,h-400`).
              name:
            )
            end

            sig { override.returns({ name: String }) }
            def to_hash
            end
          end
        end

        class TopOtherAssets < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::UsageAnalyticsResponse::TopOtherAssets,
                Imagekitio::Internal::AnyHash
              )
            end

          # Top non-image, non-video assets sorted by bandwidth utilized.
          sig do
            returns(
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::TopOtherAssets::ByBandwidth
              ]
            )
          end
          attr_accessor :by_bandwidth

          # Top non-image, non-video assets sorted by request count.
          sig do
            returns(
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::TopOtherAssets::ByRequest
              ]
            )
          end
          attr_accessor :by_requests

          # Top non-image, non-video assets by traffic.
          sig do
            params(
              by_bandwidth:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopOtherAssets::ByBandwidth::OrHash
                ],
              by_requests:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopOtherAssets::ByRequest::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # Top non-image, non-video assets sorted by bandwidth utilized.
            by_bandwidth:,
            # Top non-image, non-video assets sorted by request count.
            by_requests:
          )
          end

          sig do
            override.returns(
              {
                by_bandwidth:
                  T::Array[
                    Imagekitio::Accounts::UsageAnalyticsResponse::TopOtherAssets::ByBandwidth
                  ],
                by_requests:
                  T::Array[
                    Imagekitio::Accounts::UsageAnalyticsResponse::TopOtherAssets::ByRequest
                  ]
              }
            )
          end
          def to_hash
          end

          class ByBandwidth < Imagekitio::Models::Accounts::RequestBandwidthEntry
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopOtherAssets::ByBandwidth,
                  Imagekitio::Internal::AnyHash
                )
              end

            # URL of the non-image, non-video asset.
            sig { returns(String) }
            attr_accessor :name

            sig { params(name: String).returns(T.attached_class) }
            def self.new(
              # URL of the non-image, non-video asset.
              name:
            )
            end

            sig { override.returns({ name: String }) }
            def to_hash
            end
          end

          class ByRequest < Imagekitio::Models::Accounts::RequestBandwidthEntry
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopOtherAssets::ByRequest,
                  Imagekitio::Internal::AnyHash
                )
              end

            # URL of the non-image, non-video asset.
            sig { returns(String) }
            attr_accessor :name

            sig { params(name: String).returns(T.attached_class) }
            def self.new(
              # URL of the non-image, non-video asset.
              name:
            )
            end

            sig { override.returns({ name: String }) }
            def to_hash
            end
          end
        end

        class TopReferrers < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::UsageAnalyticsResponse::TopReferrers,
                Imagekitio::Internal::AnyHash
              )
            end

          # Top HTTP referrers sorted by bandwidth utilized.
          sig do
            returns(
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::TopReferrers::ByBandwidth
              ]
            )
          end
          attr_accessor :by_bandwidth

          # Top HTTP referrers sorted by request count.
          sig do
            returns(
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::TopReferrers::ByRequest
              ]
            )
          end
          attr_accessor :by_requests

          # Top HTTP referrers by traffic.
          sig do
            params(
              by_bandwidth:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopReferrers::ByBandwidth::OrHash
                ],
              by_requests:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopReferrers::ByRequest::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # Top HTTP referrers sorted by bandwidth utilized.
            by_bandwidth:,
            # Top HTTP referrers sorted by request count.
            by_requests:
          )
          end

          sig do
            override.returns(
              {
                by_bandwidth:
                  T::Array[
                    Imagekitio::Accounts::UsageAnalyticsResponse::TopReferrers::ByBandwidth
                  ],
                by_requests:
                  T::Array[
                    Imagekitio::Accounts::UsageAnalyticsResponse::TopReferrers::ByRequest
                  ]
              }
            )
          end
          def to_hash
          end

          class ByBandwidth < Imagekitio::Models::Accounts::RequestBandwidthEntry
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopReferrers::ByBandwidth,
                  Imagekitio::Internal::AnyHash
                )
              end

            # Referrer URL.
            sig { returns(String) }
            attr_accessor :name

            sig { params(name: String).returns(T.attached_class) }
            def self.new(
              # Referrer URL.
              name:
            )
            end

            sig { override.returns({ name: String }) }
            def to_hash
            end
          end

          class ByRequest < Imagekitio::Models::Accounts::RequestBandwidthEntry
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopReferrers::ByRequest,
                  Imagekitio::Internal::AnyHash
                )
              end

            # Referrer URL.
            sig { returns(String) }
            attr_accessor :name

            sig { params(name: String).returns(T.attached_class) }
            def self.new(
              # Referrer URL.
              name:
            )
            end

            sig { override.returns({ name: String }) }
            def to_hash
            end
          end
        end

        class TopUserAgents < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::UsageAnalyticsResponse::TopUserAgents,
                Imagekitio::Internal::AnyHash
              )
            end

          # Top user agents sorted by bandwidth utilized.
          sig do
            returns(
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::TopUserAgents::ByBandwidth
              ]
            )
          end
          attr_accessor :by_bandwidth

          # Top user agents sorted by request count.
          sig do
            returns(
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::TopUserAgents::ByRequest
              ]
            )
          end
          attr_accessor :by_requests

          # Top user agents by traffic.
          sig do
            params(
              by_bandwidth:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopUserAgents::ByBandwidth::OrHash
                ],
              by_requests:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopUserAgents::ByRequest::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # Top user agents sorted by bandwidth utilized.
            by_bandwidth:,
            # Top user agents sorted by request count.
            by_requests:
          )
          end

          sig do
            override.returns(
              {
                by_bandwidth:
                  T::Array[
                    Imagekitio::Accounts::UsageAnalyticsResponse::TopUserAgents::ByBandwidth
                  ],
                by_requests:
                  T::Array[
                    Imagekitio::Accounts::UsageAnalyticsResponse::TopUserAgents::ByRequest
                  ]
              }
            )
          end
          def to_hash
          end

          class ByBandwidth < Imagekitio::Models::Accounts::RequestBandwidthEntry
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopUserAgents::ByBandwidth,
                  Imagekitio::Internal::AnyHash
                )
              end

            # User agent string.
            sig { returns(String) }
            attr_accessor :name

            sig { params(name: String).returns(T.attached_class) }
            def self.new(
              # User agent string.
              name:
            )
            end

            sig { override.returns({ name: String }) }
            def to_hash
            end
          end

          class ByRequest < Imagekitio::Models::Accounts::RequestBandwidthEntry
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopUserAgents::ByRequest,
                  Imagekitio::Internal::AnyHash
                )
              end

            # User agent string.
            sig { returns(String) }
            attr_accessor :name

            sig { params(name: String).returns(T.attached_class) }
            def self.new(
              # User agent string.
              name:
            )
            end

            sig { override.returns({ name: String }) }
            def to_hash
            end
          end
        end

        class TopVideos < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::UsageAnalyticsResponse::TopVideos,
                Imagekitio::Internal::AnyHash
              )
            end

          # Top video assets sorted by bandwidth utilized.
          sig do
            returns(
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::TopVideos::ByBandwidth
              ]
            )
          end
          attr_accessor :by_bandwidth

          # Top video assets sorted by request count.
          sig do
            returns(
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::TopVideos::ByRequest
              ]
            )
          end
          attr_accessor :by_requests

          # Top video assets by traffic.
          sig do
            params(
              by_bandwidth:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopVideos::ByBandwidth::OrHash
                ],
              by_requests:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopVideos::ByRequest::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # Top video assets sorted by bandwidth utilized.
            by_bandwidth:,
            # Top video assets sorted by request count.
            by_requests:
          )
          end

          sig do
            override.returns(
              {
                by_bandwidth:
                  T::Array[
                    Imagekitio::Accounts::UsageAnalyticsResponse::TopVideos::ByBandwidth
                  ],
                by_requests:
                  T::Array[
                    Imagekitio::Accounts::UsageAnalyticsResponse::TopVideos::ByRequest
                  ]
              }
            )
          end
          def to_hash
          end

          class ByBandwidth < Imagekitio::Models::Accounts::RequestBandwidthEntry
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopVideos::ByBandwidth,
                  Imagekitio::Internal::AnyHash
                )
              end

            # URL of the video asset.
            sig { returns(String) }
            attr_accessor :name

            sig { params(name: String).returns(T.attached_class) }
            def self.new(
              # URL of the video asset.
              name:
            )
            end

            sig { override.returns({ name: String }) }
            def to_hash
            end
          end

          class ByRequest < Imagekitio::Models::Accounts::RequestBandwidthEntry
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopVideos::ByRequest,
                  Imagekitio::Internal::AnyHash
                )
              end

            # Full URL of the video asset (e.g. `https://ik.imagekit.io/demo/clip.mp4`).
            sig { returns(String) }
            attr_accessor :name

            sig { params(name: String).returns(T.attached_class) }
            def self.new(
              # Full URL of the video asset (e.g. `https://ik.imagekit.io/demo/clip.mp4`).
              name:
            )
            end

            sig { override.returns({ name: String }) }
            def to_hash
            end
          end
        end

        class TopVideoTransforms < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::UsageAnalyticsResponse::TopVideoTransforms,
                Imagekitio::Internal::AnyHash
              )
            end

          # Top video transformation strings sorted by bandwidth utilized.
          sig do
            returns(
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::TopVideoTransforms::ByBandwidth
              ]
            )
          end
          attr_accessor :by_bandwidth

          # Top video transformation strings sorted by request count.
          sig do
            returns(
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::TopVideoTransforms::ByRequest
              ]
            )
          end
          attr_accessor :by_requests

          # Top video transformation strings by traffic.
          sig do
            params(
              by_bandwidth:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopVideoTransforms::ByBandwidth::OrHash
                ],
              by_requests:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopVideoTransforms::ByRequest::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # Top video transformation strings sorted by bandwidth utilized.
            by_bandwidth:,
            # Top video transformation strings sorted by request count.
            by_requests:
          )
          end

          sig do
            override.returns(
              {
                by_bandwidth:
                  T::Array[
                    Imagekitio::Accounts::UsageAnalyticsResponse::TopVideoTransforms::ByBandwidth
                  ],
                by_requests:
                  T::Array[
                    Imagekitio::Accounts::UsageAnalyticsResponse::TopVideoTransforms::ByRequest
                  ]
              }
            )
          end
          def to_hash
          end

          class ByBandwidth < Imagekitio::Models::Accounts::RequestBandwidthEntry
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopVideoTransforms::ByBandwidth,
                  Imagekitio::Internal::AnyHash
                )
              end

            # Video transformation string (e.g. `tr:h-720,f-mp4`).
            sig { returns(String) }
            attr_accessor :name

            sig { params(name: String).returns(T.attached_class) }
            def self.new(
              # Video transformation string (e.g. `tr:h-720,f-mp4`).
              name:
            )
            end

            sig { override.returns({ name: String }) }
            def to_hash
            end
          end

          class ByRequest < Imagekitio::Models::Accounts::RequestBandwidthEntry
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::UsageAnalyticsResponse::TopVideoTransforms::ByRequest,
                  Imagekitio::Internal::AnyHash
                )
              end

            # Video transformation string (e.g. `tr:h-720,f-mp4`).
            sig { returns(String) }
            attr_accessor :name

            sig { params(name: String).returns(T.attached_class) }
            def self.new(
              # Video transformation string (e.g. `tr:h-720,f-mp4`).
              name:
            )
            end

            sig { override.returns({ name: String }) }
            def to_hash
            end
          end
        end

        class URLEndpoints < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::UsageAnalyticsResponse::URLEndpoints,
                Imagekitio::Internal::AnyHash
              )
            end

          # Top URL endpoints sorted by bandwidth utilized.
          sig do
            returns(
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::URLEndpoints::ByBandwidth
              ]
            )
          end
          attr_accessor :by_bandwidth

          # Top URL endpoints sorted by request count.
          sig do
            returns(
              T::Array[
                Imagekitio::Accounts::UsageAnalyticsResponse::URLEndpoints::ByRequest
              ]
            )
          end
          attr_accessor :by_requests

          # CDN traffic grouped by configured URL endpoint. Traffic that does not match any
          # named URL endpoint pattern is grouped under `Default`.
          sig do
            params(
              by_bandwidth:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::URLEndpoints::ByBandwidth::OrHash
                ],
              by_requests:
                T::Array[
                  Imagekitio::Accounts::UsageAnalyticsResponse::URLEndpoints::ByRequest::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # Top URL endpoints sorted by bandwidth utilized.
            by_bandwidth:,
            # Top URL endpoints sorted by request count.
            by_requests:
          )
          end

          sig do
            override.returns(
              {
                by_bandwidth:
                  T::Array[
                    Imagekitio::Accounts::UsageAnalyticsResponse::URLEndpoints::ByBandwidth
                  ],
                by_requests:
                  T::Array[
                    Imagekitio::Accounts::UsageAnalyticsResponse::URLEndpoints::ByRequest
                  ]
              }
            )
          end
          def to_hash
          end

          class ByBandwidth < Imagekitio::Models::Accounts::RequestBandwidthEntry
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::UsageAnalyticsResponse::URLEndpoints::ByBandwidth,
                  Imagekitio::Internal::AnyHash
                )
              end

            # URL endpoint name, or `Default` for traffic that does not match a named
            # endpoint.
            sig { returns(String) }
            attr_accessor :name

            sig { params(name: String).returns(T.attached_class) }
            def self.new(
              # URL endpoint name, or `Default` for traffic that does not match a named
              # endpoint.
              name:
            )
            end

            sig { override.returns({ name: String }) }
            def to_hash
            end
          end

          class ByRequest < Imagekitio::Models::Accounts::RequestBandwidthEntry
            OrHash =
              T.type_alias do
                T.any(
                  Imagekitio::Accounts::UsageAnalyticsResponse::URLEndpoints::ByRequest,
                  Imagekitio::Internal::AnyHash
                )
              end

            # URL endpoint name, or `Default` for traffic that does not match a named
            # endpoint.
            sig { returns(String) }
            attr_accessor :name

            sig { params(name: String).returns(T.attached_class) }
            def self.new(
              # URL endpoint name, or `Default` for traffic that does not match a named
              # endpoint.
              name:
            )
            end

            sig { override.returns({ name: String }) }
            def to_hash
            end
          end
        end

        class VideoProcessing < Imagekitio::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Imagekitio::Accounts::UsageAnalyticsResponse::VideoProcessing,
                Imagekitio::Internal::AnyHash
              )
            end

          # Video codec used for the output (e.g. `h264`, `av1`).
          sig { returns(String) }
          attr_accessor :codec

          # Total output duration, in seconds, for this resolution and codec combination.
          sig { returns(Float) }
          attr_accessor :duration_seconds

          # Output resolution tier (e.g. `SD`, `HD`, `4K`).
          sig { returns(String) }
          attr_accessor :resolution

          sig do
            params(
              codec: String,
              duration_seconds: Float,
              resolution: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Video codec used for the output (e.g. `h264`, `av1`).
            codec:,
            # Total output duration, in seconds, for this resolution and codec combination.
            duration_seconds:,
            # Output resolution tier (e.g. `SD`, `HD`, `4K`).
            resolution:
          )
          end

          sig do
            override.returns(
              { codec: String, duration_seconds: Float, resolution: String }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
