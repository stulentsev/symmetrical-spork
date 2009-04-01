class PartnersController < ApplicationController
  def edit
    @partner = Partner.find(params[:id])
  end

  def create
    @partner = Partner.new(params[:partner])
    @partner.save
  end

  def update
    @partner = Partner.find(params[:id])
    @partner.update_attributes(params[:partner])
  end

  def destroy
    @partner = Partner.find(params[:id])
    @partner.destroy
  end
end
