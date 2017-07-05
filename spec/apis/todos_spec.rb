require './spec/spec_helper'

describe APIs::Todos do

  context 'GET /api/todos' do
    subject { get '/api/todos' }

    context 'when do not have todos' do
      it { expect(subject.status).to eql(200) }
      it { expect(JSON.parse(subject.body)).to be_empty }
    end

    context 'when have todos' do
      before { create(:todo) }

      it { expect(subject.status).to eql(200) }
      it { expect(JSON.parse(subject.body)).to have_exactly(1).items }
    end

  end

  context 'POST /api/todos' do
    subject { post '/api/todos', params }

    context 'when params are invalid' do
      let(:params) {}
      it { expect(subject.status).to eql(400) }
      it { expect(JSON.parse(subject.body)).to be_eql('task is missing') }
    end

    context 'when params are valid' do
      let(:params) { { task: 'Just another task' } }

      it { expect(subject.status).to eql(201)                         }
      it { expect(JSON.parse(subject.body)).to have_key('id')         }
      it { expect(JSON.parse(subject.body)).to have_key('task')       }
      it { expect(JSON.parse(subject.body)).to have_key('done')       }
      it { expect(JSON.parse(subject.body)).to have_key('created_at') }
      it { expect(JSON.parse(subject.body)).to have_key('updated_at') }
    end

  end

  context 'GET /api/todos/:id' do
    subject { get "/api/todos/1" }

    context 'when todo is not found' do
      it { expect(subject.status).to eql(404) }
      it { expect(subject.body).to be_empty   }
    end

    context 'when todo is found' do
      before { create(:todo, id: 1) }

      it { expect(subject.status).to eql(200) }
      it { expect(JSON.parse(subject.body)).to have_key('id')         }
      it { expect(JSON.parse(subject.body)).to have_key('task')       }
      it { expect(JSON.parse(subject.body)).to have_key('done')       }
      it { expect(JSON.parse(subject.body)).to have_key('created_at') }
      it { expect(JSON.parse(subject.body)).to have_key('updated_at') }
    end
  end

  context 'PUT /api/todos/:id' do
    subject { put "/api/todos/1", params }

    let!(:params) do
      { 
        task: 'Something done',
        done: true
      }
    end

    context 'when todo is not found' do
      it { expect(subject.status).to eql(404) }
      it { expect(subject.body).to be_empty   }
    end

    context 'when todo is found' do
      before { create(:todo, id: 1, task: 'Something undone', done: false) }

      it { expect(subject.status).to eql(204) }
      it { expect(subject.body).to be_empty   }
    end
  end
end