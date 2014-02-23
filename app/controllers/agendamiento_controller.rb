class AgendamientoController < ApplicationController
	
	include ApplicationHelper

	def showFormBusqueda

		if tieneRol('Genera agendamientos') 
			@profesionales = PerPersonas.where("id IN (SELECT profesional_id FROM pre_prestador_profesionales WHERE prestador_id = ? )",getIdPrestador)
   		@especialidades= ProEspecialidades.where("id IN (SELECT especialidad_id FROM pre_prestador_profesionales WHERE prestador_id= ? )",getIdPrestador)
    	
    else
			@profesionales=PerPersonas.where("id in (select profesional_id from pre_prestador_profesionales)").order('nombre,apellido_paterno,apellido_materno')
			@especialidades=ProEspecialidades.where("id in (select especialidad_id from pre_prestador_profesionales)").order('nombre')
			@prestadores=PrePrestadores.where("id in (select prestador_id from pre_prestador_profesionales)").order('nombre')
		end	
	end

	def showFormBusquedaActualizar
		resp=""
		if params[:type].eql? "especialista"
			PerPersonas.where("id in (select profesional_id from pre_prestador_profesionales where (('-1' <> ? AND especialidad_id= ?) OR ? = '-1') AND (('-1' <> ? AND prestador_id= ?) OR ? = '-1'))",params[:especialidad],params[:especialidad],params[:especialidad],params[:prestador],params[:prestador],params[:prestador]).order('nombre,apellido_paterno,apellido_materno').each do |p|
				resp<<"<li><a data-id=\"#{p.id}\">#{p.showName('%n%p%m')}</a></li>";		
			end
		elsif params[:type] == "especialidad"
			ProEspecialidades.where("id in (select especialidad_id from pre_prestador_profesionales where (('-1' <> ? AND profesional_id= ?) OR ? = '-1') AND (('-1' <> ? AND prestador_id= ?) OR ? = '-1'))",params[:especialista],params[:especialista],params[:especialista],params[:prestador],params[:prestador],params[:prestador]).order('nombre').each do |p|
				resp<<"<li><a data-id=\"#{p.id}\">#{p.nombre}</a></li>";		
			end
		elsif params[:type] == "prestador"
			PrePrestadores.where("id in (select prestador_id from pre_prestador_profesionales where (('-1' <> ? AND profesional_id= ?) OR ? = '-1') AND (('-1' <> ? AND especialidad_id= ?) OR ? = '-1'))",params[:especialista],params[:especialista],params[:especialista],params[:especialidad],params[:especialidad],params[:especialidad]).order('nombre').each do |p|
				resp<<"<li><a data-id=\"#{p.id}\">#{p.nombre}</a></li>";		
			end
		end
		render :text =>resp
	end


	def mostrarEventos
		
		if params[:evento_id]
			@Agendamiento=AgAgendamientos.where("id = ?",params[:evento_id]).first
			events=[]

			events << @Agendamiento.event
			respond_to do |f|
				f.json {render json:events}
			end

		else
			if params[:prestador_id] != "-1" and params[:especialidad_id] != "-1"
				events=[]
				@Fechas=AgAgendamientos.joins(:especialidad_prestador_profesional).where("pre_prestador_profesionales.especialidad_id = ? AND pre_prestador_profesionales.prestador_id = ? AND pre_prestador_profesionales.profesional_id = ?  ",params[:especialidad_id],params[:prestador_id],params[:profesional_id])
				#Filtrar por fechas si no quiere mostrarse todo (Puede ser algo como un año hacia adelante y un año hacia atrás)

				@Fechas.each do |f|
					events << f.event				
				end

				respond_to do |f|
					f.json {render json:events}
				end

			else
			
			end
		end

	end

	def pedirHora
		
		@breadcrumbs=[]
		if params[:especialidad_id] != "-1" or params[:profesional_id] != "-1" or params[:prestador_id] != "-1"
			@breadcrumbs_title= "Usted ha seleccionado"
			e=ProEspecialidades.where("id = ?",params[:especialidad_id]).first
			pre=PrePrestadores.where("id = ?",params[:prestador_id]).first
			pro=PerPersonas.where("id = ?",params[:profesional_id]).first
			if e
				@breadcrumbs << " #{e.nombre}"
			end
			if pre
				@breadcrumbs << " #{pre.nombre}"
			end
			if pro 
				@breadcrumbs << " #{pro.showName("%d%n%p")}"
			end

		else
			@breadcrumbs_title= "Usted no ha seleccionado ningún filtro"
		end

		@permisoParaAgregar=false
		if tieneRol('Genera agendamientos')
			@permisoParaAgregar=true 
		end	


	end

	def pedirHoraEvento

		#Posible problema por transacciones
		respuesta="0"
		@persona = PerPersonas.find_by id: current_user.id
		@Agendamiento=AgAgendamientos.where("id= ?",params[:agendamiento_id]).first
		@EstadoAgendamiento=AgAgendamientoEstados.where("nombre = ?","Hora reservada").first
		@Agendamiento.transaction do
			if @Agendamiento.agendamiento_estado.nombre=='Hora disponible'
				respuesta="1"
				@Agendamiento.persona=@persona
				@Agendamiento.agendamiento_estado=@EstadoAgendamiento
				@Agendamiento.save
			else
				respuesta="2"
			end
		end
		
		render :text=> respuesta
	end

	def detalleEvento
		@Agendamiento=AgAgendamientos.where("id= ?",params[:agendamiento_id]).first	
		tmp = '';
		tmp<<@Agendamiento.detalleHTML
		
		if tmp.length >0
			render :text=> tmp
		else
			flash[:tipo]="Agendamiento#detalleEvento"
		
			respond_to do |format|
				format.html {render "application/errors",layout:false}
			
			end
		end
	
	end

	def agregarNuevaHora 	
		
    @especialidad_prestador_profesional = PrePrestadorProfesionales.where(" prestador_id = ? AND profesional_id = ? AND especialidad_id = ?",params[:prestador_id],params[:profesional_id],params[:especialidad_id]).first


    events=[]

		@EstadoAgendamiento= AgAgendamientoEstados.where("nombre = ?","Hora disponible").first

		if params[:tipo]=='diario'
		fecha_comienzo=DateTime.strptime(params[:date_i],'%Y-%m-%d %H:%M:%S.%L')
		fecha_termino=DateTime.strptime(params[:date_f],'%Y-%m-%d %H:%M:%S.%L')
		step=params[:step]
			while fecha_comienzo < fecha_termino do
				tmp_i=fecha_comienzo
				tmp_f=fecha_comienzo+step.to_i.minutes

				#Aquí debiera existir un filtro que permita validar que se pueda colocar esta hora
				#o incluso fuera del paréntesis para que se rechacen todas las horas (de ser necesario)

				@Agendamiento=AgAgendamientos.new
				@Agendamiento.fecha_comienzo=tmp_i
				@Agendamiento.fecha_final=tmp_f
				@Agendamiento.agendamiento_estado=@EstadoAgendamiento
				@Agendamiento.especialidad_prestador_profesional=@especialidad_prestador_profesional
				@Agendamiento.administrativo=PerPersonas.find(current_user.id) 
				@Agendamiento.save

				events << @Agendamiento.event

				fecha_comienzo=tmp_f
			end
		elsif params[:tipo]=='comportamiento'
			fecha_inicio=DateTime.strptime(params[:date_i],'%Y-%m-%d %H:%M:%S.%L')
			fecha_final=DateTime.strptime(params[:date_f],'%Y-%m-%d %H:%M:%S.%L')
			step=params[:step]
			daysOfWeek=JSON.parse(params[:days])
			hora_inicio=params[:hora_i]
			hora_termino=params[:hora_t]

			days=[]
			d_i=fecha_inicio
			d_f=fecha_final
			while d_i < d_f do
				tmp_i = d_i
				tmp_f = d_i+1.days
				if daysOfWeek[tmp_i.strftime("%w").to_i]
					days << tmp_i
				end

				d_i=tmp_f
			end

			days.each do |d|

				tmp=d.strftime("%Y-%m-%d")+" "+hora_inicio
				d_i=DateTime.strptime(tmp,"%Y-%m-%d %H:%M")
				tmp=d.strftime("%Y-%m-%d")+" "+hora_termino
				d_f=DateTime.strptime(tmp,"%Y-%m-%d %H:%M")
				if d_f<=d_i
					d_f=d_f+1.days
				end


				fecha_comienzo=d_i
				fecha_termino=d_f

				while fecha_comienzo < fecha_termino do

					tmp_i=fecha_comienzo
					tmp_f=fecha_comienzo+step.to_i.minutes

					#Aquí debiera existir un filtro que permita validar que se pueda colocar esta hora
					#o incluso fuera del paréntesis para que se rechacen todas las horas (de ser necesario)

					@Agendamiento=AgAgendamientos.new
					@Agendamiento.fecha_comienzo=tmp_i
					@Agendamiento.fecha_final=tmp_f
					@Agendamiento.agendamiento_estado=@EstadoAgendamiento
					@Agendamiento.especialidad_prestador_profesional=@especialidad_prestador_profesional
					@Agendamiento.administrativo=PerPersonas.find(current_user.id) 
					@Agendamiento.save
					
					events << @Agendamiento.event

					fecha_comienzo=tmp_f
				end #while
			end #days.each
			else
				events << { 
					'id'				=> 'err',
					'title' 			=> 'No se pudo...',
					'start' 			=> fecha_inicio.strftime("%Y-%m-%d %H:%M")+":00.0",
					'end'				=> fecha_final.strftime("%Y-%m-%d %H:%M")+":00.0",
					'allDay'			=> false,
					'color'				=> 'red',
					'textColor'			=> '#FFFFFF'
				}
			end
    


    


		respond_to do |format|
			format.json { render json: events}
		end
	
	end #Fin agregarNuevaHora

end
