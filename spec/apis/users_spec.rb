require './spec/spec_helper'

describe APIs::Users do

  context 'GET /api/users' do
    subject { get '/api/users' }

    context 'when do not have users' do
      it { expect(subject.status).to eql(200) }
      it { expect(JSON.parse(subject.body)).to be_empty }
    end
  end
end