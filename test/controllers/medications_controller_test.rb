class MedicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @medications = current_user.medications
  end

  def show
  end

  def new
    @medication = current_user.medications.build
  end

  def create
    @medication = current_user.medications.build(medication_params)
    if @medication.save
      redirect_to medications_path, notice: 'Medicamento adicionado com sucesso.'
    else
      render :new
    end
  end

  def edit
    @medication = current_user.medications.find(params[:id])
  end

  def update
    @medication = current_user.medications.find(params[:id])
    if @medication.update(medication_params)
      redirect_to medications_path, notice: 'Medicamento atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @medication = current_user.medications.find(params[:id])
    @medication.destroy
    redirect_to medications_path, notice: 'Medicamento removido com sucesso.'
  end

  private

  def medication_params
    params.require(:medication).permit(:name, :dosage, :frequency)
  end
end
