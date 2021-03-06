require 'test_helper'

module Elasticsearch
  module Test
    class IndicesGetSettingsTest < ::Test::Unit::TestCase

      context "Indices: Get settings" do
        subject { FakeClient.new }

        should "perform correct request" do
          subject.expects(:perform_request).with do |method, url, params, body|
            assert_equal 'GET', method
            assert_equal '_settings', url
            assert_equal Hash.new, params
            assert_nil   body
            true
          end.returns(FakeResponse.new)

          subject.indices.get_settings
        end

        should "perform request against an index" do
          subject.expects(:perform_request).with do |method, url, params, body|
            assert_equal 'foo/_settings', url
            true
          end.returns(FakeResponse.new)

          subject.indices.get_settings :index => 'foo'
        end

      end

    end
  end
end
