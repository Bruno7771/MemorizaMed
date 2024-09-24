class MedicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_medication, only: [:edit, :update, :destroy]

  def index
    @medications = current_user.medications
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
  end

  def update
    if @medication.update(medication_params)
      redirect_to medications_path, notice: 'Medicamento atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @medication.destroy
    redirect_to root_path, notice: 'Medicamento removido com sucesso.'
  end

  private

  def set_medication
    @medication = current_user.medications.find(params[:id])
  end

  def medication_params
    params.require(:medication).permit(:name, :dosage, :frequency)
  end
end
