class DocumentsController < ApplicationController

  def index
    @documents = Document.all
    @flats_rented = flats_rented
    @rentings = Renting.all
  end

  private

  def flats_rented
    flats_rented = []
    flats = Flat.all
    flats.each do |flat|
      if !flat.rentings.empty?
        flats_rented << flat
      end
    end
    flats_rented
  end
end
