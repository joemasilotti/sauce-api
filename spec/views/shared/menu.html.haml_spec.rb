require 'spec_helper'

describe "shared/_menu" do
  describe "a link to the sauces index page" do
    let(:sauces_link) { page.find('.nav').find('a', :text => 'Sauces') }
    let(:parent_element) { sauces_link.find(:xpath, '..') }

    it "should always be present" do
      render
      expect(sauces_link).to be
    end

    context "when the current controller is sauces" do
      before do
        params[:controller] = 'sauces'
      end

      it "should have an 'active' class" do
        render
        expect(parent_element[:class]).to eq('active')
      end
    end

    context "when the current page is a detail view of a sauce" do
      before do
        params[:controller] = 'sauces'
        params[:id] = '1'
        render
      end

      it "should have an 'active' class" do
        expect(parent_element[:class]).to eq('active')
      end
    end

    context "when the current page is a manufacturers page" do
      before do
        params[:controller] = 'manufacturers'
        render
      end

      it "should not have an 'active' class" do
        expect(parent_element[:class]).to eq('')
      end
    end

    context "when the current page is a flavor page" do
      before do
        params[:controller] = 'flavors'
        render
      end

      it "should not have an 'active' class" do
        expect(parent_element[:class]).to eq('')
      end
    end
  end

  describe "a link to the manufacturers index page" do
    let(:manufacturers_link) { page.find('.nav').find('a', :text => 'Manufacturers') }
    let(:parent_element) { manufacturers_link.find(:xpath, '..') }

    it "should always be present" do
      render
      expect(manufacturers_link).to be
    end

    context "when the current controller is manufacturers" do
      before do
        params[:controller] = 'manufacturers'
      end

      it "should have an 'active' class" do
        render
        expect(parent_element[:class]).to eq('active')
      end
    end

    context "when the current page is a detail view of a manufacturer" do
      before do
        params[:controller] = 'manufacturers'
        params[:id] = '1'
        render
      end

      it "should have an 'active' class" do
        expect(parent_element[:class]).to eq('active')
      end
    end

    context "when the current page is a sauce page" do
      before do
        params[:controller] = 'sauces'
        render
      end

      it "should not have an 'active' class" do
        expect(parent_element[:class]).to eq('')
      end
    end

    context "when the current page is a flavor page" do
      before do
        params[:controller] = 'flavor'
        render
      end

      it "should not have an 'active' class" do
        expect(parent_element[:class]).to eq('')
      end
    end
  end

  describe "a link to the flavors index page" do
    let(:flavors_link) { page.find('.nav').find('a', :text => 'Flavors') }
    let(:parent_element) { flavors_link.find(:xpath, '..') }

    it "should always be present" do
      render
      expect(flavors_link).to be
    end

    context "when the current controller is flavors" do
      before do
        params[:controller] = 'flavors'
      end

      it "should have an 'active' class" do
        render
        expect(parent_element[:class]).to eq('active')
      end
    end

    context "when the current page is a detail view of a flavor" do
      before do
        params[:controller] = 'flavors'
        params[:id] = '1'
        render
      end

      it "should have an 'active' class" do
        expect(parent_element[:class]).to eq('active')
      end
    end

    context "when the current page is a sauce page" do
      before do
        params[:controller] = 'sauces'
        render
      end

      it "should not have an 'active' class" do
        expect(parent_element[:class]).to eq('')
      end
    end

    context "when the current page is a manufacturer page" do
      before do
        params[:controller] = 'manufacturers'
        render
      end

      it "should not have an 'active' class" do
        expect(parent_element[:class]).to eq('')
      end
    end
  end
end
