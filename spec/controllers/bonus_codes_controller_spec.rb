require 'spec_helper'

describe BonusCodesController do
  context '#validate' do
    let(:product_id) { rand(200) }
    let(:bonus_code) { SecureRandom.hex }
    let(:product)    { build :product }

    before do
      Product.stub(:find).with(product_id.to_s).and_return(product)
    end

    specify('an inputed code is valid')   { expected_response :valid, 200 }
    specify('an inputed code is invalid') { expected_response :invalid, 403 }

    it 'an inputed code is missing' do
      assert_response 404
    end

    def expected_response(message, status)
      BonusGuard.stub(:validate).with(product, bonus_code).and_return(message)

      assert_response status
    end

    def assert_response(status)
      get :validate, product_id: product_id, bonus_code: bonus_code

      expect(response.code).to eq(status.to_s)
    end
  end
end
