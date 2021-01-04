describe Bandwidth::V2::ResponseHandler do
  describe '#check_response' do
    let(:response_mock) do
      OpenStruct.new(
        status: 400,
        body: { errorCode: 12345, description: 'desc' }.to_json
      )
    end

    let(:response_handler) { described_class.new(response_mock) }

    it 'raises Bandwidth::Errors::GenericError' do
      expect { response_handler.check_response }.to raise_error(Bandwidth::Errors::GenericError) do |error|
        expect(error.code).to eq(12345)
        expect(error.message).to eq('desc')
      end
    end
  end
end
