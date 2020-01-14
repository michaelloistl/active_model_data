require 'spec_helper'
require 'support/active_record.rb'
require 'active_model_data'

RSpec.describe ActiveModelData do

  def user
    user_class = Class.new(ActiveRecord::Base)
    user_class.include ActiveModelData
    user_class.table_name = :users
    user_class.class_eval do
      def self.model_name
        ActiveModel::Name.new(self, nil, "User")
      end
    end
    yield(user_class)

    user_class.new
  end

  after do
    I18n.backend.reload!
  end

  it 'has a version number' do
    expect(ActiveModelData::VERSION).not_to be nil
  end

  describe 'value' do
    before do
      @user = user do |user_class|
        user_class.class_eval do
          model_data_field :foo
        end
      end
    end

    it "returns foo_value nil" do
      expect(@user.foo_value).to be_nil
    end

    it 'returns foo_value when set' do
      @user.model_data = { foo: 'foo value' }
      expect(@user.foo_value).to eq('foo value')
    end

    it 'sets new value' do
      @user.model_data = { foo: 'foo value' }
      @user.foo_value = 'new foo value'
      expect(@user.foo_value).to eq('new foo value')
    end
  end

  describe 'default' do
    before do
      @user = user do |user_class|
        user_class.class_eval do
          model_data_field :foo, default: 'default value'
        end
      end
    end

    it 'sets default value' do
      expect(@user.foo_value).to eq('default value')
    end

    it "doesn't set default value" do
      @user.model_data = { foo: 'foo value' }
      expect(@user.foo_value).to eq('foo value')
    end
  end

  describe 'options' do
  end

  describe 'key_values' do
  end

  describe 'validates' do
  end
end

