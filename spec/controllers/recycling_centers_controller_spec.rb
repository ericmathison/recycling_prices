require 'spec_helper'

describe RecyclingCentersController do
  describe 'GET new' do
    it 'successfully returns a new form' do
      get :new

      expect(response.code).to eq('200')
      expect(assigns[:recycling_center]).to be_present
    end
  end

  describe 'POST create' do
    context 'when successful' do
      it 'creates the record' do
        recycling_center_double = double(RecyclingCenter, save: true)
        controller.stub(:recycling_center).and_return(recycling_center_double)

        post :create, recycling_center: { name: 'george' }

        expect(recycling_center_double).to have_received(:save)
      end

      it 'redirects the user to the show page' do
        post :create, recycling_center: attributes_for(:recycling_center)

        record = RecyclingCenter.last

        expect(response.code).to eq('302')
        expect(response).to redirect_to(recycling_center_path(record))
      end
    end

    context 'when unsuccessful' do
      let(:recycling_center_double) { double(RecyclingCenter, save: false) }
      before { controller.stub(:recycling_center).and_return(recycling_center_double) }

      it 're-renders the new form' do
        post :create, recycling_center: { name: 'george' }
        expect(recycling_center_double).to have_received(:save)
        expect(response).to render_template('new')
      end
    end
  end

  describe 'GET show' do
    it 'will display the resource' do
      record = create(:recycling_center)
      get :show, id: record.id
      expect(response.code).to eq('200')
      expect(assigns[:recycling_center]).to eq(record)
    end
  end

  describe 'GET edit' do
    it 'will display the resource' do
      record = create(:recycling_center)
      get :edit, id: record.id
      expect(response.code).to eq('200')
      expect(assigns[:recycling_center]).to eq(record)
    end
  end
end
