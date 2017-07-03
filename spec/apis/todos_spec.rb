require './spec/spec_helper'

describe APIs::Todos do

  context 'GET /api/todos' do
    subject { get '/api/todos' }

    context 'when do not have todos' do
      it { expect(subject.status).to eql(200) }
      it { expect(JSON.parse(subject.body)).to be_empty }
    end

    context 'when have todos' do
      before(:all) { create(:todo) }

      it { expect(subject.status).to eql(200) }
      it { expect(JSON.parse(subject.body)).to have_exactly(1).items }
    end


  end
end