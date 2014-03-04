require 'spec_helper'

describe BonusGuard do
  context '#validate' do
    let(:bonus_code) { SecureRandom.hex }
    subject(:result) { described_class.validate(product, bonus_code) }

    context 'db strategy' do
      let(:product) { create :product }

      it 'bonus code is missing' do
        expect(result).to eq(:missing)
      end

      it 'bonus code is invalid' do
        create :bonus, product: product, code: bonus_code

        expect(result).to eq(:invalid)
      end

      it 'bonus code is valid' do
        create :bonus, :sold, product: product, code: bonus_code

        expect(result).to eq(:valid)
      end
    end

    context 'tv strategy' do
      let(:bonus_code) { 'vexor' }
      let(:product)    { build :product, :tv_bonus, :tv_status }

      context 'bonus code is missing' do
        let(:bonus_code) { 'no_found' }

        it do
          VCR.use_cassette(:tv_missing) do
            expect(result).to eq(:missing)
          end
        end
      end

      it 'bonus code is invalid' do
        product.name = "jenkins"

        VCR.use_cassette(:tv_exist) do
          expect(result).to eq(:invalid)
        end
      end

      it 'bonus code is valid' do
        product.name = "vexor"

        VCR.use_cassette(:tv_exist) do
          expect(result).to eq(:valid)
        end
      end
    end
  end
end
