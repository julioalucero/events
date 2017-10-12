# frozen_string_literal: true
require 'rails_helper'

describe FactoryGirl do
  describe '.lint' do
    it 'does not fail' do
      FactoryGirl.lint
    end
  end
end
