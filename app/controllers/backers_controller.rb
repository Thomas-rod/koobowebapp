class BackersController < ApplicationController

  def create
    @backer = Backer.new(backer_params)
    @backer.create
    redirect_to records_path, notice: "Ton garant a été créé ! A toi de jouer maintenant"
  end

  private

  def backer_params
    params.require(:backer).permit(:record, :first_name, :last_name, :phone_number, :email)

  end
end
