class BackersController < ApplicationController

  def create

    @backer = Backer.new(backer_params)
    @backer.record = Record.find(params[:record_id])
    if @backer.save
      redirect_to records_path, notice: "Ton garant a été créé ! A toi de jouer maintenant"
    else
      redirect_to records_path, notice: "Il y a eu un soucis !"
    end
  end

  def destroy
    set_backer
    @backer.destroy
    redirect_to records_path, notice: "Ton garant a été supprimé"
  end

  private

  def set_backer
    @backer = Backer.find(params[:id])
  end

  def backer_params
    params.require(:backer).permit(:record, :first_name, :last_name, :email)
  end
end
