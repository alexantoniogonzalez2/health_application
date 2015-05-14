class MedDiagnosticos < ActiveRecord::Base

	has_many :persona_diagnosticos, :class_name => 'FiPersonaDiagnosticos', :foreign_key => 'diagnostico_id'
  has_many :problemas_salud_auge_diagnosticos, :class_name => 'MedProblemasSaludAugeDiagnosticos', :foreign_key => 'diagnostico_id'
  has_many :eno_diagnostico, :class_name => 'MedEno', :foreign_key => 'diagnostico_id'
  has_many :causa_muerte, :class_name => 'PerPersonas', :foreign_key => 'diagnostico_muerte_id'
 
  belongs_to :grupo, :class_name => 'MedDiagnosticosGrupos'

  def formato_lista

    {'id' => id,'text' => codigo_cie10 + ' ' + nombre}

  end  

  def esAuge
    true
  end  

  def esENO
    true
  end

  private
  def app_params
    params.require(:list).permit(:codigo_cie10,:genero,:descripcion,:frecuente,:nodo_terminal,:grupo,:id,:nombre,:persona_diagnosticos,:problemas_salud_auge_diagnosticos,:eno_diagnostico,:causa_muerte)
  end
							  
end
