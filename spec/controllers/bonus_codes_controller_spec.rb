require 'spec_helper'

describe BonusCodesController do
  context '#validate' do
    let(:product_id) { rand(200) }
    let(:bonus_code) { SecureRandom.hex }
    let(:product)    { double(Product) }

    before do
      Product.stub(:find).with(product_id.to_s).and_return(product)
      stub_const("BonusGuard", double)
    end

    specify('an inputed code is valid')   { expected_response :valid, 200 }
    specify('an inputed code is invalid') { expected_response :invalid, 403 }
    specify('an inputed code is missing') { expected_response :missing, 404 }

    def expected_response(message, status)
      BonusGuard.stub(:validate).with(product, bonus_code).and_return(message)

     get :validate, product_id: product_id, bonus_code: bonus_code

     expect(response.code).to eq(status.to_s)
    end
  end
end
