class ProEspecialidades < ActiveRecord::Base

	has_many :profesionales, :class_name => 'ProProfesionales', :foreign_key => 'especialidad_id'
	has_many :prestadores_profesionales_especialidad, :class_name => 'PrePrestadorProfesionales', :foreign_key => 'especialidad_id'
	has_many :especialidades_interconsulta, :class_name => 'FiInterconsultas', :foreign_key => 'especialidad_id'
	belongs_to :prestacion, :class_name => 'MedPrestaciones' 

  private
  def app_params
    params.require(:list).permit(:id,:nombre,:prestacion,:profesionales,:prestadores_profesionales_especialidad,:especialidades_interconsulta)
  end
									
end
