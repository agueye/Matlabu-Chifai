require 'spec_helper'

describe DoctorsController do

  def mock_doctor(stubs={})
    @mock_doctor ||= mock_model(Doctor, stubs)
  end

  describe "GET index" do
    it "assigns all doctors as @doctors" do
      Doctor.stub!(:find).with(:all).and_return([mock_doctor])
      get :index
      assigns[:doctors].should == [mock_doctor]
    end
  end

  describe "GET show" do
    it "assigns the requested doctor as @doctor" do
      Doctor.stub!(:find).with("37").and_return(mock_doctor)
      get :show, :id => "37"
      assigns[:doctor].should equal(mock_doctor)
    end
  end

  describe "GET new" do
    it "assigns a new doctor as @doctor" do
      Doctor.stub!(:new).and_return(mock_doctor)
      get :new
      assigns[:doctor].should equal(mock_doctor)
    end
  end

  describe "GET edit" do
    it "assigns the requested doctor as @doctor" do
      Doctor.stub!(:find).with("37").and_return(mock_doctor)
      get :edit, :id => "37"
      assigns[:doctor].should equal(mock_doctor)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created doctor as @doctor" do
        Doctor.stub!(:new).with({'these' => 'params'}).and_return(mock_doctor(:save => true))
        post :create, :doctor => {:these => 'params'}
        assigns[:doctor].should equal(mock_doctor)
      end

      it "redirects to the created doctor" do
        Doctor.stub!(:new).and_return(mock_doctor(:save => true))
        post :create, :doctor => {}
        response.should redirect_to(doctor_url(mock_doctor))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved doctor as @doctor" do
        Doctor.stub!(:new).with({'these' => 'params'}).and_return(mock_doctor(:save => false))
        post :create, :doctor => {:these => 'params'}
        assigns[:doctor].should equal(mock_doctor)
      end

      it "re-renders the 'new' template" do
        Doctor.stub!(:new).and_return(mock_doctor(:save => false))
        post :create, :doctor => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested doctor" do
        Doctor.should_receive(:find).with("37").and_return(mock_doctor)
        mock_doctor.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :doctor => {:these => 'params'}
      end

      it "assigns the requested doctor as @doctor" do
        Doctor.stub!(:find).and_return(mock_doctor(:update_attributes => true))
        put :update, :id => "1"
        assigns[:doctor].should equal(mock_doctor)
      end

      it "redirects to the doctor" do
        Doctor.stub!(:find).and_return(mock_doctor(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(doctor_url(mock_doctor))
      end
    end

    describe "with invalid params" do
      it "updates the requested doctor" do
        Doctor.should_receive(:find).with("37").and_return(mock_doctor)
        mock_doctor.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :doctor => {:these => 'params'}
      end

      it "assigns the doctor as @doctor" do
        Doctor.stub!(:find).and_return(mock_doctor(:update_attributes => false))
        put :update, :id => "1"
        assigns[:doctor].should equal(mock_doctor)
      end

      it "re-renders the 'edit' template" do
        Doctor.stub!(:find).and_return(mock_doctor(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested doctor" do
      Doctor.should_receive(:find).with("37").and_return(mock_doctor)
      mock_doctor.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the doctors list" do
      Doctor.stub!(:find).and_return(mock_doctor(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(doctors_url)
    end
  end

end
