puts 'ENO'
eno_list = [
	[1,'Cólera'],
	[2,'Fiebre Tifoidea y Paratifoidea'],
	[3,'Diarreas Agudas en Menores de 5 Años'],
	[4,'Botulismo'],
	[5,'Tuberculosis'],
	[6,'Peste'],
	[7,'Carbunco'],
	[8,'Brucelosis'],
	[9,'Leptospirosis'],
	[10,'Lepra (Enfermedad de Hansen)'],
	[11,'Meningitis Bacterianas'],
	[12,'Tétanos'],
	[13,'Difteria'],
	[14,'Coqueluche'],
	[15,'Enferemedad Meningocócica'],
	[16,'Enfermedad Invasora por Haemophilus Influenzae B'],
	[17,'Sífilis'],
	[18,'Gonorrea'],
	[19,'Psitacosis'],
	[20,'Tifus Exantemático Epidérmico'],
	[21,'Poliomelitis'],
	[22,'Enfermedad de Creutzfeldt Jakob'],
	[23,'Rabia Humana'],
	[24,'Dengue'],
	[25,'Fiebre del Nilo Occidental (West Nile)'],
	[26,'Fiebre Amarilla'],
	[27,'Varicela'],
	[28,'Sarampión'],
	[29,'Rubéola'],
	[30,'Hepatitis A, Viral in otra especificación'],
	[31,'Hepatitis B'],
	[32,'Hepatitis C'],
	[33,'Infección por VIH y SIDA'],
	[34,'Parotiditis'],
	[35,'Infección por Hantavirus'],
	[36,'Malaria'],
	[37,'Enfermedad de Chagas (Tripanosomiasis Americana)'],
	[38,'Hidatidosis (Equinocococis)'],
	[39,'Triquinosis'],
	[40,'Infección Respiratoria Aguda grave por Influenza'],
	[41,'Rubéola Congénita'],
	[42,'Vibrio parahaemolyticus'],
	[43,'Influenza'],
]

ActiveRecord::Base.transaction do
	eno_list.each do |id, nombre|
	  MedEno.create( id: id, nombre: nombre )
	end
end	