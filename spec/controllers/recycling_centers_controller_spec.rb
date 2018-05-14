require 'spec_helper'

describe RecyclingCentersController, type: :controller do
  describe 'GET index' do
    before do
      @recycling_center = create(:recycling_center)
      @recycling_center2 = create(:recycling_center2)
      get :index
    end

    it 'successfully responds to request' do
      expect(response.code).to eq('200')
    end

    it 'assigns records to the instance variable' do
      expect(assigns(:recycling_centers)).to match_array([@recycling_center, @recycling_center2])
    end
  end

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
        allow(controller).to receive(:recycling_center).and_return(recycling_center_double)

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

      before do
        allow(controller).to receive(:recycling_center).and_return(recycling_center_double)
      end

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

  describe 'PUT update' do
    before do
      @recycling_center = create(:recycling_center)
      put :update, id: @recycling_center.id,
        recycling_center: { name: "Joe's New Recycling Center" }
    end

    context 'success' do
      it 'updates the record' do
        expect(RecyclingCenter.find(@recycling_center.id).name).to eq("Joe's New Recycling Center")
      end

      it 'redirects the user to the show page' do
        expect(response).to redirect_to(recycling_center_path(@recycling_center))
      end

      it 'assigns the instance variable' do
        expect(assigns(:recycling_center)).to eq(@recycling_center)
      end
    end

    context 'failure' do
      it 're-renders the edit form' do
        allow_any_instance_of(RecyclingCenter).to receive(:update).and_return(false)
        put :update, id: @recycling_center.id,
          recycling_center: { name: "Bob's Recycling Center" }
        expect(response).to render_template('edit')
      end

      it "won't allow removing existing state field" do
        original_state = @recycling_center.state
        put :update, id: @recycling_center.id,
          recycling_center: attributes_for(:recycling_center).except(:state)
        expect(RecyclingCenter.find(@recycling_center.id).state).to eq(original_state)
      end
    end
  end

  describe 'POST search' do
    it 'renders the search results' do
      post :search, zip: attributes_for(:recycling_center)[:zip]
      expect(response).to render_template('search')
    end

    it 'assigns records where first two digits of zip match' do
      @recycling_center = create(:recycling_center)
      @recycling_center2 = create(:recycling_center2)
      post :search, zip: attributes_for(:recycling_center)[:zip]
      expect(assigns(:recycling_centers)).to match_array([@recycling_center])
      expect(assigns(:recycling_centers)).to_not include(@recycling_center2)
    end
  end
end
