class FiPersonaDiagnosticosAtencionesSalud < ActiveRecord::Base

	belongs_to :persona_diagnostico, :class_name => 'FiPersonaDiagnosticos'
	belongs_to :atencion_salud, :class_name => 'FiAtencionesSalud'
	belongs_to :diagnostico_estado, :class_name => 'MedDiagnosticoEstados'

 
  private
  def app_params
    params.require(:list).permit(:atencion_salud,
  								:estado_diagnostico
  				  			:id,
  								:persona_diagnostico,
  								:prioridad)
  end
								
end